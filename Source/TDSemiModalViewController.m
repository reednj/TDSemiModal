//
//  TDSemiModalViewController.m
//  TDSemiModal
//
//  Created by Nathan  Reed on 18/10/10.
//  Copyright 2010 Nathan Reed. All rights reserved.
//

#import "TDSemiModalViewController.h"

@implementation TDSemiModalViewController
@synthesize coverView;

-(void)viewDidLoad {
    [super viewDidLoad];

	self.coverView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	self.coverView.backgroundColor = UIColor.blackColor;

}

#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	self.coverView = nil;
}

- (void)dealloc {
	self.coverView = nil;
    [super dealloc];
}

@end
