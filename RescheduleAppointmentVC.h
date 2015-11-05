//
//  RescheduleAppointmentVC.h
//  MedicalMates
//
//  Created by User on 17/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RescheduleAppointmentVC : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextViewDelegate>
{
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UIDatePicker *timePicker;
    UIToolbar *toolbar;
    
    BOOL date,time;
    
}


- (IBAction)btnChangeSchedule:(id)sender;
- (IBAction)btnReferPatient:(id)sender;
- (IBAction)btnAppList:(id)sender;
- (IBAction)btnViewAccount:(id)sender;
- (IBAction)btnDate:(id)sender;
- (IBAction)btnTime:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UITextView *txtvewRemarks;
@property(nonatomic, retain) NSDate *date;


@end
