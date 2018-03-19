//
//  NSData+Encrypt.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSData (Encrypt)

- (NSString *)md5;

- (NSData *)MD5;

- (NSData *)SHA1;

- (NSData *)SHA256;

@end
