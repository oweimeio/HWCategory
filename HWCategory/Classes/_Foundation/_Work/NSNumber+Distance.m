//
//  NSNumber+Distance.m
//  HWCategory
//
//  Created by LY on 2018/3/19.
//

#import "NSNumber+Distance.h"

@implementation NSNumber (Distance)

- (NSString *)distanceString {
	
	NSString *disstr;
	
	if ([self doubleValue] > 1000) {
		NSArray *dis = [[NSString stringWithFormat:@"%0.1f", [self doubleValue] / 1000.0f] componentsSeparatedByString:@"."];
		if ([dis[1] intValue] > 0) {
			disstr = [NSString stringWithFormat:@"%0.1f", [self doubleValue] / 1000.0f];
		} else {
			disstr = dis[0];
		}
		disstr = [disstr stringByAppendingString:@"千米"];
	} else {
		disstr = [NSString stringWithFormat:@"%@米", @([self intValue])];
	}
	
	return disstr;
}

@end
