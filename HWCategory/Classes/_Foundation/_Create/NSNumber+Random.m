//
//  NSNumber+Random.m
//  HWCategory
//
//  Created by LY on 2018/3/19.
//

#import "NSNumber+Random.h"

@implementation NSNumber (Random)

+ (int)randomIntBetween:(int)lowerBound and:(int)upperBound {
	return lowerBound + arc4random() % (upperBound - lowerBound);
}

+ (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber {
	float diff = bigNumber - smallNumber;
	return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

@end
