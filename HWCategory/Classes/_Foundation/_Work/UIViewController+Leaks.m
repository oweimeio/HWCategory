//
//  UIViewController+Leaks.m
//  HWCategory
//
//  Created by 华奥 on 2018/6/4.
//

#import "UIViewController+Leaks.h"
#import "NSObject+Leaks.h"
#import <objc/runtime.h>

//FOUNDATION_EXPORT const *kHasBeenPoppedKey;
void * const kHasBeenPoppedKey = "kHasBeenPoppedKey";
/*
 监听UIViewContrllor是否发生内存泄露
 
 界面完全消失的时候,并且控制器是出栈状态,观察控制器是否还活着
 */

@implementation UIViewController (Leaks)

+ (void)load {
	[self swizzleSEL:@selector(viewWillAppear:) withSEL:@selector(swizzled_viewWillAppear:)];
	[self swizzleSEL:@selector(viewDidDisappear:) withSEL:@selector(swizzled_viewDidDisappear:)];
}

//界面显示
- (void)swizzled_viewWillAppear:(BOOL) animated {
	[self swizzled_viewWillAppear:animated];
	objc_setAssociatedObject(self, kHasBeenPoppedKey, @(NO), OBJC_ASSOCIATION_RETAIN);
}

- (void)swizzled_viewDidDisappear:(BOOL) animated {
	[self swizzled_viewDidDisappear:animated];
	if ([objc_getAssociatedObject(self, kHasBeenPoppedKey) boolValue]) {
		[self willDealloc];
	}
}

@end
