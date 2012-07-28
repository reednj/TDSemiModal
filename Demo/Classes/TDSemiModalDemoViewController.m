//
//  TDSemiModalViewController.m
//  TDSemiModal
//
//  Created by Nathan  Reed on 18/10/10.
//  Copyright 2010 Nathan Reed. All rights reserved.
//

#import "TDSemiModalDemoViewController.h"
#import "TDSemiModal.h"

@implementation TDSemiModalDemoViewController

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}

- (void)viewDidUnload {
}


#pragma mark -
#pragma mark User Actions

-(IBAction)dateButtonClicked:(id)sender {
	[self presentSemiModalViewController:datePickerView];
}


#pragma mark -
#pragma mark Date Picker Delegate

-(void)datePickerSetDate:(TDDatePickerController*)viewController {
	[self dismissSemiModalViewController:datePickerView];

	selectedDate = viewController.datePicker.date;
}

-(void)datePickerClearDate:(TDDatePickerController*)viewController {
	[self dismissSemiModalViewController:datePickerView];

	selectedDate = nil;
}

-(void)datePickerCancel:(TDDatePickerController*)viewController {
	[self dismissSemiModalViewController:datePickerView];
}

@end
