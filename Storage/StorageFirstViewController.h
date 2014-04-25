//
//  StorageFirstViewController.h
//  Storage
//
//  Created by Vignesh Venkatasubramanian on 4/23/14.
//  Copyright (c) 2014 CMPE277. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StorageFirstViewController : UIViewController
- (IBAction)save:(id)sender;
- (IBAction)load:(id)sender;
- (IBAction)textFieldReturn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *cardNumber;
@property (nonatomic, retain) NSFileManager *fileMgr;

@property (nonatomic, retain) NSArray *paths;

@property (nonatomic, retain) NSString *documentsDirectory;
- (IBAction)clear:(id)sender;

@property (nonatomic, retain) NSString *file;
@end
