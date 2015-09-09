//
//  StaffRegistration12ViewController.m
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import "StaffRegistration12ViewController.h"
#import "StaffRegistration13ViewController.h"

@interface StaffRegistration12ViewController ()

@end

@implementation StaffRegistration12ViewController

@synthesize typeCorporated, ssn, ein, businessName, citiesWillingToWork, travel, professionalInsurance, scrollView,
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
    
    /* in the event is run no camera */
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
         [self showAlert:@"Error" withMessage:@"Device has no camera" and:@"OK"];
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


/* verifying the required input fileds */
- (BOOL)verifyDataEnter
{
    
    NSLog(@"Image needs to be checked");
    
    return 1;
}


- (IBAction)submitForm:(id)sender
{
    //verifying the data enter
    bool result = [self verifyDataEnter];
    if(result)
    {
        [self performSegueWithIdentifier:@"staffRegistration13" sender:self];
    }
    else
    {
        NSLog(@"missing some/all required fields");
    }

}

/* preparing the data to sent to the next view controller */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"staffRegistration13"]){
        StaffRegistration13ViewController *controller = (StaffRegistration13ViewController *)segue.destinationViewController;
        
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
        
        controller.typeCorporated           = self.typeCorporated; //0-not incorporated | 1-corporated  //view controller 12
        controller.ssn                      = self.ssn;
        controller.ein                      = self.ein;
        controller.businessName             = self.businessName;
        controller.citiesWillingToWork      = self.citiesWillingToWork;
        controller.travel                   = self.travel; // 0 - not traveling | 1 - traveling
        controller.professionalInsurance    = self.professionalInsurance; // 0 - not prof insurance | 1 - prof insurance
        
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
/********* photo functions ******/

- (IBAction)takePhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];

}//eo-action


- (IBAction)selectExistingPhoto:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}//eo-action

#pragma mark - Image Picker Controller delegate methods
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.headshotImageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
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
