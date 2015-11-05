//
//  ReferApatientVC.m
//  MedicalMates
//
//  Created by User on 03/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "ReferApatientVC.h"
#import "ViewAccountVC.h"
#import "JsonLoader.h"
#import "Global.h"
#import "AppointmentListVC.h"
#import "ViewController.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad && [UIScreen mainScreen].bounds.size.height==1024)

#define IS_IPHONE5 (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height==568)


@interface ReferApatientVC ()

@end

@implementation ReferApatientVC
{
    
    NSURL *url;
}

- (BOOL)textFieldShouldBegineEditing:(UITextField *)textField{
    
    //textfieldResine = textField;
     if(textfieldResine==_ContactNoTextfield)
    {
        [textfieldResine resignFirstResponder];
   }
    
    if(textfieldResine==_RemarksTextfield)
    {
        [textfieldResine resignFirstResponder];
    }

    
    return YES;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:.5];
    self.view.frame = CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
    [UIView commitAnimations];
    textfieldResine = textField;
    [textField resignFirstResponder];
    
    return YES;
    
}

#pragma mark - Text field delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    //    [_scrlView setFrame:CGRectMake(0, 0, 320, 568
    //                                   )];
    //    [_scrlView setContentSize:CGSizeMake(300, 360)];
    ////    [_scrlView setFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)]
    
//    if(textfieldResine==_ContactNoTextfield)
//    {
//        [textfieldResine resignFirstResponder];
//    }
//    
//    if(textfieldResine==_RemarksTextfield)
//    {
//        [textfieldResine resignFirstResponder];
//    }

    
    
    
    
    
    if (textField==_RemarksTextfield)
    {
        
        
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:.5];
        self.view.frame = CGRectMake(0,-262,self.view.bounds.size.width,self.view.bounds.size.height);
        [UIView commitAnimations];
        //    return;
    }
    else if (textField==_DateTextfield)
    {
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:.5];
        self.view.frame = CGRectMake(0,-143,self.view.bounds.size.width,self.view.bounds.size.height);
        [UIView commitAnimations];
        
        
    }
    
    return;
    
}


//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    if (textField==_ReferringTextfield) {
//        pickerView.hidden=NO;
//        datePicker.hidden=YES;
//        timePicker.hidden=YES;
//        return NO;
//    }
//    if (textField==_txtDatebtn) {
//        datePicker.hidden=NO;
//        pickerView.hidden=YES;
//        timePicker.hidden=YES;
//    return NO;
//    }
//    else if (textField==_TimeTextfield){
//        datePicker.hidden=YES;
//        pickerView.hidden=YES;
//        timePicker.hidden=NO;
//        return NO;
//        
//        
//    }
////    datePicker.hidden=YES;
////    pickerView.hidden=YES;
////    timePicker.hidden=YES;
//    return NO;
//}




