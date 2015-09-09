//
//  StaffRegistration16ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/8/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration16ViewController.h"
//#import "LogInViewController.h"

@interface StaffRegistration16ViewController ()

@end

@implementation StaffRegistration16ViewController
@synthesize agreeTermsSwitch, termsAndAgreements, submitButton, scrollView,
firstName, middleName, lastName, nickName, email, cellphone,
password, address, city, zipcode, stateSelected,
djSelected, djDescription, djWebsite, djSocialMedia,
liveBandSelected, liveBandDescription, liveBandWebsite, liveBandSocialMedia,
cateringCompanySelected, cateringCompanyDescription, cateringCompanyWebsite, cateringCompanySocialMedia,
otherServicesSelected, otherServicesDescription, otherServicesWebsite, otherServicesSocialMedia,
dob, gender, languages,
ethnicity, typeOfLicense,
height, weight, hairColor, eyeColor, pantSize, shoeSize, tshirtSize, desiredHourlyRate, desiredWeeklyRate, piercings, tattoos,
chestSize, waistSize, hipsSize, dressSize,
typeCorporated, ssn, ein, businessName, citiesWillingToWork, travel, professionalInsurance,
directDepositDesired, DirectDepositRoutingNumber, DirectDepositAccountNumber,
isModel, isBrandAmbassador, isFlyerDistributor, isFieldMarketingManager, isDancer, iswaiterOrWaitress, isProductionAssistant, isSalesExecutive;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    if(!self.agreeTermsSwitch.on)
    {
        [self showAlert:@"Registration Field" withMessage:@"Please" and:@"Okay"];
    }

    return 1;
}//eom

- (IBAction)agreeTermsValueChanged:(id)sender {
    
    if(self.agreeTermsSwitch.on)
    {
        //since user to terms, display 'submit registration' button
        self.submitButton.hidden = NO;
    }
    else
    {
        self.submitButton.hidden = YES;
    }
    
}//eo-action

- (IBAction)submitForm:(id)sender
{
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
//        [self performSegueWithIdentifier:@"registeredStaff" sender:self];
//        LogInViewController *logInView = [[UIStoryboard storyboardWithName:@"Main.storyboard" bundle:nil] instantiateViewControllerWithIdentifier:@"logInView"];
//        
//         [self.navigationController pushViewController:logInView animated:YES];
    }
    else
    {
        NSLog(@"missing some/all required fields");
    }
}//eo-action

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
