//
//  StaffRegistration10ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration10ViewController.h"
#import "StaffRegistration11ViewController.h"

@interface StaffRegistration10ViewController ()

@end

@implementation StaffRegistration10ViewController

@synthesize chestSize, waistSize, hipsSize, dressSize, scrollView,
firstName, middleName, lastName, nickName, email, password, cellphone, address, city, zipcode, stateSelected,  dob, gender, languages, ethnicity, typeOfLicense, height, weight, hairColor, eyeColor, pantSize, shoeSize, tshirtSize, desiredHourlyRate, desiredWeeklyRate, piercings, tattoos;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTextFields];
    [self setUpTapGesture];
}//eom


/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    //checking for valid input
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    
    NSString * testing = chestSize.text;
    NSString *trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:chestSize]; //take scroll to textfield so user can see their error
        chestSize.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Missing the chest field" and:@"Okay"];
        return 0;
    }
    
    testing = waistSize.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:waistSize]; //take scroll to textfield so user can see their error
        waistSize.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Missing the waist field" and:@"Okay"];
        return 0;
    }
    
    testing = hipsSize.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:hipsSize]; //take scroll to textfield so user can see their error
        hipsSize.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Missing the hips field" and:@"Okay"];
        return 0;
    }
    
    testing = dressSize.text;
    trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
    if ([trimmedString isEqualToString:@""]) {
        [self scrollVievEditingFinished:dressSize]; //take scroll to textfield so user can see their error
        dressSize.text =@""; //clearing field
        // it's empty or contains only white spaces
        [self showAlert:@"Registration Field" withMessage:@"Missing the dress field" and:@"Okay"];
        return 0;
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
        [self performSegueWithIdentifier:@"staffRegistration11b" sender:self];
//    }
//    else
//    {
//        NSLog(@"missing some/all required fields");
//    }
    
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([segue.identifier isEqualToString:@"staffRegistration11b"]){
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
            
            controller.chestSize                = chestSize.text;//view controller 10
            controller.waistSize                = waistSize.text;
            controller.hipsSize                 = hipsSize.text;
            controller.dressSize                = dressSize.text;
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
            self.chestSize.delegate            = self;
            self.waistSize.delegate            = self;
            self.hipsSize.delegate             = self;
            self.dressSize.delegate            = self;
            
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
            
                        if(textField == self.chestSize){
                            [self.chestSize resignFirstResponder];
                            [self.waistSize becomeFirstResponder];
                        }
                        else if(textField == self.waistSize){
                            [self.waistSize resignFirstResponder];
                            [self.hipsSize becomeFirstResponder];
                        }
                        else if(textField == self.hipsSize){
                            [self.hipsSize resignFirstResponder];
                            [self.dressSize becomeFirstResponder];
                        }
                        else if(textField == self.dressSize){
                            [self.dressSize resignFirstResponder];
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
