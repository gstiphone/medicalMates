//
//  ViewController.h
//  MedicalMates
//
//  Created by User on 03/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    BOOL adminlogin;
    
    UIActivityIndicatorView *activityView;
    UIView *actview;
    
    UIActivityIndicatorView *spinner;
    UIView *vw;

}

- (IBAction)btnLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *IDtextfield;
@property (weak, nonatomic) IBOutlet UITextField *Passwordtextfield;
@property (weak, nonatomic) IBOutlet UILabel *lblID;
@property (weak, nonatomic) IBOutlet UILabel *lblPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UILabel *lblHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblAdminLogin;
- (IBAction)btnAdminLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *AdminLoginImgvew;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@property (weak, nonatomic) IBOutlet UILabel *lblloginAdminshow;
@property (weak, nonatomic) IBOutlet UIButton *btnloginWithAdmin;

@end

