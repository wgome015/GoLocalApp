//
//  StaffRegistration4ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration4ViewController.h"
#import "StaffRegistration5ViewController.h"
#import "StaffRegistration6ViewController.h"
#import "StaffRegistration11ViewController.h"

@interface StaffRegistration4ViewController ()

@end

@implementation StaffRegistration4ViewController

@synthesize liveBandDescription, liveBandWebsite, liveBandSocialMedia, ScrollView,
            firstName, middleName, lastName, nickName, email, password, cellphone, address, city, zipcode, stateSelected,
            djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
            djDescription, djWebsite, djSocialMedia;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTextFields];
    [self setUpTapGesture];
    
    if(liveBandSelected == false){
        [self determineWhereToGo];
    }
}


/* verify required fields */
- (BOOL)verifyDataEnter
{
    BOOL liveBandDescriptionFilled        = false;
    BOOL liveBandWebsiteFilled            = false;
    BOOL liveBandSocialMediaFilled        = false;
    
    if(liveBandDescription.hasText){
        liveBandDescriptionFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the description field" and:@"Okay"];
        return 0;
    }
    
    if(liveBandWebsite.hasText){
        liveBandWebsiteFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the website field" and:@"Okay"];
        return 0;
    }
    
    if(liveBandSocialMedia.hasText){
        liveBandSocialMediaFilled = true;
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
    
    NSLog(@" %s", results ? "true" : "false");
    
    if( results)
    {
        [self determineWhereToGo];
    }
}//eom


/* */
-(void)determineWhereToGo
{
    
    //catering company
    if(cateringCompanySelected)
    {
        //skipping to catering company controller
        [self performSegueWithIdentifier:@"liveBandToCateringCompany" sender:self];
    }
    //other services
    else if(otherServicesSelected)
    {
        //skipping to Other services controller
        [self performSegueWithIdentifier:@"liveBandToOtherServices" sender:self];
    }
    else
    {
        //skipping to staff registration 11 controller
        [self performSegueWithIdentifier:@"liveBandToStaffRegistration11" sender:self];
    }
    
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"liveBandToCateringCompany"]){
        StaffRegistration5ViewController *controller = (StaffRegistration5ViewController *)segue.destinationViewController;
        
        controller.firstName                = firstName;                //view controller 1
        controller.middleName               = middleName;
        controller.lastName                 = lastName;
        controller.nickName                 = nickName;
        controller.email                    = email;
        controller.password                 = password;
        controller.cellphone                = cellphone;
        controller.address                  = address;                  //view controller 2
        controller.city                     = city;
        controller.zipcode                  = zipcode;
        controller.stateSelected            = stateSelected;
        controller.djDescription            = djDescription;            //view controller 3
        controller.djWebsite                = djWebsite;
        controller.djSocialMedia            = djSocialMedia;
        
        controller.liveBandDescription      = liveBandDescription.text;  //view controller 4
        controller.liveBandWebsite          = liveBandWebsite.text;
        controller.liveBandSocialMedia      = liveBandSocialMedia.text;
        
        controller.djSelected               = djSelected;
        controller.liveBandSelected         = liveBandSelected;
        controller.cateringCompanySelected  = cateringCompanySelected;
        controller.otherServicesSelected    = otherServicesSelected;
    }
    else if([segue.identifier isEqualToString:@"liveBandToOtherServices"]){
        StaffRegistration6ViewController *controller = (StaffRegistration6ViewController *)segue.destinationViewController;
        
        controller.firstName                = firstName;                //view controller 1
        controller.middleName               = middleName;
        controller.lastName                 = lastName;
        controller.nickName                 = nickName;
        controller.email                    = email;
        controller.password                 = password;
        controller.cellphone                = cellphone;
        controller.address                  = address;                  //view controller 2
        controller.city                     = city;
        controller.zipcode                  = zipcode;
        controller.stateSelected            = stateSelected;
        controller.djDescription            = djDescription;            //view controller 3
        controller.djWebsite                = djWebsite;
        controller.djSocialMedia            = djSocialMedia;
        
        controller.liveBandDescription      = liveBandDescription.text;  //view controller 4
        controller.liveBandWebsite          = liveBandWebsite.text;
        controller.liveBandSocialMedia      = liveBandSocialMedia.text;
        
        controller.djSelected               = djSelected;
        controller.liveBandSelected         = liveBandSelected;
        controller.cateringCompanySelected  = cateringCompanySelected;
        controller.otherServicesSelected    = otherServicesSelected;
        
    }
    else if([segue.identifier isEqualToString:@"liveBandToStaffRegistration11"]){
        StaffRegistration11ViewController *controller = (StaffRegistration11ViewController *)segue.destinationViewController;
        
        controller.firstName                = firstName;                //view controller 1
        controller.middleName               = middleName;
        controller.lastName                 = lastName;
        controller.nickName                 = nickName;
        controller.email                    = email;
        controller.password                 = password;
        controller.cellphone                = cellphone;
        controller.address                  = address;                  //view controller 2
        controller.city                     = city;
        controller.zipcode                  = zipcode;
        controller.stateSelected            = stateSelected;
        controller.djDescription            = djDescription;            //view controller 3
        controller.djWebsite                = djWebsite;
        controller.djSocialMedia            = djSocialMedia;
        
        controller.liveBandDescription      = liveBandDescription.text;  //view controller 4
        controller.liveBandWebsite          = liveBandWebsite.text;
        controller.liveBandSocialMedia      = liveBandSocialMedia.text;
        
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
            self.liveBandDescription.delegate         = self;
            self.liveBandWebsite.delegate             = self;
            self.liveBandSocialMedia.delegate         = self;
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
            
            if(textField == self.liveBandWebsite){
                [self.liveBandWebsite resignFirstResponder];
                [self.liveBandSocialMedia becomeFirstResponder];
            }
            else{
                NSLog(@"none are the same");
            }
            
            return YES;
        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textViewShouldReturn:(UITextView *)textView {
            
            if(textView == self.liveBandDescription){
                [self.liveBandDescription resignFirstResponder];
                [self.liveBandWebsite becomeFirstResponder];
            }
            else if(textView == self.liveBandSocialMedia){
                [self.liveBandSocialMedia resignFirstResponder];
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

@end
