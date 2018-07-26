//
//  NSString+Search.m
//  HWCategory
//
//  Created by LY on 2018/3/19.
//

#import "NSString+Search.h"

@implementation NSString (Search)

- (BOOL)caseInsensitive:(NSString *)searchString {
	
	if ([searchString length] == 0 || [self length] == 0 ||
		([searchString length] > 0 && [self length] > 0 && searchString.length > self.length)) {
		return NO;
	}
	
	return [[self lowercaseString] rangeOfString:[searchString lowercaseString]].location != NSNotFound;
}

- (BOOL)caseSensitive:(NSString *)searchString {
	
	if ([searchString length] == 0 || [self length] == 0 ||
		([searchString length] > 0 && [self length] > 0 && searchString.length > self.length)) {
		return NO;
	}
	
	return [self rangeOfString:searchString].location != NSNotFound;
}

@end
