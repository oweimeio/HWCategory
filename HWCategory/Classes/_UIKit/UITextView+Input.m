//
//  UITextView+Input.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "UITextView+Input.h"

@implementation UITextView (Input)

#pragma mark EMPTY

- (BOOL)isEmptyWithPlaceholder:(NSString *)placeholder {
	
	if (placeholder != nil) {
		return self == nil || self.text == nil || [self.text isEqualToString:@""] || [self.text isEqualToString:placeholder];
	}
	return self == nil || self.text == nil || [self.text isEqualToString:@""];
}

@end
