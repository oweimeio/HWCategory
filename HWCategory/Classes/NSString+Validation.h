//
//  NSString+Validation.h
//  HWCategory
//
//  Created by HW on 2018/2/11.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)
// MARK: EMPTY

- (BOOL)isEmpty;

// MARK: EMAIL

- (BOOL)isEmail;

// MARK: ID

- (BOOL)isIDCardNumber;

/**
 相对严格的身份验证

 @return 是否是身份证号
 */
- (BOOL)isStrictIDCardNumber;

// MARK: PHONE NUMBER

- (BOOL)isPhoneNumber;

// MARK: NUMBER

- (BOOL)isNumber;

- (BOOL)isNumberAndChar;

// MARK: WORD LENGTH

- (BOOL)isMapLenOfWordsMinLen:(int)minLen maxLen:(int)maxLen; //判断字符(汉字)长度，最小－最大长度

- (BOOL)isSecretWordsMinLen:(int)minLen maxLen:(int)maxLen;

// MARK: USERNAME

- (BOOL)isUserName;

/**
 判断字符串中是否含有表情
 
 @return 是否含有表情
 */
- (BOOL)isContainsEmoji;

@end
