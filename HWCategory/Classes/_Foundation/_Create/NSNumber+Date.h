//
//  NSNumber+Date.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Date)

#pragma mark UTC TIME

/**
 get date object from number object of utc time interval value

 @return date object
 */
- (NSDate *)date;

@end
