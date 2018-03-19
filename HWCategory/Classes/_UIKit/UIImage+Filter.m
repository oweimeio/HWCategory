//
//  UIImage+Filter.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "UIImage+Filter.h"

@implementation UIImage (Filter)

- (UIImage *)gaussianBlur:(CGFloat)radius {
	
	CIContext *context = [CIContext contextWithOptions:nil];
	CIImage *image = [CIImage imageWithCGImage:self.CGImage];
	CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
	[filter setValue:image forKey:kCIInputImageKey];
	[filter setValue:@(radius) forKey:@"inputRadius"];
	CIImage *result = [filter valueForKey:kCIOutputImageKey];
	CGImageRef outImage = [context createCGImage:result fromRect:[image extent]];
	UIImage * blurImage = [UIImage imageWithCGImage:outImage];
	CGImageRelease(outImage);
	return blurImage;
}

@end
