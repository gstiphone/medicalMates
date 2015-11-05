//
//  CustomAppointmentHistory.h
//  MedicalMates
//
//  Created by User on 18/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAppointmentHistory : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblReferToshow;
@property (weak, nonatomic) IBOutlet UILabel *lblReferByshow;
@property (weak, nonatomic) IBOutlet UILabel *lblPatientNameshow;
@property (weak, nonatomic) IBOutlet UILabel *lblDateshow;
@property (weak, nonatomic) IBOutlet UILabel *lblTimeshow;

@end
