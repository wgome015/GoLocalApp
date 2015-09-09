//
//  StaffRegistration6ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration6ViewController.h"
#import "StaffRegistration11ViewController.h"

@interface StaffRegistration6ViewController ()

@end

@implementation StaffRegistration6ViewController


@synthesize  otherServicesDescription, otherServicesWebsite, otherServicesSocialMedia, ScrollView,
firstName, middleName, lastName, nickName, email, password, cellphone, address, city, zipcode, stateSelected,
djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
djDescription, djWebsite, djSocialMedia,
liveBandDescription, liveBandWebsite, liveBandSocialMedia,
cateringCompanyDescription, cateringCompanyWebsite, cateringCompanySocialMedia;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTextFields];
    [self setUpTapGesture];
    
    if(otherServicesSelected == false){
        [self determineWhereToGo];
    }
}

-(void)viewWillAppear
{
    [self setupTextFields];
    [self setUpTapGesture];
}


/* verify required fields */
- (BOOL)verifyDataEnter
{
    BOOL otherServicesDescriptionFilled        = false;
    BOOL otherServicesWebsiteFilled            = false;
    BOOL otherServicesSocialMediaFilled        = false;
    
    if(otherServicesDescription.hasText){
        otherServicesDescriptionFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the description field" and:@"Okay"];
        return 0;
    }
    
    if(otherServicesWebsite.hasText){
        otherServicesWebsiteFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the website field" and:@"Okay"];
        return 0;
    }
    
    if(otherServicesSocialMedia.hasText){
        otherServicesSocialMediaFilled = true;
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

-(void)determineWhereToGo
{
    //skipping to staff registration 11 controller
    [self performSegueWithIdentifier:@"otherServicesToStaffRegistration11" sender:self];
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"cateringCompanyToStaffRegistration11"]){
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
        
        controller.liveBandDescription      = liveBandDescription;      //view controller 4
        controller.liveBandWebsite          = liveBandWebsite;
        controller.liveBandSocialMedia      = liveBandSocialMedia;
        
        controller.cateringCompanyDescription   = cateringCompanyDescription;  //view controller 5
        controller.cateringCompanyWebsite       = cateringCompanyWebsite;
        controller.cateringCompanySocialMedia   = cateringCompanySocialMedia;
        
        controller.otherServicesDescription   = otherServicesDescription.text;  //view controller 6
        controller.otherServicesWebsite       = otherServicesWebsite.text;
        controller.otherServicesSocialMedia   = otherServicesSocialMedia.text;

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
            self.otherServicesDescription.delegate         = self;
            self.otherServicesWebsite.delegate             = self;
            self.otherServicesSocialMedia.delegate         = self;
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
            
            if(textField == self.otherServicesWebsite){
                [self.otherServicesWebsite resignFirstResponder];
                [self.otherServicesSocialMedia becomeFirstResponder];
            }
            else{
                NSLog(@"none are the same");
            }
            
            return YES;
        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textViewShouldReturn:(UITextView *)textView {
            
            if(textView == self.otherServicesDescription){
                [self.otherServicesDescription resignFirstResponder];
                [self.otherServicesWebsite becomeFirstResponder];
            }
            else if(textView == self.otherServicesSocialMedia){
                [self.otherServicesSocialMedia resignFirstResponder];
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
