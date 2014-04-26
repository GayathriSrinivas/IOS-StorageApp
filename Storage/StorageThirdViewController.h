//
//  StorageThirdViewController.h
//  Storage
//
//  Created by Vignesh Venkatasubramanian on 4/24/14.
//  Copyright (c) 2014 CMPE277. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface StorageThirdViewController : UIViewController
@property (nonatomic) sqlite3 *contactDB;
@property (strong, nonatomic) NSString *databasePath;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *status;
- (IBAction)saveData:(id)sender;
- (IBAction)findContact:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
@end
