//
//  TDSemiModalExtenstionTests.m
//  TDSemiModal
//
//  Created by Víctor Berga on 17/09/14.
//  Copyright (c) 2014 Bitmonlab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "UIViewController+TDSemiModalExtension.h"
#import "TDSemiModalViewController.h"

@interface TDSemiModalExtenstionTests : XCTestCase

@property UIViewController *controller;

@end

@implementation TDSemiModalExtenstionTests

- (void)setUp {
    [super setUp];
    
    self.controller = [[UIViewController alloc] init];
}

- (void)tearDown {
    self.controller = nil;
    
    [super tearDown];
}

- (void)testPresentSemiModalViewControllerInView
{
    TDSemiModalViewController *modalController = [[TDSemiModalViewController alloc]
                                                  init];
    modalController.coverView = [[UIView alloc] init];
    UIView *destinationView = [[UIView alloc] init];
    
    [self.controller presentSemiModalViewController:modalController
                                             inView:destinationView];
    
    XCTAssertTrue(destinationView.subviews[0] == modalController.coverView);
}

@end
