//
//  NSFileManager+IOS.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "NSFileManager+IOS.h"

@implementation NSFileManager (IOS)

+ (BOOL)isFolderExistInDocuments:(NSString *)folderName {
	
	NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", folderName];
	BOOL isDir;
	BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
	return exists && isDir;
}

+ (void)createFolderIfNotExistInDocuments:(NSString *)folderName {
	
	// CHECK FOLDER
	NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", folderName];
	BOOL isDir;
	BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
	
	if (exists && isDir) {
		// HAS FOLDER
		// DO NOTHING
	} else {
		// CREATE
		[[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
	}
}

@end