//
//  TDSemiModalAppDelegate.h
//  TDSemiModal
//
//  Created by Nathan  Reed on 18/10/10.
//  Copyright 2010 Nathan Reed. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TDSemiModalDemoViewController;

@interface TDSemiModalAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TDSemiModalDemoViewController *viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet TDSemiModalDemoViewController *viewController;

@end

