//
//  NSString+Validation.m
//  HWCategory
//
//  Created by HW on 2018/2/11.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)
// MARK: EMPTY

- (BOOL)isEmpty {
	
	if (self == nil) {
		return YES;
	}
	
	if ([self isEqualToString:@""]) {
		return YES;
	}
	
	// FOR AFNETWORKING JSON PARSER
	if ([[NSString stringWithFormat:@"%@", self] isEqualToString:@"(null)"] ||
		[[NSString stringWithFormat:@"%@", self] isEqualToString:@"<null>"]) {
		return YES;
	}
	
	return NO;
}
// MARK: EMAIL

- (BOOL)isEmail {
	
	// RFC 2822
	
	NSString *emailRegex =
	@"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
	@"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
	@"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
	@"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
	@"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
	@"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
	@"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
	
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
	
	return [emailTest evaluateWithObject:self];
	
}

// MARK: ID

- (BOOL)isIDCardNumber {
	return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"\\d{15}|\\d{17}(\\d|[xX])$"] evaluateWithObject:self];
}

- (BOOL)isStrictIDCardNumber {
	
	if (self.length != 15 && self.length != 18) {
		return NO;
	}
	
	NSArray *provinces = @[
						   @"11",/* 北京 */ @"12",/* 天津 */
						   @"13",/* 河北 */ @"14",/* 山西 */ @"15",/* 内蒙古 */
						   @"21",/* 辽宁 */ @"22",/* 吉林 */ @"23",/* 黑龙江 */
						   @"31",/* 上海 */
						   @"32",/* 江苏 */ @"33",/* 浙江 */ @"34",/* 安徽 */
						   @"35",/* 福建 */ @"36",/* 江西 */ @"37",/* 山东 */
						   @"41",/* 河南 */ @"42",/* 湖北 */ @"43",/* 湖南 */
						   @"44",/* 广东 */ @"45",/* 广西 */ @"46",/* 海南 */
						   @"50",/* 重庆 */ @"51",/* 四川 */ @"52",/* 贵州 */
						   @"53",/* 云南 */ @"54",/* 西藏 */
						   @"61",/* 陕西 */ @"62",/* 甘肃 */ @"63",/* 青海 */
						   @"64",/* 宁夏 */ @"65",//"新疆 */
						   @"71",/* 台湾 */
						   @"81",/* 香港 */ @"82",/* 澳门 */
						   @"91",//"国外"
						   ];
	
	if ([provinces containsObject:[self substringToIndex:2]] == NO) {
		return NO;
	}
	// PASSED PROVINCE CHECK
	
	NSString *strBirth;
	if (self.length == 15) {
		strBirth = [NSString stringWithFormat:@"19%@", [self substringWithRange:NSMakeRange(6, 6)]];
	} else if (self.length == 18) {
		strBirth = [self substringWithRange:NSMakeRange(6, 8)];
	}
	
	if ([[strBirth substringWithRange:NSMakeRange(4, 2)] intValue] > 12) {
		return NO;
	}
	
	if ([[strBirth substringWithRange:NSMakeRange(6, 2)] intValue] > 31) {
		return NO;
	}
	
	if (self.length == 18) {
		
		NSMutableArray *chars = [NSMutableArray arrayWithCapacity:1];
		for (int i = 0; i < self.length; i++) {
			NSRange composedCharRange = [self rangeOfComposedCharacterSequenceAtIndex:i];
			NSString *character = [self substringWithRange:composedCharRange];
			if (character) {
				[chars addObject:character];
			}
		}
		
		NSInteger encode = ([chars[0] intValue] + [chars[10] intValue]) * 7
		+ ([chars[1] intValue] + [chars[11] intValue]) * 9
		+ ([chars[2] intValue] + [chars[12] intValue]) * 10
		+ ([chars[3] intValue] + [chars[13] intValue]) * 5
		+ ([chars[4] intValue] + [chars[14] intValue]) * 8
		+ ([chars[5] intValue] + [chars[15] intValue]) * 4
		+ ([chars[6] intValue] + [chars[16] intValue]) * 2
		+ [chars[7] intValue] * 1
		+ [chars[8] intValue] * 6
		+ [chars[9] intValue] * 3;
		
		NSString *validationString = @"10X98765432";
		NSString *validRet = [validationString substringWithRange:NSMakeRange(encode % 11, 1)];
		if ([[validRet uppercaseString] isEqualToString:[[self substringFromIndex:17] uppercaseString]] == NO) {
			return NO;
		}
	}
	
	return YES;
}

