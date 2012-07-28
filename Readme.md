TDSemiModal
===========

Include like this:

    #import "TDSemiModal.h"

In order to show up your own modal view, just do this:

    [self presentSemiModalViewController:newview];

And to hide:

    [self dismissSemiModalViewController:newview];

A semi transparent 'cover' will be automatically put in to stop the user from interacting with the UI behind, so I recommend you set the background on your view to completely transparent.

Obviously you can create whatever semi-modal view you want, but a datepicker must be one of the most common usages, so I knocked up a class for that too.

DatePicker
----------

This project also contains a datepicker view based off the TDSemiModal class.

The datepicker is quite simple to use - just create and display as before:

    #import "TDDatePickerController.h"
    TDDatePickerController* datePickerView = [[TDDatePickerController alloc]
                                  initWithNibName:@"TDDatePickerController"
                                  bundle:nil];
    datePickerView.delegate = self;
    [self presentSemiModalViewController:datePickerView];

Then you just need to catch the following actions in your delegate when the date is actually selected:

    -(void)datePickerSetDate:(TDDatePickerController*)viewController;
    -(void)datePickerClearDate:(TDDatePickerController*)viewController;
    -(void)datePickerCancel:(TDDatePickerController*)viewController;
    
