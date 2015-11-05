 //
//  ViewAccountVC.m
//  MedicalMates
//
//  Created by User on 05/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "ViewAccountVC.h"
#import "AppointmentListVC.h"
#import "ReferApatientVC.h"
#import "Global.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "JsonLoader.h"
#define IS_IPAD (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad && [UIScreen mainScreen].bounds.size.height==1024)

#define IS_IPHONE5 (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone && [UIScreen mainScreen].bounds.size.height==568)


@interface ViewAccountVC ()

@end

@implementation ViewAccountVC

- (void)viewDidLoad {
    
    
    _lblID.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:14.0f];
    _lblChangePwd.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:14.0f];
    _lblRewardPoint.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:14.0f];
    _lblHeader.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:16.0f];
    _lblTotalNoOfAppointsments.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:10.0f];
    _lblPointsAwarded.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:10.0f];
    
    _btnReferaP.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:11.0f];
    _btnAppList.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:11.0f];
    _btnViewAccount.titleLabel.font = [UIFont fontWithName:@"HelveticaNeueLTPro-Blk" size:11.0f];
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _monthArray = [[NSMutableArray alloc]init];
    _yearArray = [[NSMutableArray alloc]init];
    _monthcount = [[NSMutableArray alloc]init];
    
    
    for(int i=2010;i<2025;i++)
    {
        [self.yearArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    [_monthArray addObject:@"January"];[_monthArray addObject:@"February"];[_monthArray addObject:@"March"];[_monthArray addObject:@"April"];
    [_monthArray addObject:@"May"];[_monthArray addObject:@"June"];[_monthArray addObject:@"July"];[_monthArray addObject:@"August"];
    [_monthArray addObject:@"September"];[_monthArray addObject:@"October"];[_monthArray addObject:@"November"];[_monthArray addObject:@"December"];
    
    
    for (int i=1; i<13; i++)
    {
        [self .monthcount addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    
    _pickerview.hidden=YES;
    
    
    
    _PasswordView.hidden=YES;
    _RewardPointsView.hidden=YES;
    
     months = YES;
   // http://appt.healthwaymedical.com.sg
    
    MedicalMatesDetails = [NSUserDefaults standardUserDefaults];
    JsonLoader *jloader = [[JsonLoader alloc]init];
    
    NSString *strtotal = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=getall_rewardpt&userid=%@&month_id=&year_id=",[MedicalMatesDetails valueForKey:@"UserId"]];
    
        //NSString *strtotal = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=getall_rewardpt&userid=%@&month_id=&year_id=",[MedicalMatesDetails valueForKey:@"UserId"]];
    
    NSLog(@"%@",strtotal);
    NSURL *url = [[NSURL alloc] initWithString:[strtotal stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSLog(@"%@",url);
    NSDictionary *dicTotal= [jloader dictioneryFromJson:url];
    NSLog(@"%@",dicTotal);
    NSArray *arr = [dicTotal valueForKey:@"response"];
    NSLog(@"%@",arr);
//    NSArray *arrNext = [arr objectAtIndex:0];
//    NSLog(@"%@",arrNext);
    
    NSString *ttt= [[arr objectAtIndex:0] valueForKey:@"no_of_appt"];
    NSLog(@"%@",ttt);
    
    NSString *ddd =[[arr objectAtIndex:0] valueForKey:@"no_of_point"];
    NSLog(@"%@",ddd);
    
    
    if ([[dicTotal valueForKey:@"Success"]isEqualToString:@"true"])
    {
        _lblTotalAppointment.text =      [NSString stringWithFormat:@"%@", [[arr objectAtIndex:0] valueForKey:@"no_of_appt"]];
        _lblTotalPointsAwarded.text =      [NSString stringWithFormat:@"%@", [[arr objectAtIndex:0] valueForKey:@"no_of_point"]];

    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];

    }
    
    
    
   // _lblIDshow.text = [MedicalMatesDetails valueForKey:@"UserId"];
    _lblIDshow.text = [MedicalMatesDetails valueForKey:@"userloginiID"];
    
    
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

- (IBAction)btnReferaP:(id)sender {
    
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
}
- (IBAction)btnChangePassword:(id)sender {
    
    if (change==NO)
    {
        change = YES;
        _changePasswordsignImageview.image = [UIImage imageNamed:@"minus@sixp.png"];
        _PasswordView.hidden=NO;
    }
    else if(change==YES)
    {
        change=NO;
        _changePasswordsignImageview.image = [UIImage imageNamed:@"plus@sixp.png"];
        _PasswordView.hidden = YES;
        
        
        
    }
    
    
    
    
}
- (IBAction)btnRewadPoints:(id)sender {
    
    if (reward==NO)
    {
        reward=YES;
        _RewadrPointImageview.image = [UIImage imageNamed:@"minus@sixp.png"];
        _RewardPointsView.hidden=NO;
        
    }
    else if(reward==YES)
    {
        reward=NO;
        _RewadrPointImageview.image = [UIImage imageNamed:@"plus@sixp.png"];
        _RewardPointsView.hidden = YES;
    }
    
    
    
    
    
    
}
- (IBAction)btnUploadPicture:(id)sender {
    
    options_ActionSheet=[[UIActionSheet alloc]
                         initWithTitle:nil
                         delegate:self
                         cancelButtonTitle:@"Cancel"
                         destructiveButtonTitle:nil
                         otherButtonTitles:@"Take Photo",@"Choose Existing", nil];
    options_ActionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    [options_ActionSheet showInView:[UIApplication sharedApplication].keyWindow];
    //[options_ActionSheet showFromRect:btnShare.frame inView:self.view animated:YES];

    
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(actionSheet==options_ActionSheet)
    {
        if(buttonIndex==1)
        {
            //For Select Phone Library Images
            if([UIImagePickerController isSourceTypeAvailable:
                UIImagePickerControllerSourceTypePhotoLibrary])
            {
                
                UIImagePickerController *picker= [[UIImagePickerController alloc]init];
                // [picker setAllowsEditing:YES];
                picker.delegate = self;
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:picker animated:YES completion:^{
                }];
            }
        }
        else if(buttonIndex==0)
        {
            //For select Camera Images
            if([UIImagePickerController isSourceTypeAvailable:
                UIImagePickerControllerSourceTypeCamera])
            {
                UIImagePickerController *picker= [[UIImagePickerController alloc]init];
                picker.delegate = self;
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                // picker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                [self presentViewController:picker animated:YES completion:^{
                }];
            }
        }
    }
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
    image=[self scaleAndRotateImage:image];
    //Pass the image to next viewcontroller
    //self.userImageView=[[UIImageView alloc]init];
    // [self performSelector:@selector(saveProfileImageMethod:) withObject:image afterDelay:0];
    // [self.userImageView setImage:image];
    [self performSelector:@selector(saveProfileImageMethod:) withObject:image afterDelay:0];
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)saveProfileImageMethod:(UIImage *)image {
    MedicalMatesDetails = [NSUserDefaults standardUserDefaults];
    
    UIImage *imagePost=image;
    imagePost=[self scaleAndRotateImage:imagePost];
    UIImage *small = [UIImage imageWithCGImage:imagePost.CGImage scale:0.25 orientation:imagePost.imageOrientation];
    small=[self scaleAndRotateImage:small];
    
    NSData  *imageData = UIImagePNGRepresentation(small);
    
    self.UploadPictureImageview.image=[UIImage imageWithData:imageData];
    
    //    NSString *serverUrl = @"http://192.168.1.101/learn/yii_test/index.php/api/uploadimage";
    //    ASIFormDataRequest *request1 = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:serverUrl]];
    //    [request1 setData:UIImagePNGRepresentation(small) withFileName:@"avatar.png" andContentType:@"image/png"  forKey:@"image"];
    //    [request1 setRequestMethod:@"POST"];
    //
    //    request1.delegate = self;
    //    [request1 startAsynchronous]; http://appt.healthwaymedical.com.sg
    
    NSLog(@"%@",[MedicalMatesDetails valueForKey:@"UserId"]);
    NSString *strid = [MedicalMatesDetails valueForKey:@"UserId"];
    //http://appt.healthwaymedical.com.sg/webservices/img_upload.php?tag=uploadimg&userid=11&user_image=
    
    //NSData *imageData =UIImageJPEGRepresentation(imageView.image, 90);
   NSString *urlString= @"http://gstcloud.com/developer/medical-mates/webservices/img_upload.php";
//         NSString *urlString= @"http://appt.healthwaymedical.com.sg/webservices/img_upload.php?tag=uploadimg";
   // NSString *urlString = @"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=uploadimg";
    NSMutableURLRequest *request =[[NSMutableURLRequest alloc]init];
    
    //  urlString = [NSString stringWithFormat:@"%@user=%@",urlString,[userData stringForKey:@"userID"]];
    
    //    urlString=[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@" ,boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    NSMutableData *body= [NSMutableData data];
    
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
//    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userid\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[strid dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n" , boundary]dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [body appendData:[@"Content-Disposition: form-data; name=\"image_content\"; filename=\"image.jpg\"\r\n"dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [request setHTTPBody:body];

    
//    "Content-Disposition: form-data; name=\"image_content\";filename=\"" + exsistingFileName +"\""
    
    
//    [body appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    //  [body appendData:[@"Content-Type:application/octet-stream\r\n\r\n"dataUsingEncoding:NSUTF8StringEncoding]];
//    [ body appendData:[[NSString stringWithFormat:@"%@",[MedicalMatesDetails valueForKey:@"UserId"]] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding :NSUTF8StringEncoding]] ;
//    
//    //   [body appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    //    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",@"user_id"] dataUsingEncoding:NSUTF8StringEncoding]];
//    //    [body appendData:[[NSString stringWithFormat:@"%@",[userData stringForKey:@"userID"]] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n" , boundary]dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"Content-Disposition: form-data; name=\"userfile\";filename=\".jpg\"\r\n"
//                      dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[NSString stringWithFormat:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    //  [body appendData:[@"Content-Type:application/octet-stream\r\n\r\n"dataUsingEncoding:NSUTF8StringEncoding]];
//    [ body appendData:[NSData dataWithData:imageData]];
//    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding :NSUTF8StringEncoding]] ;
    
    [request setHTTPBody:body];
    
    
    
//    NSData *imageData2= UIImageJPEGRepresentation(small, 1.0);
//    NSString *encodedString = [imageData2 base64Encoding];
//    NSString *strUrlPrimary=[NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/img_upload.php?"];
//    
//    
//    NSString *strdata=[NSString stringWithFormat:@"tag=uploadimg&userid=%@&user_image=",strid];
//    NSData *data2=[strdata dataUsingEncoding:NSUTF8StringEncoding];
//    NSMutableData *body2= [[NSMutableData alloc]init];
//    [body2 appendData:data2];
//    [body2 appendData:imageData];
//    NSMutableURLRequest *request2 =[[NSMutableURLRequest alloc]init];
//    [request2 setURL:[NSURL URLWithString:strUrlPrimary]];
//    [request2 setHTTPMethod:@"POST"];
//    [request2 setHTTPBody:body2];
//    NSURLConnection * conn = [[NSURLConnection alloc] initWithRequest:request2 delegate:self];
//    
//    [conn start];
    
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSLog( @">>>%@",returnData);
    
    //NSData *returnData =[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    returnString =[[NSString alloc]initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",returnString);
   NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"Data ---- %@", dic);
    
    NSArray *arr = [dic valueForKey:@"response"];
    NSLog(@"%@",arr);
    NSString *imgstr = [[arr objectAtIndex:0] valueForKey:@"profile_image"];
    NSLog(@"%@",imgstr);
    
    
    
    [MedicalMatesDetails setObject:returnString forKey:@"returnStr"];
    
    [self fetchUserDetail];
    
}








- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"Data ---- %@", dic);

    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Failed");
}






