//
//  UINavigationController+Leaks.m
//  HWCategory_Example
//
//  Created by 华奥 on 2018/6/5.
//  Copyright © 2018年 oweimeio. All rights reserved.
//

#import "UINavigationController+Leaks.h"
#import "NSObject+Leaks.h"
#import <objc/runtime.h>
 
@implementation UINavigationController (Leaks)

+ (void)load {
	[self swizzleSEL:@selector(popViewControllerAnimated:) withSEL:@selector(swizzled_popViewControllerAnimated:)];
}

- (UIViewController *)swizzled_popViewControllerAnimated:(BOOL) animated {
	UIViewController *poppedViewContrller = [self swizzled_popViewControllerAnimated:animated];
	extern  const void* kHasBeenPoppedKey;
	objc_setAssociatedObject(poppedViewContrller, kHasBeenPoppedKey, @(YES), OBJC_ASSOCIATION_RETAIN);
	return poppedViewContrller;
}

@end
