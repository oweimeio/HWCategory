//
//  NSNumber+Date.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "NSNumber+Date.h"

@implementation NSNumber (Date)

#pragma mark UTC TIME

- (NSDate *)date {
	return [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
}

@end
