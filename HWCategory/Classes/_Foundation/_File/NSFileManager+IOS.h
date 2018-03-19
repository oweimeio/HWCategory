//
//  NSFileManager+IOS.h
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (IOS)

+ (BOOL)isFolderExistInDocuments:(NSString *)folderName;

// CHECK AND CREATE
+ (void)createFolderIfNotExistInDocuments:(NSString *)folderName;

@end
