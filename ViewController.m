//
//  ViewController.m
//  MedicalMates
//
//  Created by User on 03/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "ViewController.h"
#import "ReferApatientVC.h"
#import "JsonLoader.h"
#import "Global.h"
#import "AppDelegate.h"
#import "AppointmentConformationVC.h"
#import "AppointmentListVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:.5];
    self.view.frame = CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
    [UIView commitAnimations];
    
    [textField resignFirstResponder];
    return YES;

}

#pragma mark - Text field delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    //    [_scrlView setFrame:CGRectMake(0, 0, 320, 568
    //                                   )];
    //    [_scrlView setContentSize:CGSizeMake(300, 360)];
    ////    [_scrlView setFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)]
    if (textField==_Passwordtextfield)
    {
        
        
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:.5];
        self.view.frame = CGRectMake(0,-162,self.view.bounds.size.width,self.view.bounds.size.height);
        [UIView commitAnimations];
        //    return;
    }
    else if (textField==_IDtextfield)
    {
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationDuration:.5];
        self.view.frame = CGRectMake(0,-143,self.view.bounds.size.width,self.view.bounds.size.height);
        [UIView commitAnimations];
        
        
    }
    
    return;
    
}








-(void)viewWillAppear:(BOOL)animated{
    
    _IDtextfield.text=@"";
    _Passwordtextfield.text=@"";

    
}
    

- (void)appDidBecomeActive:(NSNotification *)notification {
    NSLog(@"did become active notification");
}

- (void)appDidEnterForeground:(NSNotification *)notification {
    NSLog(@"did enter foreground notification");
}


//-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
//{
//    //When notification is pressed on background it will enter here
//    
//    
//    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    ReferApatientVC *View = [storyboard instantiateViewControllerWithIdentifier:@"ReferApatientVC"];
//    [self.navigationController pushViewController:View animated:NO];
//    
//    
//    
//    //Get strings based on information on your json payload for example
//    if([[userInfo objectForKey:@"keyword"] isEqualToString:@"value"])
//    {
//        //redirect/push a screen here for example
//    }
//}


- (void) receiveTestNotification:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    NSLog(@"%@",notification);
    
    if ([[notification name] isEqualToString:@"TestNotification"])
        NSLog (@"Successfully received the test notification!");
    if ([[MedicalMatesDetails valueForKey:@"UserType"]isEqualToString:@"SP"])
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AppointmentConformationVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentConformationVC"];
        [self.navigationController pushViewController:View animated:NO];
    }
    else
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AppointmentListVC *View = [storyboard instantiateViewControllerWithIdentifier:@"AppointmentListVC"];
        [self.navigationController pushViewController:View animated:NO];
        
        
        
    }
    
   
    
    
}





- (void)viewDidLoad {
    
    adminlogin=YES;
    
     [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"TestNotification"
                                               object:nil];
    
    
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    // Do any additional setup after loading the view, typically from a nib.
    
    _lblID.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:15.0f];
    _lblPassword.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:15.0f];
    _lblHeader.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:16.0f];
    _lblAdminLogin.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:15.0f];
    
    _btnLogin.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:20.0f];
    
    
    _lblAdminLogin.hidden=YES;
    _AdminLoginImgvew.hidden=YES;
    _btnloginWithAdmin.hidden = YES;
    
    MedicalMatesDetails=  [NSUserDefaults standardUserDefaults];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    
    
    CGRect frame = CGRectMake (143, 248, 80, 80);

    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:frame];
    
    [self.view addSubview:self.activityIndicatorView];
    
    
    
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

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)postData:(id)sender
{
    vw=[[UIView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-100)/2, ([UIScreen mainScreen].bounds.size.height-100)/2, 100.0f, 100.0f)];
    vw.backgroundColor=[UIColor grayColor];
    vw.layer.cornerRadius=50;
    vw.layer.masksToBounds=YES;
    [self.view addSubview:vw];
    spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2, ([UIScreen mainScreen].bounds.size.height-32)/2, 32.0f, 32.0f);
    
    [self.view addSubview:spinner];
    
    [spinner startAnimating];
    [self performSelector:@selector(btnLogin:) withObject:nil afterDelay:1];


}




