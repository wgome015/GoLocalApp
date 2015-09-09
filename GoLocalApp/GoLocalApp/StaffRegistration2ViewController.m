//
//  StaffRegistration2ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/3/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration2ViewController.h"
#import "StaffRegistration3ViewController.h"
#import "StaffRegistration4ViewController.h"
#import "StaffRegistration5ViewController.h"
#import "StaffRegistration6ViewController.h"
#import "StaffRegistration7ViewController.h"

@interface StaffRegistration2ViewController ()

@end

@implementation StaffRegistration2ViewController


@synthesize address, city, zipcode, states, stateOptions, stateSelected,
            djSwitch, liveBandSwitch, cateringCompanySwitch, otherServicesSwitch,
            djSelected, liveBandSelected, cateringCompanySelected, otherServicesSelected,
            firstName, middleName, lastName, nickName, email, password, cellphone;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //setting up UIpicker for states selection
    stateOptions = [[NSArray alloc] initWithObjects:@"",@"AL", @"AK", @"AZ", @"AR", @"CA", @"CO", @"CT", @"DE", @"FL",@"GA", @"HI", @"ID", @"IL", @"IN", @"IA", @"KS", @"KY", @"LA", @"ME", @"MD", @"MA", @"MI", @"MN", @"MS", @"MO", @"MT", @"NE", @"NV", @"NH", @"NJ", @"NM", @"NY", @"NC", @"ND", @"OH", @"OK", @"PA", @"RI", @"SC", @"SD", @"TN", @"TX", @"UT", @"VT", @"VA", @"WA", @"WV", @"WI", @"WY", nil];
    
    [self setupTextFields];
    
}//eom

/* verifying the below input fileds were filled:
 firstName, middleName, lastName, nickName, address, city, zipcode, states
 */
- (BOOL)verifyDataEnter
{
    BOOL addressFilled     = false;
    BOOL cityFilled        = false;
    BOOL zipcodeFilled     = false;
    BOOL statesFilled      = false;
    
    
    //checking for valid input
    NSCharacterSet *charSet = [NSCharacterSet whitespaceCharacterSet];
    
    NSString * testing = self.address.text;
        NSString *trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            self.address.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the Address field" and:@"Okay"];
            return 0;
        }
    
        testing = self.city.text;
        trimmedString = [testing stringByTrimmingCharactersInSet:charSet];
        if ([trimmedString isEqualToString:@""]) {
            self.city.text =@""; //clearing field
            // it's empty or contains only white spaces
            [self showAlert:@"Registration Field" withMessage:@"Missing the City field" and:@"Okay"];
            return 0;
        }
    
    //checking for empty or not the same format
    if(self.address.hasText){
        addressFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the Address field" and:@"Okay"];
        return 0;
    }
    
    if(self.city.hasText){
        cityFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the City field" and:@"Okay"];
        return 0;
    }
    
    if(self.zipcode.hasText){
        zipcodeFilled = true;
    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing the zipcode field" and:@"Okay"];
        return 0;
    }
    
    if(self.stateSelected.length != 0){
        statesFilled = true;    }
    else {
        [self showAlert:@"Registration Field" withMessage:@"Missing state field" and:@"Okay"];
        return 0;
    }
    
    if(self.djSwitch.on){
        self.djSelected = true;
    }

    if(self.liveBandSwitch.on){
        self.liveBandSelected = true;
    }

    if(self.cateringCompanySwitch.on){
        self.cateringCompanySelected = true;
    }

    if(self.otherServicesSwitch.on){
        self.otherServicesSelected = true;
    }
    
    return 1;
}//eom

