//
//  UIImage+Scale.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

/**
 resize image

 @param size target size
 @return image result
 */
- (UIImage *)resize:(CGSize)size;

@end
