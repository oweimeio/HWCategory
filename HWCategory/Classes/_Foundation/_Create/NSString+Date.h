//
//  NSString+Date.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSString (Date)

/**
 字符串转时间对象

 @param fmtString 转换格式
 @return 时间对象结果
 */
- (NSDate *)dateWithFormat:(NSString *)fmtString;

/**
 字符串转换时间对象

 @param fmtString 转换格式
 @param timezoneName 时区标识符
 @return 时间对象结果
 */
- (NSDate *)dateWithFormat:(NSString *)fmtString andTimezone:(NSString *)timezoneName;

- (NSDate *)dateWithFormat:(NSString *)fmtString dateStyle:(NSDateFormatterStyle)style;

@end
