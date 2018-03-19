//
//  UIAlertController+Speed.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Speed)

+ (void)showAlertFromView:(UIViewController *)viewvc
				withTitle:(NSString *)title
			   andMessage:(NSString *)message
		cancelButtonTitle:(NSString *)btnCancelTitle
	   confirmButtonTitle:(NSString *)btnConfirmTitle
			confirmAction:(void (^)(void))btnConfirmBlock;

+ (void)showAlertFromView:(UIViewController *)viewvc
				withTitle:(NSString *)title
			   andMessage:(NSString *)message
		cancelButtonTitle:(NSString *)btnCancelTitle
			 cancelAction:(void (^)(void))btnCancelBlock;

@end
