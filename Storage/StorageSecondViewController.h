//
//  StorageSecondViewController.h
//  Storage
//
//  Created by Vignesh Venkatasubramanian on 4/23/14.
//  Copyright (c) 2014 CMPE277. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StorageSecondViewController : UIViewController
- (IBAction)Archive:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *activity;
- (IBAction)textFieldReturn:(id)sender;
- (IBAction)unArchive:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *name;

@end
