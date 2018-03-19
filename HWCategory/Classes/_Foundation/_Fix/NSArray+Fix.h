//
//  NSArray+Fix.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSArray (Fix)

- (id)objectForKey:(id)aKey;

- (id)objAtIdx:(NSInteger)idx;

- (BOOL)isEqualToString:(NSString *)aString;

- (double)doubleValue;

- (int)intValue;

- (NSInteger)integerValue;

- (long long)longLongValue;

- (BOOL)boolValue;

- (NSUInteger)length;

- (NSArray *)nullArrayHandler;

- (BOOL)isReal;

@end
