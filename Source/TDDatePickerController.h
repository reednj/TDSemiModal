//
//  TDDatePickerController.h
//
//  Created by Nathan  Reed on 30/09/10.
//  Copyright 2010 Nathan Reed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	"TDSemiModal.h"

@protocol TDDatePickerControllerDelegate;

@interface TDDatePickerController : TDSemiModalViewController {
	id<TDDatePickerControllerDelegate> delegate;
}

@property (nonatomic, strong) IBOutlet id<TDDatePickerControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UIDatePicker* datePicker;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

-(IBAction)saveDateEdit:(id)sender;
-(IBAction)clearDateEdit:(id)sender;
-(IBAction)cancelDateEdit:(id)sender;

@end

@protocol TDDatePickerControllerDelegate <NSObject>

- (void)datePickerSetDate:(TDDatePickerController*)viewController;
- (void)datePickerClearDate:(TDDatePickerController*)viewController;
- (void)datePickerCancel:(TDDatePickerController*)viewController;

@end

