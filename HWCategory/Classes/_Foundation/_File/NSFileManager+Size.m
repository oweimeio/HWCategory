//
//  NSFileManager+Size.m
//  HWCategory
//
//  Created by HW on 2018/3/19.
//

#import "NSFileManager+Size.h"

@implementation NSFileManager (Size)

+ (float)fileSizeAtPath:(NSString *)filepath {
	
	NSFileManager *fmgr = [NSFileManager defaultManager];
	
	// CHECK FILE EXIST
	
	BOOL isFolder = NO;
	
	if ([fmgr fileExistsAtPath:filepath isDirectory:&isFolder]) {
		
		float filesize = 0;
		
		if (isFolder) {
			// FOLDER
			
			NSArray *files = [fmgr subpathsAtPath:filepath];
			for (NSString *filename in files) {
				filesize += [NSFileManager fileSizeAtPath:filename];
			}
			
		} else {
			// FILE
			
			filesize = [fmgr attributesOfItemAtPath:filepath error:NULL].fileSize / 1024.0f / 1024.0f;
		}
		
		return filesize;
	}
	
	return 0;
}

@end
