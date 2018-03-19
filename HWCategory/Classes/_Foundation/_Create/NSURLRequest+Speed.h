//
//  NSURLRequest+Speed.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (Speed)

+ (NSURLRequest *)requestWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

@end
