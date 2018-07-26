//
//  NSString+Search.h
//  HWCategory
//
//  Created by LY on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSString (Search)

- (BOOL)caseInsensitive:(NSString *)searchString;

- (BOOL)caseSensitive:(NSString *)searchString;

@end
