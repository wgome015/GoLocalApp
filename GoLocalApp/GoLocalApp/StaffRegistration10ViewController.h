//
//  StaffRegistration10ViewController.h
//  GoLocalApp
//
//  Created by Luis Andres Castillo Hernandez on 9/7/15.
//  Copyright (c) 2015 FIU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffRegistration10ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *chestSize;
@property (weak, nonatomic) IBOutlet UITextField *waistSize;
@property (weak, nonatomic) IBOutlet UITextField *hipsSize;
@property (weak, nonatomic) IBOutlet UITextField *dressSize;

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

@property (nonatomic)  NSString *height;                        //view controller 9
@property (nonatomic)  NSString *weight;
@property (nonatomic)  NSString *hairColor;
@property (nonatomic)  NSString *eyeColor;
@property (nonatomic)  NSString *pantSize;
@property (nonatomic)  NSString *shoeSize;
@property (nonatomic)  NSString *tshirtSize;
@property (nonatomic)  NSString *desiredHourlyRate;
@property (nonatomic)  NSString *desiredWeeklyRate;
@property (nonatomic)  bool tattoos;  //0 - no | 1 - yes
@property (nonatomic)  bool piercings;//0 - no | 1 - yes


@end
