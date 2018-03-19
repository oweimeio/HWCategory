//
//  UITextField+Input.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "UITextField+Input.h"

@implementation UITextField (Input)

#pragma mark EMPTY

- (BOOL)isEmpty {
	return self == nil || self.text == nil || [self.text isEqualToString:@""];
}

@end
