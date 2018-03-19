//
//  UIView+Animate.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <UIKit/UIKit.h>

typedef enum {
	AnimateViewPositionTop = 1,
	AnimateViewPositionRight = 2,
	AnimateViewPositionBottom = 3,
	AnimateViewPositionLeft = 4,
} AnimateViewPosition;

@interface UIView (Animate)

/**
 animation method move view from specified postion of screen

 @param postion postion enum value
 */
- (void)showFromScreen:(AnimateViewPosition)postion;

@end
