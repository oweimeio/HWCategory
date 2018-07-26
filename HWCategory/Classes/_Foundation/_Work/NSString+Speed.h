//
//  NSString+Speed.h
//  HWCategory
//
//  Created by LY on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSString (Speed)

- (BOOL)isEqualWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1, 2);

- (BOOL)isOneOfThem:(NSArray *)strings;

- (NSString *)removeHTMLtags;

@end
