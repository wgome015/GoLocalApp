//
//  StaffRegistration11ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration11ViewController.h"
#import "StaffRegistration12ViewController.h"

@interface StaffRegistration11ViewController ()

@end

@implementation StaffRegistration11ViewController

@synthesize notIncorporated, incorporated, ssn, ein, businessName, willingToTravel, travel, citiesWillingToWork, professionalInsurance, hasProfessionalInsurance, typeCorporated, scrollView,
    firstName, middleName, lastName, nickName, email, cellphone,
    password, address, city, zipcode, stateSelected,
    djSelected, djDescription, djWebsite, djSocialMedia,
    liveBandSelected, liveBandDescription, liveBandWebsite, liveBandSocialMedia,
    cateringCompanySelected, cateringCompanyDescription, cateringCompanyWebsite, cateringCompanySocialMedia,
    otherServicesSelected, otherServicesDescription, otherServicesWebsite, otherServicesSocialMedia,
    dob, gender, languages,
    ethnicity, typeOfLicense,
    height, weight, hairColor, eyeColor, pantSize, shoeSize, tshirtSize, desiredHourlyRate, desiredWeeklyRate, piercings, tattoos,
    chestSize, waistSize, hipsSize, dressSize;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupTextFields];
    [self setUpTapGesture];
}//eom


/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    //capture the value set for 'professional Insurance' - NOT REQUIRED FILED
    if(self.hasProfessionalInsurance.on)
    {
        self.professionalInsurance = true;
    }
    
    //checking for valid input
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    NSString * testing;
    NSString *trimmedString ;

        //capture the value set for 'willing To Travel'
        if(self.willingToTravel.on)
        {
            self.travel = true;
        }
    
        NSLog(self.typeCorporated ? @"true":@"false");
    
    
        if(!self.notIncorporated.on && !self.incorporated.on)
        {
            [self showAlert:@"Registration Field" withMessage:@"Missing the selection of incorporated or not incorporated" and:@"Okay"];
            return 0;
        }
        //incorporated
        else if(!self.typeCorporated)
        {
            testing = self.ssn.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:self.ssn]; //take scroll to textfield so user can see their error
                self.ssn.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Missing the Social Security Number field" and:@"Okay"];
                return 0;
            }

        }
        //not incorporated
        else if(self.typeCorporated)
        {
            testing = self.ein.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:self.ein]; //take scroll to textfield so user can see their error
                self.ein.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Missing the Employer identification Number field" and:@"Okay"];
                return 0;
            }
            
            testing = self.businessName.text;
            trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
            if ([trimmedString isEqualToString:@""]) {
                [self scrollVievEditingFinished:self.businessName]; //take scroll to textfield so user can see their error
                self.businessName.text =@""; //clearing field
                // it's empty or contains only white spaces
                [self showAlert:@"Registration Field" withMessage:@"Missing the Business Name field" and:@"Okay"];
                return 0;
            }
        }
    

//    citiesWillingToWork
    
    return 1;
}//eom


- (IBAction)notIncorporatedValueChanged:(id)sender {
    
    NSLog(@"notincorporate value changed to:");
    NSLog(self.notIncorporated.on ? @"true":@"false");
    
    if(self.notIncorporated.on){
        [self.incorporated setOn:false];
        self.typeCorporated = false; //0 means notincorporated selected
    }
    else {
        [self.incorporated setOn:true];
        self.typeCorporated = true; //1 means incorporated selected
    }
    
    NSLog(@"type corporated updated to:");
    NSLog(self.typeCorporated ? @"true":@"false");

}//eo-action

- (IBAction)incorporatedValueChanged:(id)sender {
    
    
    NSLog(@"incorporate value changed to:");
    NSLog(self.notIncorporated.on ? @"true":@"false");
    
    if(self.incorporated.on){
        [self.notIncorporated setOn:false];
        self.typeCorporated = true; //1 means incorporated selected
    }
    else {
        [self.notIncorporated setOn:true];
        self.typeCorporated = false; //0 means notincorporated selected
    }

    NSLog(@"type corporated updated to:");
}//eo-action


