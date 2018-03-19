//
//  UIImage+Filter.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <UIKit/UIKit.h>

@interface UIImage (Filter)

/**
 image blur filter

 @param radius gaussian blur radius value
 @return image binary data
 */
- (UIImage *)gaussianBlur:(CGFloat)radius;

@end