/* */
- (IBAction)submitForm:(id)sender {
//    bool result = [self verifyDataEnter];
//    if(result)
//    {
        [self routeToProperController];
//    }
//    else
//    {
//        NSLog(@"missing some/all required fields");
//    }
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"toDj"]){
        StaffRegistration3ViewController *controller = (StaffRegistration3ViewController *)segue.destinationViewController;
        
        //view controller 1 data
        controller.firstName    = self.firstName;
        controller.middleName   = self.middleName;
        controller.lastName     = self.lastName;
        controller.nickName     = self.nickName;
        controller.email        = self.email;
        controller.password     = self.password;
        controller.cellphone    = self.cellphone;
        
        //view controller 2 data
        controller.address                  = address.text;
        controller.city                     = city.text;
        controller.zipcode                  = zipcode.text;
        controller.stateSelected            = stateSelected;
        
        controller.djSelected               = djSelected;
        controller.liveBandSelected         = liveBandSelected;
        controller.cateringCompanySelected  = cateringCompanySelected;
        controller.otherServicesSelected    = otherServicesSelected;
    }
    else if([segue.identifier isEqualToString:@"toLiveBand"]){
        StaffRegistration4ViewController *controller = (StaffRegistration4ViewController *)segue.destinationViewController;
        
        //view controller 1 data
        controller.firstName    = self.firstName;
        controller.middleName   = self.middleName;
        controller.lastName     = self.lastName;
        controller.nickName     = self.nickName;
        controller.email        = self.email;
        controller.password     = self.password;
        controller.cellphone    = self.cellphone;
        
        //view controller 2 data
        controller.address                  = address.text;
        controller.city                     = city.text;
        controller.zipcode                  = zipcode.text;
        controller.stateSelected            = stateSelected;
        
        controller.djSelected               = djSelected;
        controller.liveBandSelected         = liveBandSelected;
        controller.cateringCompanySelected  = cateringCompanySelected;
        controller.otherServicesSelected    = otherServicesSelected;
    }
    else     if([segue.identifier isEqualToString:@"toCateringCompany"]){
        StaffRegistration5ViewController *controller = (StaffRegistration5ViewController *)segue.destinationViewController;
        
        //view controller 1 data
        controller.firstName    = self.firstName;
        controller.middleName   = self.middleName;
        controller.lastName     = self.lastName;
        controller.nickName     = self.nickName;
        controller.email        = self.email;
        controller.password     = self.password;
        controller.cellphone    = self.cellphone;
        
        //view controller 2 data
        controller.address                  = address.text;
        controller.city                     = city.text;
        controller.zipcode                  = zipcode.text;
        controller.stateSelected            = stateSelected;
        
        controller.djSelected               = djSelected;
        controller.liveBandSelected         = liveBandSelected;
        controller.cateringCompanySelected  = cateringCompanySelected;
        controller.otherServicesSelected    = otherServicesSelected;
    }
    else if([segue.identifier isEqualToString:@"toOtherServices"]){
        StaffRegistration6ViewController *controller = (StaffRegistration6ViewController *)segue.destinationViewController;
        
        //view controller 1 data
        controller.firstName    = self.firstName;
        controller.middleName   = self.middleName;
        controller.lastName     = self.lastName;
        controller.nickName     = self.nickName;
        controller.email        = self.email;
        controller.password     = self.password;
        controller.cellphone    = self.cellphone;
        
        //view controller 2 data
        controller.address                  = address.text;
        controller.city                     = city.text;
        controller.zipcode                  = zipcode.text;
        controller.stateSelected            = stateSelected;
        
        controller.djSelected               = djSelected;
        controller.liveBandSelected         = liveBandSelected;
        controller.cateringCompanySelected  = cateringCompanySelected;
        controller.otherServicesSelected    = otherServicesSelected;
    }

    else if([segue.identifier isEqualToString:@"staffRegistration7"]){
        StaffRegistration7ViewController *controller = (StaffRegistration7ViewController *)segue.destinationViewController;
        
        //view controller 1 data
        controller.firstName    = self.firstName;
        controller.middleName   = self.middleName;
        controller.lastName     = self.lastName;
        controller.nickName     = self.nickName;
        controller.email        = self.email;
        controller.password     = self.password;
        controller.cellphone    = self.cellphone;
        
        //view controller 2 data
        controller.address                  = address.text;
        controller.city                     = city.text;
        controller.zipcode                  = zipcode.text;
        controller.stateSelected            = stateSelected;
    }
}//eom

/* route to proper controllers */
-(void) routeToProperController
{
    if(self.djSelected){
        [self performSegueWithIdentifier:@"toDj" sender:self];
    }
    else if(self.liveBandSelected){
        [self performSegueWithIdentifier:@"toLiveBand" sender:self];
    }
    else if(self.cateringCompanySelected){
        [self performSegueWithIdentifier:@"toCateringCompany" sender:self];
    }
    else if(self.otherServicesSelected){
        [self performSegueWithIdentifier:@"toOtherServices" sender:self];
    }
    else{
        //moving to the next controller
        [self performSegueWithIdentifier:@"staffRegistration7" sender:self];
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

/****** UIPicker Methods ********/
    // returns the number of 'columns' to display.
    - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
    {
        return 1;
    }

    // returns the # of rows in each component..
    - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
    {
        return [stateOptions count];
    }

    #pragma mark - UIPickerView Delegate
    - (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
    {
        return 30.0;
    }

    - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
    {
        return [stateOptions objectAtIndex:row];
    }

    //If the user chooses from the pickerview, it calls this function;
    - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
    {
        //Let's print in the console what the user had chosen;
//        NSLog(@"Chosen item: %@", [stateOptions objectAtIndex:row]);
        
        stateSelected = [stateOptions objectAtIndex:row];
    }//eom


/******** textfields  functions********/
        /* setup textfields */
        -(void) setupTextFields
        {
            //setup of texfields
            self.address.delegate           = self;
            self.city.delegate              = self;
            self.zipcode.delegate           = self;
        }//eom

        /* dimmisses UITextField as soon the background is touched */
        -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
        {
            [address resignFirstResponder];
            [city resignFirstResponder];
            [zipcode resignFirstResponder];
        }//eom

        /* dimisses UITextField as soon the return key is pressed */
        -(BOOL)textFieldShouldReturn:(UITextField *)textField {
            
            if(textField == self.address){
                [self.address resignFirstResponder];
                [self.city becomeFirstResponder];
            }
            else if(textField == self.city){
                [self.city resignFirstResponder];
                [self.zipcode becomeFirstResponder];
            }
            else if(textField == self.zipcode){
                [self.zipcode resignFirstResponder];
            }
            else{
                NSLog(@"none are the same");
            }
            
            return YES;
        }//eom


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
