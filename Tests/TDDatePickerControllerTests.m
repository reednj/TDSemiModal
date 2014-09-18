//
//  TDDatePickerControllerTests.m
//  TDSemiModal
//
//  Created by Víctor Berga on 17/09/14.
//  Copyright (c) 2014 Bitmonlab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "TDDatePickerController.h"

@interface MockDelegate : NSObject<TDDatePickerControllerDelegate>

@property BOOL datePickerSetDateCalled;
@property BOOL datePickerClearDateCalled;
@property BOOL datePickerCancelCalled;

@end

@implementation MockDelegate

- (void)datePickerSetDate:(TDDatePickerController*)viewController
{
    self.datePickerSetDateCalled = YES;
}

- (void)datePickerClearDate:(TDDatePickerController *)viewController
{
    self.datePickerClearDateCalled = YES;
}

- (void)datePickerCancel:(TDDatePickerController *)viewController
{
    self.datePickerCancelCalled = YES;
}

@end

@interface TDDatePickerControllerTests : XCTestCase

@property TDDatePickerController *controller;
@property MockDelegate *delegate;

@end

@implementation TDDatePickerControllerTests

- (void)setUp
{
    [super setUp];

    self.delegate   = [[MockDelegate alloc] init];
    self.controller = [[TDDatePickerController alloc] init];
    self.controller.delegate = self.delegate;
}

- (void)tearDown
{
    self.controller = nil;
    self.delegate   = nil;
    
    [super tearDown];
}

- (void)testViewDidLoad
{
    UIDatePicker *picker = UIDatePicker.new;
    self.controller.datePicker = picker;
    
    [self.controller viewDidLoad];
    
    XCTAssertNotNil(self.controller.datePicker.date);
}

- (void)testShouldAutorotate
{
    XCTAssertTrue(self.controller.shouldAutorotate);
}

- (void)testSupportedInterfaceOrientantions
{
    NSUInteger suported = [self.controller supportedInterfaceOrientations];
    XCTAssertTrue(suported == UIInterfaceOrientationMaskAll);
}

- (void)testSaveDateEdit
{
    [self.controller saveDateEdit:nil];
    XCTAssertTrue(self.delegate.datePickerSetDateCalled);
}

- (void)testClearDateEdit
{
    [self.controller clearDateEdit:nil];
    XCTAssertTrue(self.delegate.datePickerClearDateCalled);
}

- (void)testCancelDateEdit
{
    [self.controller cancelDateEdit:nil];
    XCTAssertTrue(self.delegate.datePickerCancelCalled);
}

@end
