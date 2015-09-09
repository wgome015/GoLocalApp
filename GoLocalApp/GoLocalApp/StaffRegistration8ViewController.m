//
//  StaffRegistration8ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration8ViewController.h"
#import "StaffRegistration9ViewController.h"

@interface StaffRegistration8ViewController ()

@end

@implementation StaffRegistration8ViewController
{
    int ethnicityRowSelected;
}

@synthesize typeOfLicense, driverLicense, commercialLicense, ethnicityPicker, ethnicity,ethnicitiesOptions,scrollView,
    address, city, zipcode, stateSelected, firstName, middleName, lastName, nickName, email, password, cellphone, dob, gender, languages;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //setting up UIpicker for states selection
    ethnicitiesOptions = [[NSArray alloc] initWithObjects:@"",
                                                        @"Non-Hispanic White or Euro-American",
                                                        @"Black, Afro-Caribbean, or African American",
                                                        @"Latino or Hispanic American",
                                                        @"East Asian or Asian American",
                                                        @"South Asian or Indian American",
                                                        @"Middle Eastern or Arab American",
                                                        @"Native American or Alaskan Native",
                                                        @"Other",
                                                        nil];
    
        [self setUpTapGesture];
    
}//eom

/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    //double checking type of license is set
    if(self.driverLicense.on){
        self.typeOfLicense = false;
    }
    else {
        self.typeOfLicense = true;
    }
    
    //double checking ethnicity is set
    if(ethnicityRowSelected < 1)
    {
        [self showAlert:@"Registration Field" withMessage:@"Missing the ethnicity field" and:@"Okay"];
        return 0;
    }
    else
    {
        self.ethnicity = ethnicityRowSelected;
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
        //    moving to the next controller
        [self performSegueWithIdentifier:@"staffRegistration9" sender:self];
//    }
//    else
//    {
//        NSLog(@"missing some/all required fields");
//    }
}//eom

- (IBAction)driverLicenseChanged:(id)sender {
    if(self.driverLicense.on){
        [self.commercialLicense setOn:false];
        self.typeOfLicense = false;
    }
    else {
        [self.commercialLicense setOn:true];
        self.typeOfLicense = true;
    }
}//eom

- (IBAction)commercialLicenseChanged:(id)sender {
    if(self.commercialLicense.on){
        [self.driverLicense setOn:false];
        self.typeOfLicense = true;
    }
    else {
        [self.driverLicense setOn:true];
        self.typeOfLicense = false;
    }
}//eom

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"staffRegistration9"]){
        StaffRegistration9ViewController *controller = (StaffRegistration9ViewController *)segue.destinationViewController;
        //view controller 1 & 2 data
        
        controller.firstName                = self.firstName;
        controller.middleName               = self.middleName;
        controller.lastName                 = self.lastName;
        controller.nickName                 = self.nickName;
        controller.email                    = self.email;
        controller.password                 = self.password;
        controller.cellphone                = self.cellphone;
        controller.address                  = self.address;
        controller.city                     = self.city;
        controller.zipcode                  = self.zipcode;
        controller.stateSelected            = self.stateSelected;
        controller.dob                      = self.dob;
        controller.gender                   = self.gender;
        controller.languages                = self.languages;
        
        controller.ethnicity                = ethnicity;
        controller.typeOfLicense            = typeOfLicense;
        
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

/****** UIPicker Methods ********/
        // returns the number of 'columns' to display.
        - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
        {
            return 1;
        }

        // returns the # of rows in each component..
        - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
        {
            return [ethnicitiesOptions count];
        }

        #pragma mark - UIPickerView Delegate
        - (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
        {
            return 30.0;
        }

        - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
        {
            return [ethnicitiesOptions objectAtIndex:row];
        }

        //If the user chooses from the pickerview, it calls this function;
        - (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
        {
            //Let's print in the console what the user had chosen;
//            NSLog(@"Chosen item: %@", [ethnicitiesOptions objectAtIndex:row]);
//            NSLog(@"row is %ld", (long)row);
            ethnicityRowSelected = (int)row;
        }//eom

        /* uipicker delegate method to change font size and type*/
        - (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
            
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor blueColor];        //background color
            label.textColor = [UIColor whiteColor];             //text color
//            label.textAlignment = NSTextAlignmentCenter;        //text aligngment
            label.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:8];
            
            //WithFrame:CGRectMake(0, 0, pickerView.frame.size.width, 60)];
            
            label.text = [ethnicitiesOptions objectAtIndex:row];
            
            return label;
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
