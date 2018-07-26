//
//  NSString+Size.m
//  HWCategory
//
//  Created by LY on 2018/3/19.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGFloat)widthWithFont:(UIFont *)font {
	return ceilf([[NSAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:font,}].size.width);
}

- (CGFloat)widthWithSystemFontOfSize:(CGFloat)fontSize {
	return ceilf([[NSAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],}].size.width);
}

- (CGFloat)heightWithFont:(UIFont *)font andFixedWidth:(CGFloat)width {
		
	return ceil([[[NSAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:font,}] boundingRectWithSize:(CGSize){width, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
	
}

@end
