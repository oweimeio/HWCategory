//
//  HWViewController.m
//  HWCategory
//
//  Created by oweimeio on 02/11/2018.
//  Copyright (c) 2018 oweimeio. All rights reserved.
//

#import "HWViewController.h"
#import <HWCategory/HWCategory.h>

typedef void (^Block)(void);

//#define Min1(a,b) return a < b ? a==b ? a : 0;


#define Min1(a,b) ( a < b ? a : a==b ? 0 : b )

@interface HWViewController ()
@property (nonatomic, strong) Block block;
@property (nonatomic, strong) NSString *name;
@end

@implementation HWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	NSLog(@"start");
	NSLog(@"%d",Min1(4, 3));
	__weak typeof(self) weakSelf = self;
	self.block = ^{
		__strong typeof(weakSelf) strongSelf = weakSelf;
		weakSelf.name = @"Tome";
	};
	self.block();
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
	NSLog(@"delloc");
}

@end