- (BOOL)isPhoneNumber {
	
	/*
	 Updated : 2017-03-01
	 China Mobile：	134 135 136 137 138 139 147 150 151 152 157 158 159 178 182 183 184 187 188
	 China Unicom：	130 131 132 145 155 156 171 175 176 185 186
	 China Telecom：	133 149 153 173 177 180 181 189
	 虚拟运营商:	170
	 电话号码 :
	 */
	NSString *CM = @"^1(3[4-9]|47|5[0-27-9]|78|8[2-478])\\d{8}$";
	NSString *CU = @"^1(3[0-2]|45|5[56]|7[156]|8[56])\\d{8}$";
	NSString *CT = @"^1(33|49|53|7[37]|8[019])\\d{8}$";
	NSString *V =  @"^1(70)\\d{8}$";
	NSString *PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
	
	NSPredicate *predCMCC = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
	NSPredicate *predCU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
	NSPredicate *predCT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
	NSPredicate *predV = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",V];
	NSPredicate *predPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
	
	return [predCMCC evaluateWithObject:self] ||
	[predCU evaluateWithObject:self] ||
	[predCT evaluateWithObject:self] ||
	[predV evaluateWithObject:self] ||
	[predPHS evaluateWithObject:self];
}

- (BOOL)isNumber {
	return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"\\d"] evaluateWithObject:self];
}

- (BOOL)isNumberAndChar {
	return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"\\d|\\w"] evaluateWithObject:self];
}

- (BOOL)isMapLenOfWordsMinLen:(int)minLen maxLen:(int)maxLen {
	NSString * regex = [NSString stringWithFormat:@"^[\u4e00-\u9fa5_a-zA-Z0-9]{%d,%d}$", minLen, maxLen];
	return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex] evaluateWithObject:self];
}

- (BOOL)isSecretWordsMinLen:(int)minLen maxLen:(int)maxLen {
	NSString * regex = [NSString stringWithFormat:@"^[a-zA-Z0-9]{%d,%d}$", minLen, maxLen];
	return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex] evaluateWithObject:self];
}
- (BOOL)isUserName {
	NSString * regex = [NSString stringWithFormat:@"^[a-zA-Z•·\u4e00-\u9fa5]{2,10}$"];
	return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex] evaluateWithObject:self];
}

