//
//  StaffRegistration3ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration3ViewController.h"
#import "StaffRegistration4ViewController.h"
#import "StaffRegistration5ViewController.h"
#import "StaffRegistration6ViewController.h"
#import "StaffRegistration11ViewController.h"

@interface StaffRegistration3ViewController ()

@end

@implementation StaffRegistration3ViewController

@synthesize djDescription, djWebsite, djSocialMedia, ScrollView,
            djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
            address, city, zipcode, stateSelected,
            firstName, middleName, lastName, nickName, email, password, cellphone;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTextFields];
    [self setUpTapGesture];
    
    if(djSelected == false){
        [self determineWhereToGo];
    }
    
}//eom


/* verify required fields */
- (BOOL)verifyDataEnter
{
    BOOL djDescriptionFilled        = false;
    BOOL djWebsiteFilled            = false;
    BOOL djSocialMediaFilled        = false;
    
    if(djDescription.hasText){
        djDescriptionFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the description field" and:@"Okay"];
        return 0;
    }
    
    if(djWebsite.hasText){
        djWebsiteFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the website field" and:@"Okay"];
        return 0;
    }
    
    if(djSocialMedia.hasText){
        djSocialMediaFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the social media field" and:@"Okay"];
        return 0;
    }
    
    return 1;
}//eom

/*submitting form*/
- (IBAction)submitForm:(id)sender {
    bool results = [self verifyDataEnter];
    if( results)
    {
        [self determineWhereToGo];
    }
}//eom


/* */
-(void)determineWhereToGo
{
    if(liveBandSelected)
    {
        //moving to the next controller
        [self performSegueWithIdentifier:@"djToLiveBand" sender:self];
    }
    //catering company
    else if(cateringCompanySelected)
    {
        //skipping to catering company controller
        [self performSegueWithIdentifier:@"djToCateringCompany" sender:self];
    }
    //other services
    else if(otherServicesSelected)
    {
        //skipping to Other services controller
        [self performSegueWithIdentifier:@"djToOtherServices" sender:self];
    }
    else
    {
        //skipping to staff registration 11 controller
        [self performSegueWithIdentifier:@"djToStaffRegistration11" sender:self];
    }

}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"djToLiveBand"]){
        StaffRegistration4ViewController *controller = (StaffRegistration4ViewController *)segue.destinationViewController;
        
        controller.firstName                = firstName;                //view controller 1
        controller.middleName               = middleName;
        controller.lastName                 = lastName;
        controller.nickName                 = nickName;
        controller.email                    = email;
        controller.password                 = password;                 //view controller 2
        controller.cellphone                = cellphone;
        controller.address                  = address;
        controller.city                     = city;
        controller.zipcode                  = zipcode;
        controller.stateSelected            = stateSelected;
        
        
        controller.djDescription            = djDescription.text;       //view controller 3
        controller.djWebsite                = djWebsite.text;
        controller.djSocialMedia            = djSocialMedia.text;
        
        controller.djSelected               = djSelected;
        controller.liveBandSelected         = liveBandSelected;
        controller.cateringCompanySelected  = cateringCompanySelected;
        controller.otherServicesSelected    = otherServicesSelected;
    }
    else if([segue.identifier isEqualToString:@"djToCateringCompany"]){
        StaffRegistration5ViewController *controller = (StaffRegistration5ViewController *)segue.destinationViewController;
        
        controller.firstName                = firstName;                //view controller 1
        controller.middleName               = middleName;
        controller.lastName                 = lastName;
        controller.nickName                 = nickName;
        controller.email                    = email;
        controller.password                 = password;                 //view controller 2
        controller.cellphone                = cellphone;
        controller.address                  = address;
        controller.city                     = city;
        controller.zipcode                  = zipcode;
        controller.stateSelected            = stateSelected;
        
        
        controller.djDescription            = djDescription.text;       //view controller 3
        controller.djWebsite                = djWebsite.text;
        controller.djSocialMedia            = djSocialMedia.text;
        
        controller.djSelected               = djSelected;
        controller.liveBandSelected         = liveBandSelected;
        controller.cateringCompanySelected  = cateringCompanySelected;
        controller.otherServicesSelected    = otherServicesSelected;
    }
    else if([segue.identifier isEqualToString:@"djToOtherServices"]){
        StaffRegistration6ViewController *controller = (StaffRegistration6ViewController *)segue.destinationViewController;
        
        controller.firstName                = firstName;                //view controller 1
        controller.middleName               = middleName;
        controller.lastName                 = lastName;
        controller.nickName                 = nickName;
        controller.email                    = email;
        controller.password                 = password;                 //view controller 2
        controller.cellphone                = cellphone;
        controller.address                  = address;
        controller.city                     = city;
        controller.zipcode                  = zipcode;
        controller.stateSelected            = stateSelected;
        
        
        controller.djDescription            = djDescription.text;       //view controller 3
        controller.djWebsite                = djWebsite.text;
        controller.djSocialMedia            = djSocialMedia.text;
        
        controller.djSelected               = djSelected;
        controller.liveBandSelected         = liveBandSelected;
        controller.cateringCompanySelected  = cateringCompanySelected;
        controller.otherServicesSelected    = otherServicesSelected;
    }
    else if([segue.identifier isEqualToString:@"djToStaffRegistration11"]){
        StaffRegistration11ViewController *controller = (StaffRegistration11ViewController *)segue.destinationViewController;
        
        controller.firstName                = firstName;                //view controller 1
        controller.middleName               = middleName;
        controller.lastName                 = lastName;
        controller.nickName                 = nickName;
        controller.email                    = email;
        controller.password                 = password;                 //view controller 2
        controller.cellphone                = cellphone;
        controller.address                  = address;
        controller.city                     = city;
        controller.zipcode                  = zipcode;
        controller.stateSelected            = stateSelected;
        
        
        controller.djDescription            = djDescription.text;       //view controller 3
        controller.djWebsite                = djWebsite.text;
        controller.djSocialMedia            = djSocialMedia.text;
        
        controller.djSelected               = djSelected;
        controller.liveBandSelected         = liveBandSelected;
        controller.cateringCompanySelected  = cateringCompanySelected;
        controller.otherServicesSelected    = otherServicesSelected;
    }
}//eom

