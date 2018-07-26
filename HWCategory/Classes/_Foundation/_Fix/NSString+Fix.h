//
//  NSString+Fix.h
//  HWCategory
//
//  Created by LY on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSString (Fix)

- (id)objectAtIndex:(NSUInteger)index;

- (id)objectForKey:(id)aKey;

- (BOOL)isReal;

@end
