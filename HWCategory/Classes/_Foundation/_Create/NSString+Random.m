//
//  NSString+Random.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "NSString+Random.h"

@implementation NSString (Random)

+ (NSString *)uuid {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (__bridge NSString *)uuidStringRef;
}


@end
