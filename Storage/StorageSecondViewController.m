//
//  StorageSecondViewController.m
//  Storage
//
//  Created by Vignesh Venkatasubramanian on 4/23/14.
//  Copyright (c) 2014 CMPE277. All rights reserved.
//

#import "StorageSecondViewController.h"

@interface StorageSecondViewController ()

@end

@implementation StorageSecondViewController
@synthesize activity,name;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Archive:(id)sender {
    NSLog(@"Archive");
    NSMutableDictionary *rootObject;
    rootObject = [NSMutableDictionary dictionary];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    
    [rootObject setValue:activity.text forKey:@"activity"];
    [rootObject setValue:name.text forKey:@"name"];
    
    [NSKeyedArchiver archiveRootObject:rootObject toFile:filePath];
}
- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)unArchive:(id)sender {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSDictionary *savedData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        if ([savedData valueForKey:@"activity"]) {
            activity.text = [savedData valueForKey:@"activity"];
            name.text = [savedData valueForKey:@"name"];
        }
    }
}
@end
