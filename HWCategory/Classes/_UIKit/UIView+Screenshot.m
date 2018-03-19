//
//  UIView+Screenshot.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "UIView+Screenshot.h"

@implementation UIView (Screenshot)

- (UIImage *)imageShot {
	// SCREENSHOT
	UIGraphicsBeginImageContext(self.bounds.size);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	return image;
}

@end
