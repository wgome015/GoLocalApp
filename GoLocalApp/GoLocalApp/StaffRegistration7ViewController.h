//
//  StaffRegistration7ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration7ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>


@property (weak, nonatomic) IBOutlet UIDatePicker *dob;
@property (nonatomic)  NSString *dateOfBirth;

@property (nonatomic)  bool gender;
@property (weak, nonatomic) IBOutlet UISwitch *maleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *femaleSwitch;

@property (nonatomic)  NSString *languages;
@property (weak, nonatomic) IBOutlet UITextField *firstLanguage;
@property (weak, nonatomic) IBOutlet UITextField *secondLanguage;
@property (weak, nonatomic) IBOutlet UITextField *addtLanguage;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


- (IBAction)submitForm:(id)sender;
- (IBAction)datePickerValueChanged:(id)sender;
- (IBAction)maleSwitchChanged:(id)sender;
- (IBAction)femaleSwitchChanged:(id)sender;

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

@end
