//
//  AppointmentStatusVC.m
//  MedicalMates
//
//  Created by User on 12/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "AppointmentStatusVC.h"
#import "Global.h"
#import "ReferApatientVC.h"
#import "ViewAccountVC.h"
#import "JsonLoader.h"
#import "AppointmentListVC.h"
#define IS_IPAD (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad && [UIScreen mainScreen].bounds.size.height==1024)

#define IS_IPHONE5 (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height==568)

@interface AppointmentStatusVC ()

@end

@implementation AppointmentStatusVC

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {
        
        [_DiagonisisTextView resignFirstResponder];
        // Return FALSE so that the final '\n' character doesn't get added
        return NO;
    }
    // For any other character return TRUE so that the text gets added to the view
    return YES;
}




- (void)viewDidLoad {
    MedicalMatesDetails = [NSUserDefaults standardUserDefaults];
    JsonLoader *jloader = [[JsonLoader alloc]init];
    _DiagonisisTextView.delegate =self;
    
    if ([[MedicalMatesDetails valueForKey:@"UserType"]isEqualToString:@"SP"])
    {
        [_DiagonisisTextView setUserInteractionEnabled:YES];
        _textfieldStatus.userInteractionEnabled = YES;
        _btnSave.enabled = YES;
    } else
    {
        [_DiagonisisTextView setUserInteractionEnabled:NO];
        _textfieldStatus.userInteractionEnabled = NO;
        _btnSave.enabled=NO;
    }
    
    statusArr = [[NSMutableArray alloc]init];
    [statusArr addObject:@"Complete"];[statusArr addObject:@"Accepted"];[statusArr addObject:@"Pending"];
    
    
    // http://appt.healthwaymedical.com.sg
    // http://gstcloud.com/developer/medical-mates
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *strurl = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=getapptdetails&appid=%@",[MedicalMatesDetails valueForKey:@"app_id"]];
    NSLog(@"%@",strurl);
    NSURL *url = [[NSURL alloc] initWithString:[strurl stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSLog(@"%@",url);
    NSDictionary *dic = [jloader dictioneryFromJson:url];
    NSLog(@"%@",dic);
    NSArray *arr = [dic valueForKey:@"response"];
    NSLog(@"%@",arr);
    
    if ([[dic valueForKey:@"Success"]isEqualToString:@"true"])
    {
        _lblName.text=[[arr objectAtIndex:0] valueForKey:@"patient_full_name"];
        _DiagonisisTextView.text = [[arr objectAtIndex:0] valueForKey:@"diagnosis"];
        [MedicalMatesDetails setObject:[[arr objectAtIndex:0] valueForKey:@"referring_by_id"] forKey:@"refferBy"];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    
    [self addPickerview];
    
    
    
}

-(void)addPickerview{
    pickerview = [[UIPickerView alloc]init];
    pickerview.dataSource = self;
    pickerview.delegate = self;
    pickerview.showsSelectionIndicator = YES;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleDone
                                   target:self action:@selector(doneClick:)];
    
    if (IS_IPAD)
    {
        pickerview.frame = CGRectMake(0, 810, self.view.frame.size.width, 260);
    }
    else if (IS_IPHONE5)
    {
        pickerview.frame = CGRectMake(0, 360, self.view.frame.size.width, 260);
    }
    else
    {
       pickerview.frame = CGRectMake(0, 460, self.view.frame.size.width, 260);
        
    }
    
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-pickerview.frame.size.height, self.view.frame.size.width, 50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             doneButton, nil];
    [toolBar setItems:toolbarItems];
    
    
    _textfieldStatus.inputView= pickerview;
    _textfieldStatus.inputAccessoryView = toolBar;
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
- (IBAction)btnPatientSeen:(id)sender {
    
    MedicalMatesDetails = [NSUserDefaults standardUserDefaults];
    JsonLoader *jloader = [[JsonLoader alloc]init];
    
    NSString *strSeen = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=changeapptstatus&appid=%@&userid=%@&status=%@&diagnosis=%@",[MedicalMatesDetails valueForKey:@"app_id"],[MedicalMatesDetails  valueForKey:@"refferBy"],str,_DiagonisisTextView.text];
    NSLog(@"%@",strSeen);
    NSURL *urlSeen = [[NSURL alloc] initWithString:[strSeen stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSLog(@"%@",urlSeen);
    NSDictionary *dicSeen = [jloader dictioneryFromJson:urlSeen];
    NSLog(@"%@",dicSeen);
    NSArray *arrSeen = [dicSeen valueForKey:@"response"];
    NSLog(@"%@",arrSeen);
    if ([[dicSeen valueForKey:@"Success"]isEqualToString:@"true"])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arrSeen objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AppointmentListVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentListVC"];
        [self.navigationController pushViewController:View animated:NO];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arrSeen objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    
    
    [self.navigationController popViewControllerAnimated:NO];
    
    
    
    
    
    
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return statusArr.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [statusArr objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    _textfieldStatus.text = [NSString stringWithFormat:@"%@",[statusArr objectAtIndex:[pickerView selectedRowInComponent:0]]];
    
    if ([_textfieldStatus.text isEqual: @"Complete"])
    {
        str = @"C";
    }
    if ([_textfieldStatus.text isEqual: @"Accepted"]) {
         str = @"A";
    }
    if ([_textfieldStatus.text isEqual: @"Pending"]) {
          str = @"P";
    }
    
    
}


-(IBAction)doneClick:(id)sender{
    
    [_textfieldStatus becomeFirstResponder];
    [_textfieldStatus resignFirstResponder];
    
    
    
}




@end
