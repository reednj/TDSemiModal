//
//  TDDatePickerController.h
//
//  Created by Nathan  Reed on 30/09/10.
//  Copyright 2010 Nathan Reed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	"TDSemiModal.h"

@protocol TDDatePickerControllerDelegate;

@interface TDDatePickerController : TDSemiModalViewController

@property (weak) id<TDDatePickerControllerDelegate> delegate;
@property (weak) IBOutlet UIDatePicker* datePicker;
@property (weak) IBOutlet UIToolbar *toolbar;

-(IBAction)saveDateEdit:(id)sender;
-(IBAction)clearDateEdit:(id)sender;
-(IBAction)cancelDateEdit:(id)sender;

@end

@protocol TDDatePickerControllerDelegate <NSObject>

- (void)datePickerSetDate:(TDDatePickerController*)viewController;
- (void)datePickerClearDate:(TDDatePickerController*)viewController;
- (void)datePickerCancel:(TDDatePickerController*)viewController;

@end