-(void)fetchUserDetail
{
    JsonLoader *jloader = [[JsonLoader alloc]init];
    MedicalMatesDetails  = [NSUserDefaults standardUserDefaults];
    
    UIActivityIndicatorView *spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.frame=CGRectMake((320-50)/2, ([UIScreen mainScreen].bounds.size.height-50)/2, 50, 50);
    [self.view addSubview:spinner];
    [spinner startAnimating];
//    HomeAppDelegate *app=(HomeAppDelegate *)[[UIApplication sharedApplication]delegate];
//    NSLog(@"app id %@",app.categoryID);
    NSString *urlStr=[NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=up_splpic&userid=%@&user_image=%@",[MedicalMatesDetails valueForKey:@"UserId"],[MedicalMatesDetails valueForKey:@"returnStr"]];
  //  NSString *urlStr=[NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=up_splpic&userid=%@&user_image=%@",[MedicalMatesDetails valueForKey:@"UserId"],[MedicalMatesDetails valueForKey:@"returnStr"]];
    NSLog(@"%@",urlStr);
    NSURL *url=[NSURL URLWithString:urlStr];
    NSLog(@"%@",url);
    NSDictionary *dicImage = [jloader dictioneryFromJson:url];
    NSLog(@"%@",dicImage);
    NSArray *arrImg = [dicImage valueForKey:@"response"];
    NSLog(@"%@",arrImg);
    
    
    if ([[dicImage valueForKey:@"Success"]isEqualToString:@"true"])
    {
        NSURL *imgurl = [NSURL URLWithString:[[arrImg objectAtIndex:0]valueForKey:@"profile_image"]];
        NSURLRequest* request = [NSURLRequest requestWithURL:imgurl];
        NSData *imagedata = [[NSData alloc]initWithContentsOfURL:imgurl];
        UIImage *img = [[UIImage alloc]initWithData:imagedata];
        
        _UploadPictureImageview.image=img;
        
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sttus" message:[arrImg valueForKey:@"Message"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    
    [spinner stopAnimating];
    
}




- (IBAction)btnSubmitPassword:(id)sender {
    JsonLoader *jloader = [[JsonLoader alloc]init];
    
    if ([_OldPasswordTextField.text isEqual:@""] || [_NewPassTextfield.text isEqualToString:@""] || [_ConPassTextfield.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:@"Text field cannot be blank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
    
    if (![_NewPassTextfield.text isEqualToString:_ConPassTextfield.text])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:@"Password missmatch" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];

    }
    
  //  http://appt.healthwaymedical.com.sg
    
    
    NSLog(@"%@",[MedicalMatesDetails valueForKey:@"admin"]);
    
    if ([[MedicalMatesDetails valueForKey:@"admin"]isEqualToString:@"adminlogin"])
    {
         NSString *strChange = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=resetpwd_admin&userid=%@&oldpwd=%@&newpwd=%@",[MedicalMatesDetails valueForKey:@"UserId"],_OldPasswordTextField.text,_NewPassTextfield.text];
        
      //  NSString *strChange = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=resetpwd_admin&userid=%@&oldpwd=%@&newpwd=%@",[MedicalMatesDetails valueForKey:@"UserId"],_OldPasswordTextField.text,_NewPassTextfield.text];
        NSLog(@"%@",strChange);
        NSURL *urlChange = [[NSURL alloc] initWithString:[strChange stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        NSLog(@"%@",urlChange);
        NSDictionary *dicChange = [jloader dictioneryFromJson:urlChange];
        NSLog(@"%@",dicChange);
        NSArray *arr = [dicChange valueForKey:@"response"];
        NSLog(@"%@",arr);
        if ([[dicChange valueForKey:@"Success"]isEqualToString:@"true"])
        {
            UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
        else
        {
            UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
    }
    else
    {
        NSString *strChange = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=resetpwd&userid=%@&oldpwd=%@&newpwd=%@",[MedicalMatesDetails valueForKey:@"UserId"],_OldPasswordTextField.text,_NewPassTextfield.text];

        
      //  NSString *strChange = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=resetpwd&userid=%@&oldpwd=%@&newpwd=%@",[MedicalMatesDetails valueForKey:@"UserId"],_OldPasswordTextField.text,_NewPassTextfield.text];
        NSLog(@"%@",strChange);
        NSURL *urlChange = [[NSURL alloc] initWithString:[strChange stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        NSLog(@"%@",urlChange);
        NSDictionary *dicChange = [jloader dictioneryFromJson:urlChange];
        NSLog(@"%@",dicChange);
        NSArray *arr = [dicChange valueForKey:@"response"];
        NSLog(@"%@",arr);
        if ([[dicChange valueForKey:@"Success"]isEqualToString:@"true"])
        {
            UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
        else
        {
            UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arr objectAtIndex:0]valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }

        
    }
    
    
    
}



-(IBAction)doneClick:(id)sender{
    
    if (months==YES)
    {
        months=NO;
        _pickerview.hidden = YES;
        toolBar.hidden=YES;
        JsonLoader *jloader = [[JsonLoader alloc]init];
        
        NSString *strmonth = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=getall_rewardpt&userid=%@&month_id=%@&year_id=",[MedicalMatesDetails valueForKey:@"UserId"],[MedicalMatesDetails valueForKey:@"monthcount"]];
        
//        NSString *strmonth = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=getall_rewardpt&userid=%@&month_id=%@&year_id=",[MedicalMatesDetails valueForKey:@"UserId"],[MedicalMatesDetails valueForKey:@"monthcount"]];
        NSLog(@"%@",strmonth);
        NSURL *urlmonth = [[NSURL alloc] initWithString:[strmonth stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        NSLog(@"%@",urlmonth);
        NSDictionary *dicMonth  = [jloader dictioneryFromJson:urlmonth];
        NSLog(@"%@",dicMonth);
        NSArray *arrMonth = [dicMonth valueForKey:@"response"];
        NSLog(@"%@",arrMonth);
//        NSArray *arrNext = [arrMonth objectAtIndex:0];
//        NSLog(@"%@",arrNext);
        
        if ([[dicMonth valueForKey:@"Success"]isEqualToString:@"true"])
        {
            _lblShowMonthPoint.text = [NSString stringWithFormat:@"%@",[[arrMonth objectAtIndex:0] valueForKey:@"no_of_point"]];
            _secondTotalMonthAppo.text = [NSString stringWithFormat:@"%@",[[arrMonth objectAtIndex:0] valueForKey:@"no_of_appt"]];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arrMonth objectAtIndex:0] valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }
        
        
        
        
        
    }
    else if(years==YES)
    {
        years=NO;
        _pickerview.hidden = YES;
        toolBar.hidden=YES;
        
        
        JsonLoader *jloader = [[JsonLoader alloc]init];
        
         NSString *strYear = [NSString stringWithFormat:@"http://gstcloud.com/developer/medical-mates/webservices/webservice.php?tag=getall_rewardpt&userid=%@&month_id=&year_id=%@",[MedicalMatesDetails valueForKey:@"UserId"], _lblYearShow.text];
        
//        NSString *strYear = [NSString stringWithFormat:@"http://appt.healthwaymedical.com.sg/webservices/webservice.php?tag=getall_rewardpt&userid=%@&month_id=&year_id=%@",[MedicalMatesDetails valueForKey:@"UserId"], _lblYearShow.text];
        NSLog(@"%@",strYear);
        NSURL *urlYear = [[NSURL alloc] initWithString:[strYear stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        NSLog(@"%@",urlYear);
        NSDictionary *dicYear  = [jloader dictioneryFromJson:urlYear];
        NSLog(@"%@",dicYear);
        NSArray *arrYear = [dicYear valueForKey:@"response"];
        NSLog(@"%@",arrYear);
//        NSArray *arrnext = [arrYear objectAtIndex:0];
        
        
        if ([[dicYear valueForKey:@"Success"]isEqualToString:@"true"])
        {
            _lblShowYearPoint.text = [NSString stringWithFormat:@"%@",[[arrYear objectAtIndex:0]valueForKey:@"no_of_point"]];
            _secondTotalYearAppo.text =[NSString stringWithFormat:@"%@",[[arrYear objectAtIndex:0]valueForKey:@"no_of_appt"]];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:[[arrYear  objectAtIndex:0] valueForKey:@"Message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        }

        
        
        
        
    }
    
    
    
    
}




- (IBAction)btnSubMonth:(id)sender {
    months = YES;
    [toolBar removeFromSuperview];
    
    _pickerview.hidden=NO;
    _pickerview.backgroundColor = [UIColor whiteColor];
    
    if (IS_IPAD)
    {
        _pickerview.frame = CGRectMake(0, 810, self.view.frame.size.width, 260);
    }
    else if (IS_IPHONE5)
    {
        _pickerview.frame = CGRectMake(0, 360, self.view.frame.size.width, 260);
    }
    else
    {
     _pickerview.frame = CGRectMake(0, 460, self.view.frame.size.width, 260);
    }
    
    toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-_pickerview.frame.size.height,self.view.frame.size.width,50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClick:)];
    toolBar.items = [[NSArray alloc] initWithObjects:barButtonDone,nil];
    barButtonDone.tintColor=[UIColor blackColor];
    [self.view addSubview:toolBar];
    
}

- (IBAction)btnSubYear:(id)sender {
    
    years = YES;
    [toolBar removeFromSuperview];
    _pickerview.hidden=NO;
    _pickerview.backgroundColor=[UIColor whiteColor];
    if (IS_IPAD)
    {
        _pickerview.frame = CGRectMake(0, 810, self.view.frame.size.width, 260);
    }
    else if(IS_IPHONE5)
    {
        _pickerview.frame = CGRectMake(0, 360, self.view.frame.size.width, 260);
    }
    else
    {
       _pickerview.frame = CGRectMake(0, 460, self.view.frame.size.width, 260);
    }

    
    toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height-_pickerview.frame.size.height,self.view.frame.size.width,50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneClick:)];
    toolBar.items = [[NSArray alloc] initWithObjects:barButtonDone,nil];
    barButtonDone.tintColor=[UIColor blackColor];
    [self.view addSubview:toolBar];
    
    [_pickerview reloadAllComponents];
    
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (months==YES)
    {
        return _monthArray.count;
    }
    else if(years==YES)
    {
        return _yearArray.count;
    }
    
    return NO;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    if (months==YES)
    {
       return [_monthArray objectAtIndex:row];
    }
    else if(years==YES)
    {
        return [_yearArray objectAtIndex:row];
    }

    return [_monthArray objectAtIndex:row];
    
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (months==YES)
    {
        _lblMonthShow.text = [NSString stringWithFormat:@"%@",[_monthArray objectAtIndex:row]];
        
        
        NSString *str  = [NSString stringWithFormat:@"%@",[_monthcount objectAtIndex:row]];
        NSLog(@"month count----- %@",str);
        [MedicalMatesDetails setObject:str forKey:@"monthcount"];
        

    }
    else if(years==YES)
    {
        _lblYearShow.text = [NSString stringWithFormat:@"%@",[_yearArray objectAtIndex:row]];
    }
    
    
    
}


- (UIImage *)scaleAndRotateImage: (UIImage *)image
{
    int kMaxResolution = 320; // Or whatever
    
    CGImageRef imgRef = image.CGImage;
    
    CGFloat widthNew = CGImageGetWidth(imgRef);
    CGFloat heightNew = CGImageGetHeight(imgRef);
    
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGRect bounds = CGRectMake(0, 0, widthNew, heightNew);
    if (widthNew > kMaxResolution || heightNew > kMaxResolution) {
        CGFloat ratio = widthNew/heightNew;
        if (ratio > 1) {
            bounds.size.width = kMaxResolution;
            bounds.size.height = bounds.size.width / ratio;
        }
        else {
            bounds.size.height = kMaxResolution;
            bounds.size.width = bounds.size.height * ratio;
        }
    }
    
    CGFloat scaleRatio = bounds.size.width / widthNew;
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    CGFloat boundHeight;
    UIImageOrientation orient = image.imageOrientation;
    switch(orient) {
            
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //EXIF = 5
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored: //EXIF = 7
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            boundHeight = bounds.size.height;
            bounds.size.height = bounds.size.width;
            bounds.size.width = boundHeight;
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
            
    }
    
    UIGraphicsBeginImageContext(bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -heightNew, 0);
    }
    else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -heightNew);
    }
    
    CGContextConcatCTM(context, transform);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, widthNew, heightNew), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return imageCopy;
}




@end
