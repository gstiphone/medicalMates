//
//  AppointmentConformationVC.m
//  MedicalMates
//
//  Created by User on 03/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "AppointmentConformationVC.h"
#import "Global.h"
#import "JsonLoader.h"
#import "RescheduleAppointmentVC.h"
#import "ReferApatientVC.h"
#import "ViewAccountVC.h"
#import "AppointmentListVC.h"

@interface AppointmentConformationVC ()

@end

@implementation AppointmentConformationVC

- (void)viewDidLoad {
    
    MedicalMatesDetails = [NSUserDefaults standardUserDefaults];
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
//    [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"app_id"] forKey:@"app_id"];
//    [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"app_date"] forKey:@"app_date"];
//    [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"app_time"] forKey:@"app_time"];
//    [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"remarks"] forKey:@"remarks"];
//    [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"patient_full_name"] forKey:@"fullname"];
   JsonLoader *jloader = [[JsonLoader alloc]init];
    
    NSString *str = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=getapptdetails&appid=%@",[MedicalMatesDetails valueForKey:@"app_id"]];
    
//    NSString *str = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=getapptdetails&appid=%@",[MedicalMatesDetails valueForKey:@"app_id"]];
    NSLog(@"%@",str);
    NSURL *url = [[NSURL alloc] initWithString:[str stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSLog(@"%@",url);
    NSDictionary *dic = [jloader dictioneryFromJson:url];
    NSLog(@"%@",dic);
    NSArray *arr = [dic valueForKey:@"response"];
    NSLog(@"%@",arr);
    
    
    if ([[dic valueForKey:@"Success"]isEqualToString:@"true"])
    {
        _lblDate.text = [[arr objectAtIndex:0]valueForKey:@"app_date"];
        _lblName.text =  [[arr objectAtIndex:0]valueForKey:@"patient_full_name"];
        _lblTime.text = [[arr objectAtIndex:0]valueForKey:@"app_time"];
        _lblRemark.text=[[arr objectAtIndex:0]valueForKey:@"remarks"];

        [MedicalMatesDetails setObject:[[arr objectAtIndex:0] valueForKey:@"referring_by_id"] forKey:@"refferBy"];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }

    
    
    
    
//    _lblDate.text = [MedicalMatesDetails valueForKey:@"app_date"];
//    _lblName.text = [MedicalMatesDetails valueForKey:@"fullname"];
//    _lblTime.text = [MedicalMatesDetails valueForKey:@"app_time"];
//    _lblRemark.text = [MedicalMatesDetails valueForKey:@"remarks"];
    
    
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

- (IBAction)btnAccept:(id)sender {
    MedicalMatesDetails = [NSUserDefaults standardUserDefaults];
    JsonLoader *jloader = [[JsonLoader alloc]init];
    
    
//http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=acceptappt&appid=104
    
    // http://appt.healthwaymedical.com.sg

    NSString *strAccept = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=acceptappt&appid=%@",[MedicalMatesDetails valueForKey:@"app_id"]];
    NSLog(@"%@",strAccept);
    NSURL *urlaccept = [[NSURL alloc] initWithString:[strAccept stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSDictionary *dic =[jloader dictioneryFromJson:urlaccept];
    NSLog(@"%@",dic);
    NSArray *arr = [dic valueForKey:@"response"];
    NSLog(@"%@",arr);
    NSLog(@"%@",[dic valueForKey:@"Success"]);
    
    if ([[dic valueForKey:@"Success"]isEqualToString:@"true"])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AppointmentListVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentListVC"];
        [self.navigationController pushViewController:View animated:NO];
        
       
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
    
       
    
    
}

- (IBAction)btnChangeSchedule:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RescheduleAppointmentVC *View = [storyboard instantiateViewControllerWithIdentifier:@"RescheduleAppointmentVC"];
    [self.navigationController pushViewController:View animated:NO];
    
}

- (IBAction)btnReferPatient:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ReferApatientVC *View = [storyboard instantiateViewControllerWithIdentifier:@"ReferApatientVC"];
    [self.navigationController pushViewController:View animated:NO];
    
}

- (IBAction)btnAppList:(id)sender {
//    [self.navigationController popViewControllerAnimated:NO];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AppointmentListVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentListVC"];
    [self.navigationController pushViewController:View animated:NO];

    
}

- (IBAction)btnViewAccount:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewAccountVC *View = [storyboard instantiateViewControllerWithIdentifier:@"ViewAccountVC"];
    [self.navigationController pushViewController:View animated:NO];
    
    
}
@end
