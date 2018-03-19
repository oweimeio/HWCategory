//
//  NSNumber+Fix.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "NSNumber+Fix.h"

@implementation NSNumber (Fix)

- (id)objectAtIndex:(NSUInteger)index {
	return nil;
}

- (id)objectForKey:(id)aKey {
	return nil;
}

- (BOOL)isEqualToString:(NSString *)aString {
	return [[NSString stringWithFormat:@"%@", self] isEqualToString:aString];
}

- (NSUInteger)length {
	return 0;
}

- (NSString *)string {
	return [NSString stringWithFormat:@"%@", self];
}

- (BOOL)isReal {
	return [self intValue] != 0;
}

@end