- (IBAction)btnLogin:(id)sender {
    JsonLoader*jloader = [[JsonLoader alloc]init];
  
    
//    UIActivityIndicatorView *spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//     spinner.frame=CGRectMake((320-50)/2, ([UIScreen mainScreen].bounds.size.height-50)/2, 50, 50);
////     spinner.frame=CGRectMake(88, 293, 30, 30);
////    spinner.backgroundColor = [UIColor blackColor];
////     spinner.hidesWhenStopped = YES;
//    [self.view addSubview:spinner];
//    [spinner startAnimating];
    
    
    [spinner startAnimating];
    
    
    
    
    if ([self.IDtextfield.text isEqualToString:@""] || [self.Passwordtextfield.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Status" message:@"Error: Please put a valid email address or password..."delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        return;
        
    }
    
    actview=[[UIView alloc ]initWithFrame:CGRectMake(143, 248, 90, 90)];
    actview.backgroundColor=[UIColor grayColor];
    actview.layer.cornerRadius=10;
    activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.alpha=1.0;
    activityView.frame=CGRectMake(25, 25, activityView.frame.size.width,activityView.frame.size.height);
    //activityView.center=self.view.center;
    [activityView startAnimating];
    [actview addSubview:activityView];
    [self.view addSubview:actview];
    
    
    [self.activityIndicatorView startAnimating];
    
   // http://appt.healthwaymedical.com.sg
    
    
    
    
    NSLog(@"%@",[MedicalMatesDetails valueForKey:@"admin"]);
    
    if ([[MedicalMatesDetails valueForKey:@"admin"]isEqualToString:@"adminlogin"])
    {
        [MedicalMatesDetails removeObjectForKey:@"admin"];
        
        NSString *strurl = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=adminlogin&username=%@&password=%@",_IDtextfield.text,_Passwordtextfield.text];
        // NSString *strurl = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=adminlogin&username=%@&password=%@",_IDtextfield.text,_Passwordtextfield.text];
        NSLog(@"%@",strurl);
        NSURL *url = [[NSURL alloc] initWithString:[strurl stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        NSLog(@"%@",url);
        NSDictionary *dic = [jloader dictioneryFromJson:url];
        NSLog(@"%@",dic);
        
        NSArray *arr = [dic valueForKey:@"response"];
        NSLog(@"%@",arr);
        
        if ([[[arr objectAtIndex:0] valueForKey:@"Success"]isEqualToString:@"false"])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0] valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else if([[[arr objectAtIndex:0]valueForKey:@"Success"]isEqualToString:@"true"])
        {
            
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ReferApatientVC *View = [storyboard instantiateViewControllerWithIdentifier:@"ReferApatientVC"];
            
           [MedicalMatesDetails setObject:[[arr objectAtIndex:0]valueForKey:@"AdminId"] forKey:@"UserId"];
          // [MedicalMatesDetails setObject:[[arr objectAtIndex:0]valueForKey:@"UserImg"] forKey:@"UserImg"];
           [MedicalMatesDetails setObject:[[arr objectAtIndex:0]valueForKey:@"AdminName"] forKey:@"AdminName"];
          // [MedicalMatesDetails setObject:[[arr objectAtIndex:0]valueForKey:@"UserType"] forKey:@"UserType"];
            
            [self.navigationController pushViewController:View animated:NO];
        }

//        [activityView stopAnimating];
//        [activityView setHidden:YES];
//        [actview setHidden:YES];
        
        
    }
    else
    {
        NSString *strurl = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=login&username=%@&password=%@",_IDtextfield.text,_Passwordtextfield.text];
      //  NSString *strurl = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=login&username=%@&password=%@",_IDtextfield.text,_Passwordtextfield.text];
        
        strurl=[strurl stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"%@",strurl);
//        NSURL *url = [NSURL URLWithString:strurl];
        NSURL *url =  [[NSURL alloc] initWithString:[strurl stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        NSLog(@"%@",url);
        NSDictionary *dic = [jloader dictioneryFromJson:url];
        NSLog(@"%@",dic);
        
        NSArray *arr = [dic valueForKey:@"response"];
        NSLog(@"%@",arr);
       
        
        if ([[[arr objectAtIndex:0] valueForKey:@"Success"]isEqualToString:@"false"])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0] valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else if([[[arr objectAtIndex:0]valueForKey:@"Success"]isEqualToString:@"true"])
        {
            
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ReferApatientVC *View = [storyboard instantiateViewControllerWithIdentifier:@"ReferApatientVC"];
           
            
            [MedicalMatesDetails setObject:[[arr objectAtIndex:0]valueForKey:@"UserId"] forKey:@"UserId"];
           NSLog(@"%@",[MedicalMatesDetails valueForKey:@"UserId"]) ;
            [MedicalMatesDetails setObject:[[arr objectAtIndex:0]valueForKey:@"UserImg"] forKey:@"UserImg"];
            [MedicalMatesDetails setObject:[[arr objectAtIndex:0]valueForKey:@"UserName"] forKey:@"UserName"];
            [MedicalMatesDetails setObject:[[arr objectAtIndex:0]valueForKey:@"UserType"] forKey:@"UserType"];
            
            [self.navigationController pushViewController:View animated:NO];
        }
        
        
        
        
        
        [spinner removeFromSuperview];
        [vw removeFromSuperview];
        vw=nil;
//        [activityView stopAnimating];
//        [activityView setHidden:YES];
//        [actview setHidden:YES];

    }
    
    
    [MedicalMatesDetails setObject:self.IDtextfield.text forKey:@"userloginiID"];
    
    
   [activityView stopAnimating];
    [activityView setHidden:YES];
    [actview setHidden:YES];

    [spinner removeFromSuperview];
    [vw removeFromSuperview];
    vw=nil;

    
    
    
}
- (IBAction)btnAdminLogin:(id)sender {
    
    if (adminlogin ==YES)
    {
        [_AdminLoginImgvew setImage:[UIImage imageNamed:@"check_radio.png"]];
        [MedicalMatesDetails setObject:@"adminlogin" forKey:@"admin"];
        
        
        adminlogin=NO;
    }
    
    else if(adminlogin==NO)
    {
        [_AdminLoginImgvew setImage:[UIImage imageNamed:@"uncheck_radio.png"]];
        
        [MedicalMatesDetails removeObjectForKey:@"admin"];
        
        adminlogin=YES;
    }
    
    
    
}
@end
