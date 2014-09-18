//
//  UIViewController+TDSemiModalExtension.h
//  TDSemiModal
//
//  Created by Nathan  Reed on 18/10/10.
//  Copyright 2010 Nathan Reed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TDSemiModalViewController.h"

@interface UIViewController (TDSemiModalExtension)

- (void)presentSemiModalViewController:(TDSemiModalViewController*)vc;
- (void)presentSemiModalViewController:(TDSemiModalViewController*)vc
                                inView:(UIView *)rootView;
- (void)dismissSemiModalViewController:(TDSemiModalViewController*)vc;

@end
