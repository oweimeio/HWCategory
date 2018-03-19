//
//  NSNumber+Fix.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Fix)

- (id)objectAtIndex:(NSUInteger)index;

- (id)objectForKey:(id)aKey;

- (BOOL)isEqualToString:(NSString *)aString;

- (NSUInteger)length;

- (NSString *)string;

- (BOOL)isReal;

@end
