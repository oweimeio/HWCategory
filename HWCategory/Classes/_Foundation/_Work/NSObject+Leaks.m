//
//  NSObject+Leaks.m
//  HWCategory
//
//  Created by 华奥 on 2018/6/4.
//

#import "NSObject+Leaks.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@implementation NSObject (Leaks)

- (void)willDealloc {
	__weak id weakSelf = self;
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		__strong id strongSelf = weakSelf;
		[strongSelf assertNotDealloc];
	});
}

- (void)assertNotDealloc {
	NSString *className =NSStringFromClass([self class]);
	NSString *message = [NSString stringWithFormat:@"Memorry leaked. %@",className];
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Leaked" message:message delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
	[alertView show];
}

+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL {
	//获取类的方法
	Class class = [self class];
	Method originalMethod = class_getInstanceMethod(class, originalSEL);
	Method swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
	//交换方法
	BOOL didAddMethod = class_addMethod(class, originalSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
	if (didAddMethod) {
		class_replaceMethod(class, swizzledSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
	}
	else {
		method_exchangeImplementations(originalMethod, swizzledMethod);
	}
}
@end