/* create UIAlert*/
-(void) showAlert:(NSString*)title withMessage:(NSString*)message and:(NSString*) cancelTitle
{
    
    //creating UIAlert
    UIAlertView * alert =[[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:cancelTitle
                                          otherButtonTitles: nil];
    [alert show];//display alert
}//eom
/********* tap gestures functions *******/
        /*sets up taps gesture*/
        -(void)setUpTapGesture
        {
            //to dismiss keyboard when a tap is done outside the textfield
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard:)];
            [self.view addGestureRecognizer:tap];
            
        }//eom

        /* dimisses keyboard upon touching background */
        - (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer {
            [self.view endEditing:YES];
        }//eom

/******** textfields  functions********/
        /* setup textfields */
        -(void) setupTextFields
        {
            //setup of texfields
            self.djDescription.delegate         = self;
            self.djWebsite.delegate             = self;
            self.djSocialMedia.delegate         = self;
        }//eom

//        /* dimmisses UITextField as soon the background is touched - this will not work with UiScrollview*/
//        -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//        {
//            [djDescription resignFirstResponder];
//            [djWebsite resignFirstResponder];
//            [djSocialMedia resignFirstResponder];
//        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
            if(textField == self.djWebsite){
                [self.djWebsite resignFirstResponder];
                [self.djSocialMedia becomeFirstResponder];
            }
            else{
                NSLog(@"none are the same");
            }
            
            return YES;
        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textViewShouldReturn:(UITextView *)textView {
            
            if(textView == self.djDescription){
                [self.djDescription resignFirstResponder];
                [self.djWebsite becomeFirstResponder];
            }
            else if(textView == self.djSocialMedia){
                [self.djSocialMedia resignFirstResponder];
            }
            else{
                NSLog(@"none are the same");
            }
            
            return YES;
        }//eom

        /********* scrollview functions **********/
        - (void) scrollViewAdaptToStartEditingTextField:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, textField.frame.origin.y - 3 * textField.frame.size.height);
            [ScrollView setContentOffset:point animated:YES];
        }

        - (void) scrollVievEditingFinished:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, 0);
            [ScrollView setContentOffset:point animated:YES];
        }

        /* textfield */
        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
            return YES;
        }

        /* textview */
        - (BOOL) textViewShouldBeginEditing:(UITextField *)textView
        {
            [self scrollViewAdaptToStartEditingTextField:textView];
            return YES;
        }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
