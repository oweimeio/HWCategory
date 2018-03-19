//
//  NSMutableArray+Operator.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "NSMutableArray+Operator.h"

@implementation NSMutableArray (Operator)

- (void)reverse {
	if ([self count] == 0)
		return;
	NSUInteger i = 0;
	NSUInteger j = [self count] - 1;
	while (i < j) {
		[self exchangeObjectAtIndex:i
				  withObjectAtIndex:j];
		
		i++;
		j--;
	}
}

@end
