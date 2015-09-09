//
//  StaffRegistration8ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration8ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UISwitch *driverLicense;
@property (weak, nonatomic) IBOutlet UISwitch *commercialLicense;
@property (nonatomic)  bool typeOfLicense;


@property (nonatomic, strong) NSArray *ethnicitiesOptions;    //array to hold ethnicities
@property (weak, nonatomic) IBOutlet UIPickerView *ethnicityPicker;
@property (nonatomic)  int ethnicity;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


- (IBAction)submitForm:(id)sender;

- (IBAction)driverLicenseChanged:(id)sender;
- (IBAction)commercialLicenseChanged:(id)sender;


//PASSED VALUEs FROM PREVIOUS CONTROLLER
@property (nonatomic)  NSString *firstName;                     //view controller 1
@property (nonatomic)  NSString *middleName;
@property (nonatomic)  NSString *lastName;
@property (nonatomic)  NSString *nickName;
@property (nonatomic)  NSString *email;
@property (nonatomic)  NSString *password;
@property (nonatomic)  NSString *cellphone;

@property (nonatomic)  NSString *address;                       //view controller 2
@property (nonatomic)  NSString *city;
@property (nonatomic)  NSString *zipcode;
@property (nonatomic)  NSString *stateSelected;

@property (nonatomic)  NSString *dob;                           //view controller 7
@property (nonatomic)  bool gender;// 0-female 1-male
@property (nonatomic)  NSString *languages;


@end
