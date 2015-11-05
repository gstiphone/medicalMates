//
//  AppointmentListVC.m
//  MedicalMates
//
//  Created by User on 09/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "AppointmentListVC.h"
#import "CustomAppointmentListCell.h"
#import "Global.h"
#import "JsonLoader.h"
#import "ReferApatientVC.h"
#import "ViewAccountVC.h"
#import "AppointmentStatusVC.h"
#import "AppointmentConformationVC.h"
#import "AppointmentHistoryVC.h"

@interface AppointmentListVC ()

@end

@implementation AppointmentListVC

-(void)viewWillAppear:(BOOL)animated{
    
    [self.tableView reloadData];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    MedicalMatesDetails=[NSUserDefaults standardUserDefaults];
    
    
    [_tableView setBackgroundColor:[UIColor clearColor]];
    
    
    _btnViewAccount.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:11.0f];
    
    _btnrefApatientOut.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:11.0f];
    _btnAppListOut.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:11.0f];
    
    
    // Do any additional setup after loading the view.
    
    JsonLoader *jloader = [[JsonLoader alloc]init];
//    _PatientNameArray = [[NSMutableArray alloc]init];
//    _DrNameArray  = [[NSMutableArray alloc]init];
//    _DateArray  = [[NSMutableArray alloc]init];
//    _TimeArray  = [[NSMutableArray alloc]init];
//    
//    
//    
//    
//    NSString *str  = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=getallapt&userid=%@",[MedicalMatesDetails valueForKey:@"UserId"]];
//    NSLog(@"%@",str);
//    NSURL *url = [[NSURL alloc] initWithString:[str stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
//    NSLog(@"%@",url);
//    NSDictionary *dic = [jloader dictioneryFromJson:url];
//    NSLog(@"%@",dic);
//    arr = [dic valueForKey:@"response"];
//    NSLog(@"%@",arr);
//    
//    if ([[dic valueForKey:@"Success"]isEqualToString:@"true"])
//    {
//        for (int i=0; i<[arr count]; i++)
//        {
//            [_PatientNameArray addObject:[[arr objectAtIndex:i]valueForKey:@"patient_full_name"]];
//            [_DrNameArray addObject:[[arr objectAtIndex:i]valueForKey:@"referring_to"]];
//            [_DateArray addObject:[[arr objectAtIndex:i]valueForKey:@"app_date"]];
//            [_TimeArray addObject:[[arr objectAtIndex:i]valueForKey:@"app_time"]];
//        }
//    }
//    else
//    {
//        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//    }
    

    
    NSString *string =[MedicalMatesDetails valueForKey:@"UserType"];
    NSLog(@"%@",string);
    

    if ([[MedicalMatesDetails valueForKey:@"UserType"]isEqualToString:@"SP"])
    {
        _ReceiveListImgvew.hidden=NO;
        _ReferedListImgvew.hidden=NO;
        _btnReceive.hidden = NO;
        _btnRefer.hidden = NO;
        _AppointHistoryImgvew.hidden=YES;
        _btnAppointHistory.hidden=YES;
        _SeparationBar.hidden=YES;
        

    }
    else if ([[MedicalMatesDetails valueForKey:@"UserType"]isEqualToString:@"AD"])
    {
        _ReceiveListImgvew.hidden=YES;
        _ReferedListImgvew.hidden=YES;
        _btnReceive.hidden = YES;
        _btnRefer.hidden = YES;
        _AppointHistoryImgvew.hidden=NO;
        _btnAppointHistory.hidden=NO;
        _SeparationBar.hidden = YES;

    }
    else
    {
        _ReceiveListImgvew.hidden=YES;
        _ReferedListImgvew.hidden=YES;
        _btnReceive.hidden = YES;
        _btnRefer.hidden = YES;
        _AppointHistoryImgvew.hidden=YES;
        _btnAppointHistory.hidden=YES;
        
    }
    
    
    
    
    
    
