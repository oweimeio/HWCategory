//
//  NSURLRequest+Speed.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "NSURLRequest+Speed.h"

@implementation NSURLRequest (Speed)

+ (NSURLRequest *)requestWithFormat:(NSString *)format, ... {
	va_list args;
	id ret;
	
	va_start(args, format);
	if (format == nil) {
		ret = nil;
	} else {
		ret = [[NSString alloc] initWithFormat:format arguments:args];
	}
	
	va_end(args);
	
	if (ret != nil) {
		return [NSURLRequest requestWithURL:[NSURL URLWithString:ret]];
	}
	
	return ret;
}

@end