/* submmitting form */
- (IBAction)submitForm:(id)sender
{
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
        [self performSegueWithIdentifier:@"staffRegistration12" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields");
    }
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"staffRegistration12"]){
        StaffRegistration12ViewController *controller = (StaffRegistration12ViewController *)segue.destinationViewController;
        
        controller.firstName                = self.firstName;       //view controller 1
        controller.middleName               = self.middleName;
        controller.lastName                 = self.lastName;
        controller.nickName                 = self.nickName;
        controller.email                    = self.email;
        controller.password                 = self.password;
        controller.cellphone                = self.cellphone;
        controller.address                  = self.address;         //view controller 2
        controller.city                     = self.city;
        controller.zipcode                  = self.zipcode;
        controller.stateSelected            = self.stateSelected;
        controller.dob                      = self.dob;             //view controller 7
        controller.gender                   = self.gender;
        controller.languages                = self.languages;
        controller.ethnicity                = self.ethnicity;       //view controller 8
        controller.typeOfLicense            = self.typeOfLicense;
        controller.height                   = self.height;          //view controller 9
        controller.weight                   = self.weight;
        controller.hairColor                = self.hairColor;
        controller.eyeColor                 = self.eyeColor;
        controller.pantSize                 = self.pantSize;
        controller.shoeSize                 = self.shoeSize;
        controller.tshirtSize               = self.tshirtSize;
        controller.desiredHourlyRate        = self.desiredHourlyRate;
        controller.desiredWeeklyRate        = self.desiredWeeklyRate;
        controller.tattoos                  = self.tattoos;
        controller.piercings                = self.piercings;
        
        controller.chestSize                = self.chestSize;       //view controller 10
        controller.waistSize                = self.waistSize;
        controller.hipsSize                 = self.hipsSize;
        controller.dressSize                = self.dressSize;
        
        controller.typeCorporated           = self.typeCorporated;       //view controller 11
        controller.travel                   = self.travel;
        controller.professionalInsurance    = self.professionalInsurance;
        
        controller.typeCorporated           = typeCorporated; // 0 - not incorporated | 1 - corporated     //view controller 12
        controller.ssn                      = ssn.text;
        controller.ein                      = ein.text;
        controller.businessName             = businessName.text;
        controller.citiesWillingToWork      = citiesWillingToWork.text;
        controller.travel                   = travel; // 0 - not traveling | 1 - traveling
        controller.professionalInsurance    = professionalInsurance; // 0 - not prof insurance | 1 - prof insurance
        
        controller.djDescription                = self.djDescription;               //view controller 3
        controller.djWebsite                    = self.djWebsite;
        controller.djSocialMedia                = self.djSocialMedia;

        controller.liveBandDescription          = self.liveBandDescription;         //view controller 4
        controller.liveBandWebsite              = self.liveBandWebsite;
        controller.liveBandSocialMedia          = self.liveBandSocialMedia;
        
        controller.cateringCompanyDescription   = self.cateringCompanyDescription;  //view controller 5
        controller.cateringCompanyWebsite       = self.cateringCompanyWebsite;
        controller.cateringCompanySocialMedia   = self.cateringCompanySocialMedia;
        
        controller.otherServicesDescription     = self.otherServicesDescription;    //view controller 6
        controller.otherServicesWebsite         = self.otherServicesWebsite;
        controller.otherServicesSocialMedia     = self.otherServicesSocialMedia;
        
        controller.djSelected                   = self.djSelected;
        controller.liveBandSelected             = self.liveBandSelected;
        controller.cateringCompanySelected      = self.cateringCompanySelected;
        controller.otherServicesSelected        = self.otherServicesSelected;
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
            
        }//eoom

        /* dimisses keyboard upon touching background */
        - (void)dismissKeyboard:(UITapGestureRecognizer *)recognizer {
            [self.view endEditing:YES];
        }



/******** textfields  functions********/

        /* setup textfields */
        -(void) setupTextFields
        {
            //setup of texfields
            self.ssn.delegate               = self;
            self.ein.delegate               = self;
            self.businessName.delegate      = self;
        }//eom


        //        /* dimmisses UITextField as soon the background is touched - this will not work with UiScrollview*/
        //        -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
        //        {
        //            [firstName resignFirstResponder];
        //            [middleName resignFirstResponder];
        //            [lastName resignFirstResponder];
        //            [nickName resignFirstResponder];
        //            [email resignFirstResponder];
        //            [confirmEmail resignFirstResponder];
        //            [password resignFirstResponder];
        //            [confirmPassword resignFirstResponder];
        //            [cellphone resignFirstResponder];
        //        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
            if(textField == self.ssn){
                [self.ssn resignFirstResponder];
            }
            else if(textField == self.ein){
                [self.ein resignFirstResponder];
                [self.businessName becomeFirstResponder];
            }
            else if(textField == self.businessName){
                [self.businessName resignFirstResponder];
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
            [scrollView setContentOffset:point animated:YES];
        }

        - (void) scrollVievEditingFinished:(UITextField*)textField
        {
            CGPoint point = CGPointMake(0, 0);
            [scrollView setContentOffset:point animated:YES];
        }

        - (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
        {
            [self scrollViewAdaptToStartEditingTextField:textField];
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
