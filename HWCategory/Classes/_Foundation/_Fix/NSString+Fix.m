//
//  NSString+Fix.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "NSString+Fix.h"

@implementation NSString (Fix)

- (id)objectAtIndex:(NSUInteger)index {
	return nil;
}

- (id)objectForKey:(id)aKey {
	return nil;
}

- (BOOL)isReal {
	return ![self isEqualToString:@"0"] && ![self isEqualToString:@"<NSNull>"];
}

@end
