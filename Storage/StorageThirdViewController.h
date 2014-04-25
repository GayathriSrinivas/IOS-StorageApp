//
//  StorageThirdViewController.h
//  Storage
//
//  Created by Vignesh Venkatasubramanian on 4/24/14.
//  Copyright (c) 2014 CMPE277. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StorageThirdViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *phone;
- (IBAction)saveData:(id)sender;
- (IBAction)findContact:(id)sender;
@end
