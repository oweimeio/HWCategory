//
//  NSLayoutConstraint+APixel.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "NSLayoutConstraint+APixel.h"

@implementation NSLayoutConstraint (APixel)

- (NSInteger)preciseConstant {
	return (NSInteger)(self.constant * [UIScreen mainScreen].scale);
}

- (void)setPreciseConstant:(NSInteger)preciseConstant {
	self.constant = (CGFloat)preciseConstant / [UIScreen mainScreen].scale;
}

@end
