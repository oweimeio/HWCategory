//
//  NSObject+Leaks.h
//  HWCategory
//
//  Created by 华奥 on 2018/6/4.
//

#import <Foundation/Foundation.h>

@interface NSObject (Leaks)

- (void)willDealloc;

+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;

@end
