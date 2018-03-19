//
//  UINavigationBar+Fix.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "UINavigationBar+Fix.h"

@implementation UINavigationBar (Fix)

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	self.userInteractionEnabled = [self pointInside:point withEvent:event];
	return [super hitTest:point withEvent:event];
}

@end
