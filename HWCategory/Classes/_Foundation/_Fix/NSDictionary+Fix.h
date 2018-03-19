//
//  NSDictionary+Fix.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@class NSArray;

@interface NSDictionary (Fix)

- (id)objectAtIndex:(NSUInteger)index;

- (BOOL)isEqualToString:(NSString *)aString;

- (float)floatValue;

- (double)doubleValue;

- (int)intValue;

- (NSInteger)integerValue;

- (long long)longLongValue;

- (NSUInteger)length;

- (BOOL)boolValue;

- (NSDictionary *)filterNull;

- (BOOL)hasObjectWithKey:(NSString *)akey;

- (id)objectInKeys:(NSArray *)keys;

- (int)intInKeys:(NSArray *)keys;

- (NSString *)stringInKeys:(NSArray *)keys;

- (NSDictionary *)nullDictionaryHandler;

- (BOOL)isReal;

@end
