//
//  StaffRegistration9ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration9ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *height;
@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *hairColor;
@property (weak, nonatomic) IBOutlet UITextField *eyeColor;
@property (weak, nonatomic) IBOutlet UITextField *pantSize;
@property (weak, nonatomic) IBOutlet UITextField *shoeSize;
@property (weak, nonatomic) IBOutlet UITextField *tshirtSize;
@property (weak, nonatomic) IBOutlet UITextField *desiredHourlyRate;
@property (weak, nonatomic) IBOutlet UITextField *desiredWeeklyRate;

@property (weak, nonatomic) IBOutlet UISwitch *hasTattoos;
@property (nonatomic)  bool tattoos;

@property (nonatomic)  bool piercings;
@property (weak, nonatomic) IBOutlet UISwitch *hasPiercings;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


- (IBAction)submitForm:(id)sender;

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

@property (nonatomic)  int ethnicity;                           //view controller 8
@property (nonatomic)  bool typeOfLicense;//0-driver 1-commercial


@end
