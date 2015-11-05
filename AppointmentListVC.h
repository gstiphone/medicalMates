//
//  AppointmentListVC.h
//  MedicalMates
//
//  Created by User on 09/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentListVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    
    NSArray *arr ;
    BOOL ref, receive;
    
}

- (IBAction)btnReferApatient:(id)sender;
- (IBAction)btnAppList:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnViewAccount;
- (IBAction)btnViewAccount:(id)sender;
- (IBAction)btnEdit:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnEditdetail;

@property (weak, nonatomic) IBOutlet UIButton *btnrefApatientOut;
@property (weak, nonatomic) IBOutlet UIButton *btnAppListOut;


@property (nonatomic,retain)NSMutableArray *PatientNameArray,*DrNameArray,*DateArray,*TimeArray;

@property (weak, nonatomic) IBOutlet UIImageView *ReferedListImgvew;
@property (weak, nonatomic) IBOutlet UIImageView *ReceiveListImgvew;
@property (weak, nonatomic) IBOutlet UIButton *btnRefer;
- (IBAction)btnReferList:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnReceive;
- (IBAction)btnReceiveList:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *AppointHistoryImgvew;
@property (weak, nonatomic) IBOutlet UIButton *btnAppointHistory;
- (IBAction)btnAppointmentHistory:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *SeparationBar;



@end