- (BOOL)isContainsEmoji {
	NSUInteger len = [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
	if (len < 3) {  // 大于2个字符需要验证Emoji(有些Emoji仅三个字符)
		return NO;
	}
	// 仅考虑字节长度为3的字符,大于此范围的全部做Emoji处理
	NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
	
	Byte *bts = (Byte *)[data bytes];
	Byte bt;
	short v;
	for (NSUInteger i = 0; i < len; i++) {
		bt = bts[i];
		
		if ((bt | 0x7F) == 0x7F) {  // 0xxxxxxx  ASIIC编码
			continue;
		}
		if ((bt | 0x1F) == 0xDF) {  // 110xxxxx  两个字节的字符
			i += 1;
			continue;
		}
		if ((bt | 0x0F) == 0xEF) {  // 1110xxxx  三个字节的字符(重点过滤项目)
			// 计算Unicode下标
			v = bt & 0x0F;
			v = v << 6;
			v |= bts[i + 1] & 0x3F;
			v = v << 6;
			v |= bts[i + 2] & 0x3F;
			
			//            NSLog(@"%02X%02X", (Byte)(v >> 8), (Byte)(v & 0xFF));
			
			if ([self emojiInSoftBankUnicode:v] || [self emojiInUnicode:v]) {
				return YES;
			}
			
			i += 2;
			continue;
		}
		if ((bt | 0x3F) == 0xBF) {  // 10xxxxxx  10开头,为数据字节,直接过滤
			continue;
		}
		
		return YES;                 // 不是以上情况的字符全部超过三个字节,做Emoji处理
	}
	
	return NO;
}

- (BOOL) emojiInUnicode:(short)code {
	if (code == 0x0023
		|| code == 0x002A
		|| (code >= 0x0030 && code <= 0x0039)
		|| code == 0x00A9
		|| code == 0x00AE
		|| code == 0x203C
		|| code == 0x2049
		|| code == 0x2122
		|| code == 0x2139
		|| (code >= 0x2194 && code <= 0x2199)
		|| code == 0x21A9 || code == 0x21AA
		|| code == 0x231A || code == 0x231B
		|| code == 0x2328
		|| code == 0x23CF
		|| (code >= 0x23E9 && code <= 0x23F3)
		|| (code >= 0x23F8 && code <= 0x23FA)
		|| code == 0x24C2
		|| code == 0x25AA || code == 0x25AB
		|| code == 0x25B6
		|| code == 0x25C0
		|| (code >= 0x25FB && code <= 0x25FE)
		|| (code >= 0x2600 && code <= 0x2604)
		|| code == 0x260E
		|| code == 0x2611
		|| code == 0x2614 || code == 0x2615
		|| code == 0x2618
		|| code == 0x261D
		|| code == 0x2620
		|| code == 0x2622 || code == 0x2623
		|| code == 0x2626
		|| code == 0x262A
		|| code == 0x262E || code == 0x262F
		|| (code >= 0x2638 && code <= 0x263A)
		|| (code >= 0x2648 && code <= 0x2653)
		|| code == 0x2660
		|| code == 0x2663
		|| code == 0x2665 || code == 0x2666
		|| code == 0x2668
		|| code == 0x267B
		|| code == 0x267F
		|| (code >= 0x2692 && code <= 0x2694)
		|| code == 0x2696 || code == 0x2697
		|| code == 0x2699
		|| code == 0x269B || code == 0x269C
		|| code == 0x26A0 || code == 0x26A1
		|| code == 0x26AA || code == 0x26AB
		|| code == 0x26B0 || code == 0x26B1
		|| code == 0x26BD || code == 0x26BE
		|| code == 0x26C4 || code == 0x26C5
		|| code == 0x26C8
		|| code == 0x26CE
		|| code == 0x26CF
		|| code == 0x26D1
		|| code == 0x26D3 || code == 0x26D4
		|| code == 0x26E9 || code == 0x26EA
		|| (code >= 0x26F0 && code <= 0x26F5)
		|| (code >= 0x26F7 && code <= 0x26FA)
		|| code == 0x26FD
		|| code == 0x2702
		|| code == 0x2705
		|| (code >= 0x2708 && code <= 0x270D)
		|| code == 0x270F
		|| code == 0x2712
		|| code == 0x2714
		|| code == 0x2716
		|| code == 0x271D
		|| code == 0x2721
		|| code == 0x2728
		|| code == 0x2733 || code == 0x2734
		|| code == 0x2744
		|| code == 0x2747
		|| code == 0x274C
		|| code == 0x274E
		|| (code >= 0x2753 && code <= 0x2755)
		|| code == 0x2757
		|| code == 0x2763 || code == 0x2764
		|| (code >= 0x2795 && code <= 0x2797)
		|| code == 0x27A1
		|| code == 0x27B0
		|| code == 0x27BF
		|| code == 0x2934 || code == 0x2935
		|| (code >= 0x2B05 && code <= 0x2B07)
		|| code == 0x2B1B || code == 0x2B1C
		|| code == 0x2B50
		|| code == 0x2B55
		|| code == 0x3030
		|| code == 0x303D
		|| code == 0x3297
		|| code == 0x3299
		// 第二段
		|| code == 0x23F0) {
		return YES;
	}
	return NO;
}

/**
 * 一种非官方的, 采用私有Unicode 区域
 * e0 - e5  01 - 59
 */
- (BOOL) emojiInSoftBankUnicode:(short)code {
	return ((code >> 8) >= 0xE0 && (code >> 8) <= 0xE5 && (Byte)(code & 0xFF) < 0x60);
}

@end
