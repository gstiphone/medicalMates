//
//  AppointmentConformationVC.h
//  MedicalMates
//
//  Created by User on 03/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentConformationVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblRemark;
- (IBAction)btnAccept:(id)sender;
- (IBAction)btnChangeSchedule:(id)sender;
- (IBAction)btnReferPatient:(id)sender;
- (IBAction)btnAppList:(id)sender;
- (IBAction)btnViewAccount:(id)sender;

@end
