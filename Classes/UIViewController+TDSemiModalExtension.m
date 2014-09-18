//
//  UIViewController+TDSemiModalExtension.m
//  TDSemiModal
//
//  Created by Nathan  Reed on 18/10/10.
//  Copyright 2010 Nathan Reed. All rights reserved.
//

#import "UIViewController+TDSemiModalExtension.h"

@interface UIViewController()

@property (readonly) CGPoint offscreenCenter;

@end

@implementation UIViewController (TDSemiModalExtension)

#pragma mark -
#pragma mark Properties

- (CGPoint) offscreenCenter
{
    CGPoint offScreenCenter = CGPointZero;
    
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    CGSize offSize = UIScreen.mainScreen.bounds.size;
    
    if(orientation == UIInterfaceOrientationLandscapeLeft
       || orientation == UIInterfaceOrientationLandscapeRight)
    {
        offScreenCenter = CGPointMake(offSize.height / 2.0, offSize.width * 1.5);
    } else {
        offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * 1.5);
    }
    
    return offScreenCenter;
}

#pragma mark -
#pragma mark Insntance methods

// Use this to show the modal view (pops-up from the bottom)
- (void) presentSemiModalViewController:(TDSemiModalViewController*)vc
{
    UIView *rootView = [[UIApplication sharedApplication] keyWindow];
    [self presentSemiModalViewController:vc inView:rootView];
}

- (void) presentSemiModalViewController:(TDSemiModalViewController*)vc
                                 inView:(UIView *)rootView
{
	UIView* modalView = vc.view;
	UIView* coverView = vc.coverView;
    
	coverView.frame = rootView.bounds;
    coverView.alpha = 0.0f;
    
    modalView.frame = rootView.bounds;
	modalView.center = self.offscreenCenter;
	
	[rootView addSubview:coverView];
	[rootView addSubview:modalView];
	
    [UIView animateWithDuration:.6 animations:^{
        modalView.frame = CGRectMake(0,
                                     0,
                                     modalView.frame.size.width,
                                     modalView.frame.size.height);
        coverView.alpha = 0.5;
    }];
}

-(void) dismissSemiModalViewController:(TDSemiModalViewController*)vc
{
	double animationDelay = 0.7;
	UIView* modalView = vc.view;
	UIView* coverView = vc.coverView;
    
    [UIView animateWithDuration:animationDelay animations:^{
        modalView.center = self.offscreenCenter;
        coverView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        if (finished) {
            [coverView removeFromSuperview];
            [modalView removeFromSuperview];
        }
    }];
}

@end
