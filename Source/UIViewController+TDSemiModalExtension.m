//
//  UIViewController+TDSemiModalExtension.m
//  TDSemiModal
//
//  Created by Nathan  Reed on 18/10/10.
//  Copyright 2010 Nathan Reed. All rights reserved.
//

#import "UIViewController+TDSemiModalExtension.h"

@implementation UIViewController (TDSemiModalExtension)

// Use this to show the modal view (pops-up from the bottom)
- (void) presentSemiModalViewController:(TDSemiModalViewController*)vc {	
#define DEGREES_TO_RADIANS(x) (M_PI * (x)/180.0)
	
	UIView* modalView = vc.view;
	UIView* coverView = vc.coverView;
	
	UIWindow* mainWindow = [(id)[[UIApplication sharedApplication] delegate] window];
	CGPoint middleCenter = self.view.center;
	CGSize offSize = [UIScreen mainScreen].bounds.size;
	
	UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
	
	CGPoint offScreenCenter = CGPointZero;
	
	if(orientation == UIInterfaceOrientationPortraitUpsideDown) {
		offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * -1.2);
		[modalView setTransform:CGAffineTransformIdentity];
		[modalView setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(180))];
		[modalView setBounds:CGRectMake(0, 0, 320, 460)];
	}
	else if(orientation == UIInterfaceOrientationLandscapeLeft) {
		offScreenCenter = CGPointMake(offSize.width * 1.2, offSize.height / 2);
		[modalView setTransform:CGAffineTransformIdentity];
		[modalView setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(-90))];
		[modalView setBounds:CGRectMake(0, 0, 480, 300)];
	}
	else if(orientation == UIInterfaceOrientationLandscapeRight) {
		offScreenCenter = CGPointMake(offSize.width * -1.2, offSize.height / 2);
		[modalView setTransform:CGAffineTransformIdentity];
		[modalView setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(90))];
		[modalView setBounds:CGRectMake(0, 0, 480, 300)];
	}
	else { // assume portrait
		offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * 1.2);
		[modalView setTransform:CGAffineTransformIdentity];
		[modalView setTransform:CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(0))];
		[modalView setBounds:CGRectMake(0, 0, 320, 460)];
	}
	
	
	modalView.center = offScreenCenter;
	coverView.alpha = 0.5;
	// we start off-screen
	[mainWindow addSubview:coverView];
	[mainWindow addSubview:modalView];
	
	// Show it with a transition effect
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.6];
	
	modalView.center = middleCenter;
	//coverView.alpha = 0.5;
	
	[UIView commitAnimations];
	
}

// Use this to slide the semi-modal view back down.
-(void) dismissSemiModalViewController:(TDSemiModalViewController*)vc {
	double animationDelay = 0.7;
	UIView* modalView = vc.view;
	UIView* coverView = vc.coverView;
	
	CGSize offSize = [UIScreen mainScreen].bounds.size;
	
	UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
	
	CGPoint offScreenCenter = CGPointZero;
	
	if(orientation == UIInterfaceOrientationPortraitUpsideDown) {
		offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * -1.5);
	}
	else if(orientation == UIInterfaceOrientationLandscapeLeft) {
		offScreenCenter = CGPointMake(offSize.width * 1.5, offSize.height / 2);
	}
	else if(orientation == UIInterfaceOrientationLandscapeRight) {
		offScreenCenter = CGPointMake(offSize.width * -1.5, offSize.height / 2);
	}
	else { // assume portrait
		offScreenCenter = CGPointMake(offSize.width / 2.0, offSize.height * 1.5);
	}
	
	
	[UIView beginAnimations:nil context:modalView];
	[UIView setAnimationDuration:animationDelay];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(dismissSemiModalViewControllerEnded:finished:context:)];
	modalView.center = offScreenCenter;
	[UIView commitAnimations];
	
	[coverView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:animationDelay];

}

- (void) dismissSemiModalViewControllerEnded:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
	UIView* modalView = (UIView*)context;
	[modalView removeFromSuperview];

}

@end
