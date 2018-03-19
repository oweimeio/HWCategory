//
//  NSDate+Operator.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSDate (Operator)

- (BOOL)isToday;

- (BOOL)isYesterday;

- (BOOL)isTheDayBeforeYesterday;

- (BOOL)isSameDayIgnoringTimeWith:(NSDate *)date;

- (NSDate *)yesterday;

- (BOOL)isSameDayWith:(NSDate *)date;

- (BOOL)isSameWeekWith:(NSDate *)date;

- (BOOL)isSameMonthWith:(NSDate *)date;

- (BOOL)isSameYearWith:(NSDate *)date;

- (BOOL)inFiveMinutes:(NSDate *)date;

@end
