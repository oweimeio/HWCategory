//
//  NSNumber+Random.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Random)

/**
 get random int value between two values

 @param lowerBound smaller one
 @param upperBound larger one
 @return result
 */
+ (int)randomIntBetween:(int)lowerBound and:(int)upperBound;

/**
 get random float value between two values

 @param smallNumber smaller one
 @param bigNumber larger one
 @return result
 */
+ (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber;

@end
