//
//  NSString+Input.h
//  HWCategory
//
//  Created by 华奥 on 2018/2/11.
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

@end
