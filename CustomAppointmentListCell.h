//
//  CustomAppointmentListCell.h
//  MedicalMates
//
//  Created by User on 09/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAppointmentListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UIButton *btnEdit;
@property (weak, nonatomic) IBOutlet UILabel *lblDrname;

@end
