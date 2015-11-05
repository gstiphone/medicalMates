//
//  AppointmentHistoryVC.m
//  MedicalMates
//
//  Created by User on 18/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "AppointmentHistoryVC.h"
#import "JsonLoader.h"
#import "Global.h"
#import "CustomAppointmentHistory.h"
#define IS_IPAD (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad && [UIScreen mainScreen].bounds.size.height==1024)

#define IS_IPHONE5 (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height==568)


@interface AppointmentHistoryVC ()

@end

@implementation AppointmentHistoryVC

- (void)viewDidLoad {
    
    _lblstartdate.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:14.0f];
    _lblenddate.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:14.0f];
    
    _datepicker.hidden =YES;
    _pickerView.hidden=YES;
    
    TypeArray  = [[NSMutableArray alloc]init];
    [TypeArray addObject:@"Admin"];[TypeArray addObject:@"Agent"];[TypeArray addObject:@"General Physician"];[TypeArray addObject:@"Specialist"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self fetchData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// http://appt.healthwaymedical.com.sg

-(void)fetchData
{
    
    JsonLoader*jloader=[[JsonLoader alloc]init];
    
    
    NSString *str = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=admin_allapt"];
//     NSString *str = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=admin_allapt"];
    
    NSLog(@"%@",str);
    NSURL *url = [[NSURL alloc] initWithString:[str stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSLog(@"%@",url);
    NSDictionary *dic=[jloader dictioneryFromJson:url];
    NSLog(@"%@",dic);
    arr = [dic valueForKey:@"response"];
    NSLog(@"%@",arr);
    if ([[dic valueForKey:@"Success"]isEqualToString:@"true"])
    {
        [_tableView reloadData];
    }
    else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
    }
    
    
    
    
    
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnStartdate:(id)sender {
    
    start = YES;
    [toolbar removeFromSuperview];
     _pickerView.hidden=YES;
    _datepicker.hidden=NO;
    _datepicker.backgroundColor = [UIColor whiteColor];
    
    if (IS_IPAD)
    {
        _datepicker.frame = CGRectMake(0, 810, self.view.frame.size.width, 260);
    }
    else if(IS_IPHONE5)
    {
        _datepicker.frame = CGRectMake(0, 360, self.view.frame.size.width, 260);
    }
    else
    {
      _datepicker.frame = CGRectMake(0, 460, self.view.frame.size.width, 260);
        
    }

    
    toolbar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-_datepicker.frame.size.height,self.view.frame.size.width,50)];
    [toolbar setBarStyle:UIBarStyleBlackOpaque];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClick:)];
    toolbar.items = [[NSArray alloc] initWithObjects:barButtonDone,nil];
    barButtonDone.tintColor=[UIColor blackColor];
    [self.view addSubview:toolbar];
    

    
    
    
}

- (IBAction)btnEnddate:(id)sender {
    
    end = YES;
    [toolbar removeFromSuperview];
     _pickerView.hidden=YES;

    _datepicker.hidden=NO;
    _datepicker.backgroundColor = [UIColor whiteColor];
    
    if (IS_IPAD)
    {
        _datepicker.frame = CGRectMake(0, 810, self.view.frame.size.width, 260);
    }
    else if (IS_IPHONE5)
    {
        _datepicker.frame = CGRectMake(0, 360, self.view.frame.size.width, 260);
    }
    else
    {
        _datepicker.frame = CGRectMake(0, 460, self.view.frame.size.width, 260);
    }

    
    toolbar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-_datepicker.frame.size.height,self.view.frame.size.width,50)];
    [toolbar setBarStyle:UIBarStyleBlackOpaque];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClick:)];
    toolbar.items = [[NSArray alloc] initWithObjects:barButtonDone,nil];
    barButtonDone.tintColor=[UIColor blackColor];
    [self.view addSubview:toolbar];
    
}