- (void)viewDidLoad {
    reffer=NO;
    
    _lblHeader.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:10.0f];
    _lblContact.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:10.0f];
    _lblDate.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:10.0f];
    _lblName.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:10.0f];
    _lblReferTo.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:10.0f];
    _lblRemark.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:10.0f];
    _lblTime.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:10.0f];
    _btnApptList.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:11.0f];
    _btnRefaP.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:11.0f];
    _btnSubmit.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:11.0f];
    _btnViewAccount.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:11.0f];
    
    _daysArray = [[NSMutableArray alloc]init];
    _monthsArray = [[NSMutableArray alloc]init];
    _yearArray = [[NSMutableArray alloc]init];
    _listOfDoctors=[[NSMutableArray alloc]init];
    _SPidList = [[NSMutableArray alloc]init];
    
    
    for(int i=0;i<32;i++)
    {
        [self.daysArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for(int i=0;i<13;i++)
    {
        [self.monthsArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for(int i=2010;i<2025;i++)
    {
        [self.yearArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    JsonLoader *jloader=[[JsonLoader alloc]init];
    
    // http://appt.healthwaymedical.com.sg
    
    NSString *strDoctorList = @"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=specialistdr";
   // NSString *strDoctorList = @"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=specialistdr";
    NSLog(@"%@",strDoctorList);
    url = [NSURL URLWithString:strDoctorList];
    NSLog(@"%@",url);
    NSDictionary *dic = [jloader dictioneryFromJson:url];
    NSLog(@"%@",dic);
    NSArray *listArray = [dic valueForKey:@"response"];
    NSLog(@"%@",listArray);
    for ( int i=0; i<[listArray count]; i++)
    {
        [_listOfDoctors addObject:[[listArray objectAtIndex:i]valueForKey:@"sp_name"]];
        NSLog(@"%@",_listOfDoctors);
        [_SPidList addObject:[[listArray objectAtIndex:i]valueForKey:@"sp_id"]];
        
    }
    
    
    self.Pickerview.delegate=self;
    self.Pickerview.dataSource=self;
    
    
    datePicker.hidden=YES;
    pickerView.hidden=YES;
    timePicker.hidden=YES;
    
   
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        
        spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        spinner.frame=CGRectMake((320-50)/2, ([UIScreen mainScreen].bounds.size.height-50)/2, 50, 50);
        [self.view addSubview:spinner];
        
    }
    else
    {
        spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        spinner.frame=CGRectMake((768-50)/2, ([UIScreen mainScreen].bounds.size.height-50)/2, 50, 50);
        [self.view addSubview:spinner];
        
    }

    
    
    
    
    
    [super viewDidLoad];
    referenceTextfieldf=_ReferringTextfield;    // Do any additional setup after loading the view.
    
    [_ReferringTextfield setUserInteractionEnabled:NO];
//    [_DateTextfield setUserInteractionEnabled:NO];
    [_TimeTextfield setUserInteractionEnabled:NO];
    [_DateTextfield setEnabled:NO];
    //[_txtDatebtn setEnabled:NO];
   // [_ReferringTextfield setEnabled:NO];
  //  [_TimeTextfield setEnabled:NO];
    
   MedicalMatesDetails= [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%@",[MedicalMatesDetails valueForKey:@"DeviceToken"]);
        NSString *notifistr = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=AddDeviceToken&device_token=%@&userid=%@&type=iphone",[MedicalMatesDetails valueForKey:@"DeviceToken"],[MedicalMatesDetails valueForKey:@"UserId"]];
//    NSString *notifistr = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=AddDeviceToken&device_token=%@&userid=%@&type=iphone",[MedicalMatesDetails valueForKey:@"DeviceToken"],[MedicalMatesDetails valueForKey:@"UserId"]];
    NSLog(@"%@",notifistr);
    NSURL *urlnoti = [NSURL URLWithString:notifistr];
    NSLog(@"%@",urlnoti);
    
    NSDictionary *Dicnoti = [jloader dictioneryFromJson:urlnoti];
    NSLog(@"%@",Dicnoti);
    NSArray *arrNoti = [Dicnoti valueForKey:@"response"];
    NSLog(@"%@",arrNoti);
    
//    if ([[Dicnoti valueForKey:@"Success"]isEqualToString:@"true"])
//    {
//        UIAlertView *alert = [UIAlertView alloc]initWithTitle:<#(NSString *)#> message:<#(NSString *)#> delegate:<#(id)#> cancelButtonTitle:<#(NSString *)#> otherButtonTitles:<#(NSString *), ...#>, nil
//    }
//    
//    else
//    {
//        <#statements#>
//    }
    
    
    
    
}
//-(void)addPickerview{
//    pickerView = [[UIPickerView alloc]init];
//    pickerView.dataSource = self;
//    pickerView.delegate = self;
//    pickerView.showsSelectionIndicator = YES;
//    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
//                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
//                                   target:self action:@selector(doneClick:)];
//    
//    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-pickerView.frame.size.height-50, 320, 50)];
//    [toolBar setBarStyle:UIBarStyleBlackOpaque];
//    NSArray *toolbarItems = [NSArray arrayWithObjects:
//                             doneButton, nil];
//    [toolBar setItems:toolbarItems];
//    
//    
//    _txtDatebtn.inputView= pickerView;
//    _txtDatebtn.inputAccessoryView = toolBar;
//    _ReferringTextfield.inputView = pickerView;
//    _ReferringTextfield.inputAccessoryView=toolBar;
//    _TimeTextfield.inputView = pickerView;
//    _TimeTextfield.inputAccessoryView=toolBar;
//    
//    referenceTextfieldf.inputView = pickerView;
//    referenceTextfieldf.inputAccessoryView=toolBar;
//}
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

- (IBAction)btnSubmit:(id)sender {
    
    [spinner startAnimating];
    
    if ([self.PatientNameTextfield.text isEqualToString:@""] || [self.ContactNoTextfield.text isEqualToString:@""]|| [self.ReferringTextfield.text isEqualToString:@""] || [self.DateTextfield.text isEqualToString:@""] || [self.TimeTextfield.text isEqualToString:@""] || [self.RemarksTextfield.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Status" message:@"Error: Field cannot be left blank ..."
                                                       delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        return;
        

    }
    
    else
    {
        
        
        JsonLoader *jloader = [[JsonLoader alloc]init];
        
        NSString *strurl = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=makeappointment&userid=%@&user_type=%@&spl_id=%@&app_date=%@&app_time=%@&patient_name=%@&patient_contact=%@&remarks=%@",[MedicalMatesDetails valueForKey:@"UserId"],[MedicalMatesDetails valueForKey:@"UserType"],[MedicalMatesDetails valueForKey:@"sp_id"],_DateTextfield.text,_TimeTextfield.text,_PatientNameTextfield.text,_ContactNoTextfield.text,_RemarksTextfield.text];
        
//        NSString *strurl = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=makeappointment&userid=%@&user_type=%@&spl_id=%@&app_date=%@&app_time=%@&patient_name=%@&patient_contact=%@&remarks=%@",[MedicalMatesDetails valueForKey:@"UserId"],[MedicalMatesDetails valueForKey:@"UserType"],[MedicalMatesDetails valueForKey:@"sp_id"],_DateTextfield.text,_TimeTextfield.text,_PatientNameTextfield.text,_ContactNoTextfield.text,_RemarksTextfield.text];
        NSLog(@"%@",strurl);
        NSString* webStringURL = [strurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:webStringURL];
        NSLog(@"%@",url);
        
        NSDictionary *dic = [jloader dictioneryFromJson:url];
        NSLog(@"%@",dic);
        
        NSArray *arr = [dic valueForKey:@"response"];
        NSLog(@"%@",arr);
       NSString*string = [[arr objectAtIndex:0] valueForKey:@"Message"];
        NSLog(@"%@",string);

        
        if ([[dic valueForKey:@"Success"]isEqualToString:@"true"])
        {
                       UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"STATUS" message:[[arr objectAtIndex:0] valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"STATUS" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
        
        
        [spinner stopAnimating];
        [spinner removeFromSuperview];
        
        
        
        
    }
    
    [spinner stopAnimating];
    [spinner removeFromSuperview];

    
}

- (IBAction)btnBack:(id)sender {
    
    
    logoutalert = [[UIAlertView alloc]initWithTitle:@"Status" message:@"Do you really want to logout" delegate:self cancelButtonTitle:@"Logout" otherButtonTitles:@"CANCEL", nil];
    
    
    [logoutalert show];
    
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(alertView==logoutalert)
    {
        NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
        NSLog(@"%@",title);
        if ([title isEqualToString:@"Logout"])
        {
            
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *View = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
            [self.navigationController pushViewController:View animated:NO];

            
            
        }
        else
        {
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }

    }
}


- (IBAction)btnViewAccount:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewAccountVC *View = [storyboard instantiateViewControllerWithIdentifier:@"ViewAccountVC"];
    [self.navigationController pushViewController:View animated:NO];
}

- (IBAction)btnAppList:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AppointmentListVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentListVC"];
    [self.navigationController pushViewController:View animated:NO];
}

- (IBAction)btnReferaP:(id)sender {
    
    
}

- (IBAction)btnDate:(id)sender {
    
    date=YES;
    [toolBar removeFromSuperview];
    [_PatientNameTextfield resignFirstResponder];
    [_ContactNoTextfield resignFirstResponder];
    [_RemarksTextfield resignFirstResponder];
    self.view.frame = CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
    [UIView commitAnimations];
    
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
    
    
    
    
//    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-pickerview.frame.size.height-50, 320, 50)];
//    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    
//    _Pickerview = [[UIPickerView alloc]init];
//    _Pickerview.dataSource = self;
//    _Pickerview.delegate = self;
//    _Pickerview.showsSelectionIndicator = YES;
    datePicker.hidden=NO;
    datePicker.backgroundColor = [UIColor whiteColor];
    toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-datePicker.frame.size.height,self.view.frame.size.width,50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
   UIBarButtonItem* barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                      style:UIBarButtonItemStyleDone target:self action:@selector(doneClick:)];
    toolBar.items = [[NSArray alloc] initWithObjects:barButtonDone,nil];
    barButtonDone.tintColor=[UIColor blackColor];
    [self.view addSubview:toolBar];
    //(or)pickerView.inputAccessoryView = toolBar;
//    [self.view addSubview:_Pickerview];
    
//    _btnreferingTo.enabled=NO;
//    _btnTimeOutlet.enabled=NO;
    
    pickerView.hidden=YES;
    timePicker.hidden = YES;
    
    
}

- (IBAction)btnTime:(id)sender {
    time=YES;
    [toolBar removeFromSuperview];
    [_PatientNameTextfield resignFirstResponder];
    [_ContactNoTextfield resignFirstResponder];
    [_RemarksTextfield resignFirstResponder];
    self.view.frame = CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
    [UIView commitAnimations];
    
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
    


    
//    datePicker.hidden = YES;
    timePicker.hidden=NO;
    timePicker.backgroundColor = [UIColor whiteColor];
    toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-timePicker.frame.size.height,self.view.frame.size.width,50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                      style:UIBarButtonItemStyleDone target:self action:@selector(doneClick:)];
    toolBar.items = [[NSArray alloc] initWithObjects:barButtonDone,nil];
    barButtonDone.tintColor=[UIColor blackColor];
    [self.view addSubview:toolBar];
    
//    _btnreferingTo.enabled=NO;
//    _btnDateoutlet.enabled=NO;
    pickerView.hidden = YES;
    datePicker.hidden = YES;
    
    
    
}

- (IBAction)btnReferTo:(id)sender {
    reffer=YES;
    [toolBar removeFromSuperview];
    [_PatientNameTextfield resignFirstResponder];
    [_ContactNoTextfield resignFirstResponder];
    [_RemarksTextfield resignFirstResponder];
    self.view.frame = CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
    [UIView commitAnimations];
    
    if (IS_IPAD)
    {
        pickerView.frame = CGRectMake(0, 810, self.view.frame.size.width, 260);

    }
    else if(IS_IPHONE5)
    {
        pickerView.frame = CGRectMake(0, 360, self.view.frame.size.width, 260);

    }
    else
    {
       pickerView.frame = CGRectMake(0, 460, self.view.frame.size.width, 260);
        
    }
    

//    datePicker.hidden=YES;
//    timePicker.hidden=YES;
    pickerView.hidden=NO;
    
    toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-pickerView.frame.size.height,self.view.frame.size.width,50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClick:)];
    toolBar.items = [[NSArray alloc] initWithObjects:barButtonDone,nil];
    barButtonDone.tintColor=[UIColor blackColor];
    [self.view addSubview:toolBar];
    
//    _btnDateoutlet.enabled=NO;
//    _btnTimeOutlet.enabled=NO;
    
    datePicker.hidden=YES;
    timePicker.hidden = YES;
    
    
    
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
//    if (referenceTextfieldf==_ReferringTextfield)
//    {
//        return 1;
//    }
//    else if(referenceTextfieldf==_txtDatebtn)
//    {
//        return 3;
//    }
    
    
   return 1;
    
    
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    
//    if (referenceTextfieldf==_ReferringTextfield)
//    {
//        return [_listOfDoctors count];
//    }
//    else if(referenceTextfieldf==_txtDatebtn)
//    {
//        if (component==0)
//        {
//            return [self.daysArray count];
//        }
//        else if (component==1)
//        {
//            return [self.monthsArray count];
//        }
//        else
    
//            return [_listOfDoctors count];

//    }
//
//    if (reffer==YES)
//    {
////        reffer=NO;
//        return [_listOfDoctors count];
//    }
    
    
    
//    if (component==0)
//    {
//        return [self.daysArray count];
//    }
//    else if (component==1)
//    {
//        return [self.monthsArray count];
//    }
//    else
//        
//        return [self.yearArray count];
    
    return _listOfDoctors.count;

    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
//    if (referenceTextfieldf==_ReferringTextfield)
//    {
//        return [_listOfDoctors objectAtIndex:row];
//    }
//    else if(referenceTextfieldf==_txtDatebtn)
//    {
//        switch (component)
//        {
//            case 0:
//                return [self.daysArray objectAtIndex:row];
//                break;
//            case 1:
//                return [self.monthsArray objectAtIndex:row];
//                break;
//            case 2:
//                return [self.yearArray objectAtIndex:row];
//                break;
//        }
//
//    }
//    
//    if (reffer==YES)
//    {
//        return [_listOfDoctors objectAtIndex:row];
//        
//    }
//    
    
      return [_listOfDoctors objectAtIndex:row];
}






#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
//    _DateTextfield = [[UITextField alloc]init];
    
//    if (reffer==YES)
//    {
        _ReferringTextfield.text = [NSString stringWithFormat:@"%@",[_listOfDoctors objectAtIndex:[pickerView selectedRowInComponent:0]]];
    NSString *strID = [NSString stringWithFormat:@"%@",[_SPidList objectAtIndex:row ]];
    NSLog(@"%@",strID);
    
    [MedicalMatesDetails setObject:strID forKey:@"sp_id"];
    
//    }
//    else if(referenceTextfieldf==_txtDatebtn)
//    {
//        
//    
//    
//    
//    
//    
//    NSString *strDay =[NSString stringWithFormat:@"%@/",[self.daysArray objectAtIndex:[pickerView selectedRowInComponent:0]]];
//    
//    
//    NSString *strMonth=[NSString stringWithFormat:@"%@/",[self.monthsArray objectAtIndex:[pickerView selectedRowInComponent:1]]];
//    
//    NSString *strYear=[NSString stringWithFormat:@"%@",[self.yearArray objectAtIndex:[pickerView selectedRowInComponent:2]]];
//    
////    _DateTextfield.text=[NSString stringWithFormat:@"%@",[self.daysArray objectAtIndex:[pickerView selectedRowInComponent:0]]];
////    
////    
////    _DateTextfield.text=[NSString stringWithFormat:@"%@",[self.monthsArray objectAtIndex:[pickerView selectedRowInComponent:1]]];
////    
////    _DateTextfield.text=[NSString stringWithFormat:@"%@",[self.yearArray objectAtIndex:[pickerView selectedRowInComponent:2]]];
////    
//
//    NSString *str = [strDay stringByAppendingString:strMonth];
//    NSString *str1 = [str stringByAppendingString:strYear];
//    NSLog(@"%@",str1);
//    
//    _DateTextfield.text =str1;
//    
//}
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
        
        
        _DateTextfield.text =mydate;
        toolBar.hidden =YES;
//        [datePicker removeFromSuperview];
        datePicker.hidden=YES;
        pickerView.hidden=YES;
        timePicker.hidden=YES;
        _btnreferingTo.enabled=YES;
        _btnTimeOutlet.enabled=YES;
        
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
        
        _TimeTextfield.text=mydate;
        
        toolBar.hidden =YES;
//        [timePicker removeFromSuperview];
        timePicker.hidden=YES;
        datePicker.hidden = YES;
        pickerView.hidden = YES;
        
        _btnreferingTo.enabled=YES;
        _btnDateoutlet.enabled=YES;


    }
    
    else if (reffer==YES)
    {
        reffer=NO;
        toolBar.hidden=YES;
        pickerView.hidden=YES;
        datePicker.hidden = YES;
        timePicker.hidden = YES;
        
        _btnDateoutlet.enabled=YES;
        _btnTimeOutlet.enabled=YES;

        
    }
    
    
    
   
   

   
    
    toolBar.hidden =YES;
    [toolBar removeFromSuperview];
//    [datePicker removeFromSuperview];
//    [timePicker removeFromSuperview];
//    [pickerView removeFromSuperview];
   
}







@end
