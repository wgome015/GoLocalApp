//
//  StaffRegistration9ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration9ViewController.h"
#import "StaffRegistration10ViewController.h"
#import "StaffRegistration11ViewController.h"


@interface StaffRegistration9ViewController ()

@end

@implementation StaffRegistration9ViewController

@synthesize height, weight, hairColor, eyeColor, pantSize, shoeSize, tshirtSize, desiredHourlyRate, desiredWeeklyRate,  hasTattoos, hasPiercings, piercings, tattoos, scrollView,
firstName, middleName, lastName, nickName, email, password, cellphone, address, city, zipcode, stateSelected,  dob, gender, languages, ethnicity, typeOfLicense;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpTapGesture];
    [self setupTextFields];
}//eom


/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    //checking for valid input
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    
        NSString * testing = height.text;
        NSString *trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:height]; //take scroll to textfield so user can see their error
            height.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the height field" and:@"Okay"];
            return 0;
        }
    
        testing = weight.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:weight]; //take scroll to textfield so user can see their error
            weight.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the weight field" and:@"Okay"];
            return 0;
        }
    
        testing = hairColor.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:hairColor]; //take scroll to textfield so user can see their error
            hairColor.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the hair color field" and:@"Okay"];
            return 0;
        }
    
        testing = eyeColor.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:eyeColor]; //take scroll to textfield so user can see their error
            eyeColor.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the eye color field" and:@"Okay"];
            return 0;
        }
        
        testing = pantSize.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:pantSize]; //take scroll to textfield so user can see their error
            pantSize.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the pant size field" and:@"Okay"];
            return 0;
        }
    
        testing = shoeSize.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:shoeSize]; //take scroll to textfield so user can see their error
            shoeSize.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the shoe size field" and:@"Okay"];
            return 0;
        }
        
        testing = tshirtSize.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:tshirtSize]; //take scroll to textfield so user can see their error
            tshirtSize.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the T-Shirt field" and:@"Okay"];
            return 0;
        }
    
        testing = desiredHourlyRate.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:desiredHourlyRate]; //take scroll to textfield so user can see their error
            desiredHourlyRate.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the desired Hourly Rate field" and:@"Okay"];
            return 0;
        }
        
        testing = desiredWeeklyRate.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            [self scrollVievEditingFinished:desiredWeeklyRate]; //take scroll to textfield so user can see their error
            desiredWeeklyRate.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the desired Weekly Rate field" and:@"Okay"];
            return 0;
        }

    
        if(hasTattoos.on)
        {
            self.tattoos = true;
        }
    
        if(hasPiercings.on)
        {
            self.piercings = true;
        }
        
    
    return 1;
}//eom


/* submmitting form */
- (IBAction)submitForm:(id)sender
{
//    //verifying the data enter
//    bool result = [self verifyDataEnter];
//    if(result)
//    {
//        //user is a male, skipping female questions in controller 10
//        if(self.gender)
//        {
            [self performSegueWithIdentifier:@"staffRegistration11c" sender:self];
//        }
//        //user is a female, she needs to answer questions in controller 10
//        else
//        {
//            [self performSegueWithIdentifier:@"staffRegistration10" sender:self];
//        }
//    }
//    else
//    {
//        NSLog(@"missing some/all required fields");
//    }
}//eom


/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"staffRegistration10"]){
        StaffRegistration10ViewController *controller = (StaffRegistration10ViewController *)segue.destinationViewController;
       
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
        
        controller.height                   = height.text;          //view controller 9
        controller.weight                   = weight.text;
        controller.hairColor                = hairColor.text;
        controller.eyeColor                 = eyeColor.text;
        controller.pantSize                 = pantSize.text;
        controller.shoeSize                 = shoeSize.text;
        controller.tshirtSize               = tshirtSize.text;
        controller.desiredHourlyRate        = desiredHourlyRate.text;
        controller.desiredWeeklyRate        = desiredWeeklyRate.text;
        controller.tattoos                  = tattoos;
        controller.piercings                = piercings;
    }
    if([segue.identifier isEqualToString:@"staffRegistration11c"]){
        StaffRegistration11ViewController *controller = (StaffRegistration11ViewController *)segue.destinationViewController;

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
        
        controller.height                   = height.text;          //view controller 9
        controller.weight                   = weight.text;
        controller.hairColor                = hairColor.text;
        controller.eyeColor                 = eyeColor.text;
        controller.pantSize                 = pantSize.text;
        controller.shoeSize                 = shoeSize.text;
        controller.tshirtSize               = tshirtSize.text;
        controller.desiredHourlyRate        = desiredHourlyRate.text;
        controller.desiredWeeklyRate        = desiredWeeklyRate.text;
        controller.tattoos                  = tattoos;
        controller.piercings                = piercings;
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
            self.height.delegate            = self;
            self.weight.delegate            = self;
            self.hairColor.delegate         = self;
            self.eyeColor.delegate          = self;
            self.pantSize.delegate          = self;
            self.shoeSize.delegate          = self;
            self.tshirtSize.delegate        = self;
            
            self.desiredHourlyRate.delegate = self;
            self.desiredWeeklyRate.delegate = self;
            
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
            
            if(textField == self.height){
                [self.height resignFirstResponder];
                [self.weight becomeFirstResponder];
            }
            else if(textField == self.weight){
                [self.weight resignFirstResponder];
                [self.hairColor becomeFirstResponder];
            }
            else if(textField == self.hairColor){
                [self.hairColor resignFirstResponder];
                [self.eyeColor becomeFirstResponder];
            }
            else if(textField == self.eyeColor){
                [self.eyeColor resignFirstResponder];
                [self.pantSize becomeFirstResponder];
            }
            else if(textField == self.pantSize){
                [self.pantSize resignFirstResponder];
                [self.shoeSize becomeFirstResponder];
            }
            else if(textField == self.shoeSize){
                [self.shoeSize resignFirstResponder];
                [self.tshirtSize becomeFirstResponder];
            }
            else if(textField == self.tshirtSize){
                [self.tshirtSize resignFirstResponder];
            }
            else if(textField == self.desiredHourlyRate){
                [self.desiredHourlyRate resignFirstResponder];
                [self.desiredWeeklyRate becomeFirstResponder];
            }
            else if(textField == self.desiredWeeklyRate){
                [self.desiredWeeklyRate resignFirstResponder];
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
