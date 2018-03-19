//
//  NSArray+Operator.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "NSArray+Operator.h"

@implementation NSArray (Operator)

- (NSArray *)reversed {
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
	NSEnumerator *enumerator = [self reverseObjectEnumerator];
	for (id element in enumerator) {
		[array addObject:element];
	}
	return [NSArray arrayWithArray:array];
}

@end
