//
//  ReferApatientVC.h
//  MedicalMates
//
//  Created by User on 03/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReferApatientVC : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

{
    UIAlertView *logoutalert;

   IBOutlet  UIPickerView *pickerView;
    BOOL reffer,date,time;
    UITextField *referenceTextfieldf;
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UIDatePicker *timePicker;
    
    UITextField *textfieldResine;
   
    UIToolbar *toolBar;
    UIActivityIndicatorView *spinner;

}
-(IBAction)doneClick:(id)sender;

- (IBAction)btnSubmit:(id)sender;
- (IBAction)btnBack:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblContact;
@property (weak, nonatomic) IBOutlet UILabel *lblReferTo;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblRemark;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@property (weak, nonatomic) IBOutlet UIButton *btnRefaP;
@property (weak, nonatomic) IBOutlet UIButton *btnApptList;
@property (weak, nonatomic) IBOutlet UIButton *btnViewAccount;
- (IBAction)btnViewAccount:(id)sender;
- (IBAction)btnAppList:(id)sender;
- (IBAction)btnReferaP:(id)sender;
- (IBAction)btnDate:(id)sender;
- (IBAction)btnTime:(id)sender;
- (IBAction)btnReferTo:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *btnDate;
@property (weak, nonatomic) IBOutlet UILabel *lblDateBtn;
@property (weak, nonatomic) IBOutlet UITextField *txtDatebtn;

//===============================
@property(nonatomic,retain)NSMutableArray *daysArray,*monthsArray,*yearArray,*listOfDoctors,*SPidList;

@property (weak, nonatomic) IBOutlet UITextField *PatientNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *ContactNoTextfield;
@property (weak, nonatomic) IBOutlet UITextField *ReferringTextfield;
@property (weak, nonatomic) IBOutlet UITextField *DateTextfield;
@property (weak, nonatomic) IBOutlet UITextField *TimeTextfield;
@property (weak, nonatomic) IBOutlet UITextView *RemarksTextview;
@property (weak, nonatomic) IBOutlet UIPickerView *Pickerview;

@property(nonatomic, retain) NSDate *date;

@property (weak, nonatomic) IBOutlet UITextField *RemarksTextfield;

@property (weak, nonatomic) IBOutlet UIButton *btnreferingTo;
@property (weak, nonatomic) IBOutlet UIButton *btnDateoutlet;
@property (weak, nonatomic) IBOutlet UIButton *btnTimeOutlet;




@end
