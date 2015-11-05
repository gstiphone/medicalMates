//
//  AppointmentStatusVC.h
//  MedicalMates
//
//  Created by User on 12/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentStatusVC : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate>
{
    IBOutlet UIPickerView *pickerview;
    NSMutableArray *statusArr;
    NSString *str;
}
- (IBAction)btnReferPatient:(id)sender;
- (IBAction)btnAppList:(id)sender;
- (IBAction)btnViewAccount:(id)sender;

@property (nonatomic, retain)NSDictionary *detailList;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UITextView *DiagonisisTextView;
- (IBAction)btnPatientSeen:(id)sender;
//@property (weak, nonatomic) IBOutlet UIPickerView *pickerview;
@property (weak, nonatomic) IBOutlet UITextField *textfieldStatus;

-(IBAction)doneClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;

@end
