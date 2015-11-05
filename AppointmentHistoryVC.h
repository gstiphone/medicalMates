//
//  AppointmentHistoryVC.h
//  MedicalMates
//
//  Created by User on 18/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentHistoryVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    
    IBOutlet UIPickerView *datepicker;
    UIToolbar *toolbar;
    BOOL start,end,finish;
    NSMutableArray *TypeArray;
    NSString *strType;
    
    NSArray * arr;
    
}
@property (weak, nonatomic) IBOutlet UILabel *lblstartdate;
//@property (weak, nonatomic) IBOutlet *lblenddate;
@property (weak, nonatomic) IBOutlet UILabel *lblenddate;
- (IBAction)btnStartdate:(id)sender;
- (IBAction)btnEnddate:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblStartdateShow;

@property (weak, nonatomic) IBOutlet UILabel *lblEnddateShow;
@property (weak, nonatomic) IBOutlet UIDatePicker *datepicker;

@property(nonatomic, retain) NSDate *date;
- (IBAction)btnBack:(id)sender;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *lblType;
@property (weak, nonatomic) IBOutlet UIButton *btnTypeShow;
- (IBAction)btnTypeshow:(id)sender;

@property (nonatomic, retain)NSMutableArray*arrReferTo,*arrReferBy,*arrPname,*arrDate,*arrTime;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end
