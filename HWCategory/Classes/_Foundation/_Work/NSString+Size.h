//
//  NSString+Size.h
//  HWCategory
//
//  Created by LY on 2018/3/19.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

- (CGFloat)widthWithFont:(UIFont *)font;

- (CGFloat)widthWithSystemFontOfSize:(CGFloat)fontSize;

- (CGFloat)heightWithFont:(UIFont *)font andFixedWidth:(CGFloat)width;

@end
