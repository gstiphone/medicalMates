//
//  ViewAccountVC.h
//  MedicalMates
//
//  Created by User on 05/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewAccountVC : UIViewController<UIActionSheetDelegate>
{
    
    BOOL change,reward,months,years;
    UIActionSheet*options_ActionSheet;
    
    UIToolbar *toolBar;
    NSString *returnString;
    NSMutableData *responseData;
}


- (IBAction)btnReferaP:(id)sender;
- (IBAction)btnAppList:(id)sender;
- (IBAction)btnViewAccount:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblID;
@property (weak, nonatomic) IBOutlet UILabel *lblChangePwd;
@property (weak, nonatomic) IBOutlet UILabel *lblRewardPoint;


@property (weak, nonatomic) IBOutlet UIButton *btnViewAccount;
@property (weak, nonatomic) IBOutlet UIButton *btnAppList;
@property (weak, nonatomic) IBOutlet UIButton *btnReferaP;

@property (weak, nonatomic) IBOutlet UIImageView *changePasswordsignImageview;
@property (weak, nonatomic) IBOutlet UIView *PasswordView;
- (IBAction)btnChangePassword:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalNoOfAppointsments;
@property (weak, nonatomic) IBOutlet UILabel *lblPointsAwarded;
@property (weak, nonatomic) IBOutlet UIView *RewardPointsView;


- (IBAction)btnRewadPoints:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *RewadrPointImageview;
- (IBAction)btnUploadPicture:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *UploadPictureImageview;

- (IBAction)btnSubmitPassword:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerview;
- (IBAction)btnSubMonth:(id)sender;
- (IBAction)btnSubYear:(id)sender;

@property (nonatomic, retain)NSMutableArray *monthArray, *yearArray ,*monthcount;
@property (weak, nonatomic) IBOutlet UILabel *lblMonthShow;
@property (weak, nonatomic) IBOutlet UILabel *lblYearShow;
@property (weak, nonatomic) IBOutlet UITextField *OldPasswordTextField;
@property (weak, nonatomic) IBOutlet UIImageView *NewPasswordTextfield;
@property (weak, nonatomic) IBOutlet UIImageView *ConfirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *NewPassTextfield;
@property (weak, nonatomic) IBOutlet UITextField *ConPassTextfield;
@property (weak, nonatomic) IBOutlet UILabel *lblShowMonthPoint;
@property (weak, nonatomic) IBOutlet UILabel *lblShowYearPoint;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalAppointment;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalPointsAwarded;
@property (weak, nonatomic) IBOutlet UILabel *secondTotalMonthAppo;
@property (weak, nonatomic) IBOutlet UILabel *secondTotalYearAppo;

//@property (weak, nonatomic) IBOutlet UILabel *lblID;
@property (weak, nonatomic) IBOutlet UILabel *lblIDshow;


@end
