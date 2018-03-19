//
//  NSString+Convert.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSString (Convert)

- (NSString *)encodingURL;

- (NSString *)pinyin;

- (NSString *)indexLetter;

- (NSDate *)extractBirthdayFromIDNumber;

- (NSUInteger)extractAgeFromIDNumber;

- (NSString *)extractGenderFromIDNumber;

@end
