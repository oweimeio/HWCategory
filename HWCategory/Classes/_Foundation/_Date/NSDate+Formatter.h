//
//  NSDate+Formatter.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formatter)

#pragma mark DATE TO STRING

- (NSString *)stringWithFormat:(NSString *)fmtString;

- (NSString *)stringWithFormat:(NSString *)fmtString andTimezone:(NSString *)timezoneName;

#pragma mark STRING TO DATE

#pragma mark UTC

- (NSNumber *)utcTimeIntervalSince1970;

- (NSNumber *)utcTimeIntervalIntSince1970;

- (NSString *)timeIntervalStringSince1970;

#pragma mark WEEKDAY

- (int)weekdayNumber;

- (int)weekdayNumberPRC;

#pragma mark HOUR MINUTE SECOND

- (int)hourNumberPRC;

@end
