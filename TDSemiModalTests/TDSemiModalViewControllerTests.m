//
//  TDSemiModalViewControllerTests.m
//  TDSemiModal
//
//  Created by Víctor Berga on 17/09/14.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "TDSemiModal.h"

@interface TDSemiModalViewControllerTests : XCTestCase

@property TDSemiModalViewController *controller;

@end

@implementation TDSemiModalViewControllerTests

- (void)setUp
{
    [super setUp];
    
    self.controller = [[TDSemiModalViewController alloc] init];
}

- (void)tearDown {
    self.controller = nil;
    
    [super tearDown];
}

- (void)testViewDidLoad
{
    [self.controller viewDidLoad];
    
    XCTAssertNotNil(self.controller.coverView);
    XCTAssertEqualObjects(self.controller.coverView.backgroundColor, UIColor.blackColor);
    XCTAssertTrue(self.controller.coverView.autoresizingMask ==
                  (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight));
    XCTAssertTrue(self.controller.view.autoresizingMask ==
                  (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight));
}


- (void)testViewDidUnload
{
    self.controller.coverView = UIView.new;
    // Hack: 'viewDidLoad' is deprecated and compilation fails, so I want
    // to call it dinamically and remove his code on the near future.
    [self.controller performSelector:@selector(viewDidUnload)];
    
    XCTAssertNil(self.controller.coverView);
}

@end