//    if ([[MedicalMatesDetails valueForKey:@"UserType"]isEqualToString:@"SP"])
//    {
//        _ReceiveListImgvew.hidden=NO;
//        _ReferedListImgvew.hidden=NO;
//        _btnReceive.hidden = NO;
//        _btnRefer.hidden = NO;
//        _AppointHistoryImgvew.hidden=YES;
//        _btnAppointHistory.hidden=YES;
//        
//        
//        
//    }
//    else if ([[MedicalMatesDetails valueForKey:@"UserType"]isEqualToString:@"AD"])
//    {
//        
//        _ReceiveListImgvew.hidden=YES;
//        _ReferedListImgvew.hidden=YES;
//        _btnReceive.hidden = YES;
//        _btnRefer.hidden = YES;
//        _AppointHistoryImgvew.hidden=NO;
//        _btnAppointHistory.hidden=NO;
//        
//        
//        
//    }
//    else
//    {
//        _ReceiveListImgvew.hidden=YES;
//        _ReferedListImgvew.hidden=YES;
//        _btnReceive.hidden = YES;
//        _btnRefer.hidden = YES;
//        _AppointHistoryImgvew.hidden=YES;
//        _btnAppointHistory.hidden=YES;
//        
//    }
    
    
    
    
    
    
    
    
    [self fetchdata];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fetchdata {
    
    
    MedicalMatesDetails=[NSUserDefaults standardUserDefaults];
    
    
    // Do any additional setup after loading the view.
    
    JsonLoader *jloader = [[JsonLoader alloc]init];
    _PatientNameArray = [[NSMutableArray alloc]init];
    _DrNameArray  = [[NSMutableArray alloc]init];
    _DateArray  = [[NSMutableArray alloc]init];
    _TimeArray  = [[NSMutableArray alloc]init];
    
  //  http://appt.healthwaymedical.com.sg
  //    http://gstcloud.com/developer/medical-mates
    
    NSString *str  = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=getallapt&userid=%@",[MedicalMatesDetails valueForKey:@"UserId"]];
    NSLog(@"%@",str);
    NSURL *url = [[NSURL alloc] initWithString:[str stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSLog(@"%@",url);
    NSDictionary *dic = [jloader dictioneryFromJson:url];
    NSLog(@"%@",dic);
    arr = [dic valueForKey:@"response"];
    NSLog(@"%@",arr);
    
    if ([[dic valueForKey:@"Success"]isEqualToString:@"true"])
    {
        for (int i=0; i<[arr count]; i++)
        {
            [_PatientNameArray addObject:[[arr objectAtIndex:i]valueForKey:@"patient_full_name"]];
            [_DrNameArray addObject:[[arr objectAtIndex:i]valueForKey:@"referring_to"]];
            [_DateArray addObject:[[arr objectAtIndex:i]valueForKey:@"app_date"]];
            [_TimeArray addObject:[[arr objectAtIndex:i]valueForKey:@"app_time"]];
        }
    }
    else
    {
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

    
    [self.tableView reloadData];
    
}


-(void)fetchSpecialList {
    
    
    MedicalMatesDetails=[NSUserDefaults standardUserDefaults];
    
    
    // Do any additional setup after loading the view.
    
    JsonLoader *jloader = [[JsonLoader alloc]init];
    _PatientNameArray = [[NSMutableArray alloc]init];
    _DrNameArray  = [[NSMutableArray alloc]init];
    _DateArray  = [[NSMutableArray alloc]init];
    _TimeArray  = [[NSMutableArray alloc]init];
    
    
    NSString *str  = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=getallapt_sp&userid=%@",[MedicalMatesDetails valueForKey:@"UserId"]];
    
//    NSString *str  = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=getallapt_sp&userid=%@",[MedicalMatesDetails valueForKey:@"UserId"]];
    NSLog(@"%@",str);
    NSURL *url = [[NSURL alloc] initWithString:[str stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSLog(@"%@",url);
    NSDictionary *dic = [jloader dictioneryFromJson:url];
    NSLog(@"%@",dic);
    arr = [dic valueForKey:@"response"];
    NSLog(@"%@",arr);
    
    if ([[dic valueForKey:@"Success"]isEqualToString:@"true"])
    {
        for (int i=0; i<[arr count]; i++)
        {
            [_PatientNameArray addObject:[[arr objectAtIndex:i]valueForKey:@"patient_full_name"]];
            [_DrNameArray addObject:[[arr objectAtIndex:i]valueForKey:@"referring_by"]];
            [_DateArray addObject:[[arr objectAtIndex:i]valueForKey:@"app_date"]];
            [_TimeArray addObject:[[arr objectAtIndex:i]valueForKey:@"app_time"]];
        }
    }
    else
    {
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

    
    
    
    [self.tableView reloadData];
    
    
}









- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    NSUInteger count = [_PatientNameArray count];
    
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSUInteger count = [_PatientNameArray count];
    
    if (count ==0 && indexPath.row ==0)
    {
        
        
        
        static NSString *CellIdentifier = @"Cell";
        CustomAppointmentListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        cell.lblName.text = @"loading....";
        cell.lblDate.text =@".....";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // Configure the cell...
        
        return cell;
    }
    
    
    CustomAppointmentListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    if (cell == nil) {
        cell = [[CustomAppointmentListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    NSDictionary *dic = [arr objectAtIndex:indexPath.row];
    NSLog(@"...>>>%@",dic);
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    cell.btnEdit.tag = indexPath.row;
    
    
    //    if ([[dic valueForKey:@"cat_name"]isEqualToString:@""] || [dic valueForKey:@"cat_name"]==nil || [[dic valueForKey:@"cat_name"]isEqual:[NSNull null]])
    //    {
    //        cell.lblCatName.text = @"not Found";
    //
    //    }
    //    else
    //    {
    //       cell.lblCatName.text = [dic valueForKey:@"cat_name"];
    //    }
    
    cell.lblName.text = [dic valueForKey:@"patient_full_name"];
    //    cell.lblCatName.text = [dic valueForKey:@"cat_name"];
    cell.lblDate.text = [dic valueForKey:@"app_date"];
    cell.lblTime.text = [dic valueForKey:@"app_time"];
    cell.lblDrname.text = [dic valueForKey:@"referring_to"];
    
    cell.btnEdit.tag=indexPath.row;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnReferApatient:(id)sender {
    
//    [self.navigationController popViewControllerAnimated:NO];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ReferApatientVC *View = [storyboard instantiateViewControllerWithIdentifier:@"ReferApatientVC"];
    [self.navigationController pushViewController:View animated:NO];

    
}

- (IBAction)btnAppList:(id)sender {
}
- (IBAction)btnViewAccount:(id)sender {
    
//    [self.navigationController popViewControllerAnimated:NO];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewAccountVC *View = [storyboard instantiateViewControllerWithIdentifier:@"ViewAccountVC"];
    [self.navigationController pushViewController:View animated:NO];

    
    
}

- (IBAction)btnEdit:(id)sender {
    
    UIButton *button=(id)sender;
    
    MedicalMatesDetails = [NSUserDefaults standardUserDefaults];
    if ([[MedicalMatesDetails valueForKey:@"UserType"]isEqualToString:@"SP"])
    {
        
       
    if ([[[arr objectAtIndex:button.tag] valueForKey:@"status"]isEqualToString:@"P"])
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AppointmentConformationVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentConformationVC"];
        
        [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"app_id"] forKey:@"app_id"];
        [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"app_date"] forKey:@"app_date"];
        [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"app_time"] forKey:@"app_time"];
        [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"remarks"] forKey:@"remarks"];
        [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"patient_full_name"] forKey:@"fullname"];
        
        
        [self.navigationController pushViewController:View animated:NO];

    }
    
    else
    {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AppointmentStatusVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentStatusVC"];
        
        View.detailList = [arr objectAtIndex:button.tag];
        NSLog(@"%@",View.detailList);
        NSString *str = [[arr objectAtIndex:button.tag] valueForKey:@"app_id"];
        NSLog(@"%@",str);
        [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"app_id"] forKey:@"app_id"];
        NSLog(@"%@",[MedicalMatesDetails valueForKey:@"AppID"]);
        
        [self.navigationController pushViewController:View animated:NO];
    }

}
    
    else
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AppointmentStatusVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentStatusVC"];
        
        View.detailList = [arr objectAtIndex:button.tag];
        NSLog(@"%@",View.detailList);
        NSString *str = [[arr objectAtIndex:button.tag] valueForKey:@"app_id"];
        NSLog(@"%@",str);
        [MedicalMatesDetails setObject:[[arr objectAtIndex:button.tag] valueForKey:@"app_id"] forKey:@"app_id"];
        NSLog(@"%@",[MedicalMatesDetails valueForKey:@"AppID"]);
        
        [self.navigationController pushViewController:View animated:NO];
        
    }

    
}

-(void)imagetapped:(UIButton *)button{
    
    if (ref==YES)
    {
        ref=NO;
        _ReferedListImgvew.image = [UIImage imageNamed:@"new_textfield@six.png"];
        _ReceiveListImgvew.image =[UIImage imageNamed:@"submit@six.png"];
        [self fetchdata];
        
        
    }
    else if (receive==YES)
    {
        receive=NO;
        _ReferedListImgvew.image = [UIImage imageNamed:@"submit@six.png"];
        _ReceiveListImgvew.image =[UIImage imageNamed:@"new_textfield@six.png"];
        [self fetchSpecialList];
        
    }
    
    
    
    
}



- (IBAction)btnReferList:(id)sender {
    
    ref = YES;
    [self imagetapped:_btnRefer];
    
    
    
    
}
- (IBAction)btnReceiveList:(id)sender {
    
    receive = YES;
    [self imagetapped:_btnReceive];
    
    
    
    
}
- (IBAction)btnAppointmentHistory:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AppointmentHistoryVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentHistoryVC"];
    [self.navigationController pushViewController:View animated:NO];
    
    
}
@end
