//
//  NSString+Input.h
//  HWCategory
//
//  Created by LY on 2018/2/11.
//

#import <Foundation/Foundation.h>

@interface NSString (Input)

// MARK: SPACE

- (NSString *)trimStartSpace;

- (NSString *)trimSpace;

// MARK: PHONE NUMBER

- (NSString *)phoneNumber;

// MARK: EMOJI

- (NSString *)replaceEmojiTextWithUnicode;

- (NSString *)replaceEmojiUnicodeWithText;

// MARK: TRIM

- (NSString *)trimEndComma;

- (NSString *)trimEndStr:(NSString *)str;

// MARK: CRYPTO

- (NSString *)MD5_32;

@end
