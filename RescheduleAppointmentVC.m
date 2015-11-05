//
//  RescheduleAppointmentVC.m
//  MedicalMates
//
//  Created by User on 17/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "RescheduleAppointmentVC.h"
#import "Global.h"
#import "JsonLoader.h"
#import "ReferApatientVC.h"
#import "ViewAccountVC.h"
#import "AppointmentListVC.h"
#define IS_IPAD (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad && [UIScreen mainScreen].bounds.size.height==1024)

#define IS_IPHONE5 (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height==568)


@interface RescheduleAppointmentVC ()

@end

@implementation RescheduleAppointmentVC


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {
        
        [_txtvewRemarks resignFirstResponder];
        // Return FALSE so that the final '\n' character doesn't get added
        return NO;
    }
    // For any other character return TRUE so that the text gets added to the view
    return YES;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    datePicker.hidden = YES;
    timePicker.hidden = YES;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// http://appt.healthwaymedical.com.sg

- (IBAction)btnChangeSchedule:(id)sender {
    
    MedicalMatesDetails = [NSUserDefaults standardUserDefaults];
    JsonLoader *jloader = [[JsonLoader alloc]init];
    
    NSString *str = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=changeapptschedule&appid=%@&userid=%@&app_date=%@&app_time=%@&patient_name=%@&remarks=%@",[MedicalMatesDetails valueForKey:@"app_id"],[MedicalMatesDetails valueForKey:@"refferBy"],_lblDate.text,_lblTime.text,[MedicalMatesDetails valueForKey:@"fullname"],_txtvewRemarks.text];
    NSLog(@"%@",str);
    NSURL*url =[[NSURL alloc] initWithString:[str stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSLog(@"%@",url);
    NSDictionary *dic = [jloader dictioneryFromJson:url];
    NSLog(@"%@",dic);
    NSArray *arr = [dic valueForKey:@"response"];
    NSLog(@"%@",arr);
    
    if ([[dic valueForKey:@"Success"]isEqualToString:@"true"])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0] valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AppointmentListVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentListVC"];
        [self.navigationController pushViewController:View animated:NO];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0] valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
    
    
    
}

- (IBAction)btnReferPatient:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ReferApatientVC *View = [storyboard instantiateViewControllerWithIdentifier:@"ReferApatientVC"];
    [self.navigationController pushViewController:View animated:NO];
    
}

- (IBAction)btnAppList:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AppointmentListVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentListVC"];
    [self.navigationController pushViewController:View animated:NO];
}

- (IBAction)btnViewAccount:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewAccountVC *View = [storyboard instantiateViewControllerWithIdentifier:@"ViewAccountVC"];
    [self.navigationController pushViewController:View animated:NO];
}

- (IBAction)btnDate:(id)sender {
    date=YES;
        [toolbar removeFromSuperview];
    //    _Pickerview = [[UIPickerView alloc]init];
    //    _Pickerview.dataSource = self;
    //    _Pickerview.delegate = self;
    //    _Pickerview.showsSelectionIndicator = YES;
    datePicker.hidden=NO;
    timePicker.hidden = YES;
    datePicker.backgroundColor = [UIColor whiteColor];
    
    if (IS_IPAD)
    {
        datePicker.frame = CGRectMake(0, 810, self.view.frame.size.width, 260);
    }
    else if (IS_IPHONE5)
    {
        datePicker.frame = CGRectMake(0, 360, self.view.frame.size.width, 260);
    }
    else
    {
      datePicker.frame = CGRectMake(0, 460, self.view.frame.size.width, 260);
    }

    
    toolbar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-datePicker.frame.size.height,self.view.frame.size.width,50)];
    [toolbar setBarStyle:UIBarStyleBlackOpaque];
    UIBarButtonItem* barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                      style:UIBarButtonItemStyleDone target:self action:@selector(doneClick:)];
    toolbar.items = [[NSArray alloc] initWithObjects:barButtonDone,nil];
    barButtonDone.tintColor=[UIColor blackColor];
    [self.view addSubview:toolbar];
    //(or)pickerView.inputAccessoryView = toolBar;
    //    [self.view addSubview:_Pickerview];

}

- (IBAction)btnTime:(id)sender {
    time=YES;
    [toolbar removeFromSuperview];
    
       datePicker.hidden = YES;
    timePicker.hidden=NO;
    timePicker.backgroundColor = [UIColor whiteColor];
    if (IS_IPAD)
    {
        timePicker.frame = CGRectMake(0, 810, self.view.frame.size.width, 260);
    }
    else if (IS_IPHONE5)
    {
        timePicker.frame = CGRectMake(0, 360, self.view.frame.size.width, 260);
    }
    else
    {
      timePicker.frame = CGRectMake(0, 460, self.view.frame.size.width, 260);
    }

    
    toolbar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-timePicker.frame.size.height,self.view.frame.size.width,50)];
    [toolbar setBarStyle:UIBarStyleBlackOpaque];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                      style:UIBarButtonItemStyleDone target:self action:@selector(doneClick:)];
    toolbar.items = [[NSArray alloc] initWithObjects:barButtonDone,nil];
    barButtonDone.tintColor=[UIColor blackColor];
    [self.view addSubview:toolbar];
}



-(IBAction)doneClick:(id)sender{
    
    //    [datePicker becomeFirstResponder];
    //    //
    //    [datePicker resignFirstResponder];
    
    if (date==YES)
    {
        date=NO;
        _date = [datePicker date];
        NSLog(@"%@",_date);
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        //    NSDate *yourDate = [dateFormatter dateFromString:[datePicker date]];
        dateFormatter.dateFormat = @"dd-MM-yyyy";
        //    NSLog(@"%@",[dateFormatter stringFromDate:yourDate]);
        NSString *mydate = [dateFormatter stringFromDate:_date];
        NSLog(@"%@",mydate);
        
        
        _lblDate.text =mydate;
        toolbar.hidden =YES;
        //        [datePicker removeFromSuperview];
        datePicker.hidden=YES;
    }
    else if(time==YES)
    {
        time=NO;
        
        _date = [timePicker date];
        NSLog(@"%@",_date);
        
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        //    NSDate *yourDate = [dateFormatter dateFromString:[datePicker date]];
        dateFormatter.dateFormat = @"HH:mm a";
        //    NSLog(@"%@",[dateFormatter stringFromDate:yourDate]);
        NSString *mydate = [dateFormatter stringFromDate:_date];
        NSLog(@"%@",mydate);
        
        _lblTime.text=mydate;
        
        toolbar.hidden =YES;
        //        [timePicker removeFromSuperview];
        timePicker.hidden=YES;
        
    }




}








@end