-(IBAction)doneClick:(id)sender{
    
    //    [datePicker becomeFirstResponder];
    //    //
    //    [datePicker resignFirstResponder];
    JsonLoader *jloader = [[JsonLoader alloc]init];
    _arrReferTo = [[NSMutableArray alloc]init];
    _arrReferBy = [[NSMutableArray alloc]init];
    _arrPname = [[NSMutableArray alloc]init];
    _arrDate = [[NSMutableArray alloc]init];
    _arrTime = [[NSMutableArray alloc]init];
    
    
    if (start==YES)
    {
        start=NO;
        _date = [_datepicker date];
        NSLog(@"%@",_date);
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        //    NSDate *yourDate = [dateFormatter dateFromString:[datePicker date]];
        dateFormatter.dateFormat = @"dd-MM-yyyy";
        //    NSLog(@"%@",[dateFormatter stringFromDate:yourDate]);
        NSString *mydate = [dateFormatter stringFromDate:_date];
        NSLog(@"%@",mydate);
        
        
        _lblStartdateShow.text =mydate;
        toolbar.hidden =YES;
        //        [datePicker removeFromSuperview];
        _datepicker.hidden=YES;
         _pickerView.hidden=YES;
    }
    else if(end==YES)
    {
        end=NO;
        
        _date = [_datepicker date];
        NSLog(@"%@",_date);
        
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        //    NSDate *yourDate = [dateFormatter dateFromString:[datePicker date]];
        dateFormatter.dateFormat = @"dd-MM-yyyy";
        //    NSLog(@"%@",[dateFormatter stringFromDate:yourDate]);
        NSString *mydate = [dateFormatter stringFromDate:_date];
        NSLog(@"%@",mydate);
        
        _lblEnddateShow.text=mydate;
        
        toolbar.hidden =YES;
        //        [timePicker removeFromSuperview];
        _datepicker.hidden=YES;
         _pickerView.hidden=YES;
        
    }
    else if (finish==YES)
    {
        _pickerView.hidden=YES;
        toolbar.hidden=YES;
        finish=NO;
        
        NSString *str = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=admin_allapt&user_type=%@&from_date=%@&to_date=%@",strType, _lblStartdateShow.text, _lblEnddateShow.text];
        NSLog(@"%@",str);
        NSURL *url = [[NSURL alloc] initWithString:[str stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        NSLog(@"%@",url);
        NSDictionary *dic= [jloader dictioneryFromJson:url];
        NSLog(@"%@",dic);
         arr = [dic valueForKey:@"response"];
        NSLog(@"%@",arr);
        
        if ([[dic valueForKey:@"Success"]isEqualToString:@"true"]) {
            
        
        for (int i=0; i<[arr count]; i++)
        {
            [_arrReferTo addObject:[[arr objectAtIndex:i] valueForKey:@"referring_to"]];
            [_arrReferBy addObject:[[arr objectAtIndex:i] valueForKey:@"referring_by"]];
            [_arrPname addObject:[[arr objectAtIndex:i] valueForKey:@"patient_full_name"]];
            [_arrDate addObject:[[arr objectAtIndex:i] valueForKey:@"app_date"]];
            [_arrTime addObject:[[arr objectAtIndex:i] valueForKey:@"app_time"]];
        }
        
        [_tableView reloadData];
        
        }
        
        else {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }

        
    }

    
    toolbar.hidden = YES;

}






- (IBAction)btnBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:NO];
    
    
}
- (IBAction)btnTypeshow:(id)sender {
    
    finish=YES;
    [toolbar removeFromSuperview];

    _pickerView.hidden=NO;
    _pickerView.backgroundColor = [UIColor whiteColor];
    
    if (IS_IPAD)
    {
        _pickerView.frame = CGRectMake(0, 810, self.view.frame.size.width, 260);
    }
    else if(IS_IPHONE5)
    {
        _pickerView.frame = CGRectMake(0, 360, self.view.frame.size.width, 260);
    }
    else
    {
        _pickerView.frame = CGRectMake(0, 460, self.view.frame.size.width, 260);
    }

    
    toolbar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-_pickerView.frame.size.height,self.view.frame.size.width,50)];
    [toolbar setBarStyle:UIBarStyleBlackOpaque];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClick:)];
    toolbar.items = [[NSArray alloc] initWithObjects:barButtonDone,nil];
    barButtonDone.tintColor=[UIColor blackColor];
    [self.view addSubview:toolbar];
    
    
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
    
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return TypeArray.count;
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [TypeArray objectAtIndex:row];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _lblType.text = [NSString stringWithFormat:@"%@",[TypeArray objectAtIndex:[pickerView selectedRowInComponent:0]]];
    
    if ( [_lblType.text isEqualToString:@"Admin"])
    {
        strType = @"AD";
    }
    else if([_lblType.text isEqualToString:@"Agent"])
    {
        strType = @"AG";
    }
    else if ([_lblType.text isEqualToString:@"General Physician"])
    {
        strType = @"GP";
    }
    else if ([_lblType.text isEqualToString:@"Specialist"])
    {
     strType =@"SP";
    }
    
    
    //    NSString*strID = [NSString stringWithFormat:@"%@",[_SPidList objectAtIndex:row ]];
//    NSLog(@"%@",strID);
    
    
    
    
}


//tableview delegate;


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    NSUInteger count = [arr count];
    
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSUInteger count = [arr count];
    
    if (count ==0 && indexPath.row ==0)
    {
        
        
        
        static NSString *CellIdentifier = @"Cell";
        CustomAppointmentHistory *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        cell.lblReferByshow.text = @"loading....";
        cell.lblReferToshow.text =@".....";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // Configure the cell...
        
        return cell;
    }
    
    
    CustomAppointmentHistory *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    if (cell == nil) {
        cell = [[CustomAppointmentHistory alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    NSDictionary *dic = [arr objectAtIndex:indexPath.row];
    NSLog(@"...>>>%@",dic);
    
    
//    cell.btnEdit.tag = indexPath.row;
    
    
    //    if ([[dic valueForKey:@"cat_name"]isEqualToString:@""] || [dic valueForKey:@"cat_name"]==nil || [[dic valueForKey:@"cat_name"]isEqual:[NSNull null]])
    //    {
    //        cell.lblCatName.text = @"not Found";
    //
    //    }
    //    else
    //    {
    //       cell.lblCatName.text = [dic valueForKey:@"cat_name"];
    //    }
    
    cell.lblPatientNameshow.text = [dic valueForKey:@"patient_full_name"];
    //    cell.lblCatName.text = [dic valueForKey:@"cat_name"];
    cell.lblReferByshow.text = [dic valueForKey:@"referring_by"];
    cell.lblReferToshow.text = [dic valueForKey:@"referring_to"];
    cell.lblDateshow.text = [dic valueForKey:@"app_date"];
    cell.lblTimeshow.text = [dic valueForKey:@"app_time"];
    
//    cell.btnEdit.tag=indexPath.row;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}








@end
