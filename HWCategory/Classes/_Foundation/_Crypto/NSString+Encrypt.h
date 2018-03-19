//
//  NSString+Encrypt.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSString (Encrypt)

- (NSString *)base64;

- (NSString *)md5;

- (NSString *)md5Lowercase16;

- (NSString *)sha1;

- (NSString *)md5Uppercase32;

@end
