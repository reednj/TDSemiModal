//
//  TDSemiModalViewController.h
//  TDSemiModal
//
//  Created by Nathan  Reed on 18/10/10.
//  Copyright 2010 Nathan Reed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDDatePickerController.h"

@interface TDSemiModalDemoViewController : UIViewController {
	IBOutlet TDDatePickerController* datePickerView;

	NSDate* selectedDate;
}

-(IBAction)dateButtonClicked:(id)sender;

@end

