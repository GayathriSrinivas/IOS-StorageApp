//
//  StorageFirstViewController.m
//  Storage
//
//  Created by Vignesh Venkatasubramanian on 4/23/14.
//  Copyright (c) 2014 CMPE277. All rights reserved.
//

#import "StorageFirstViewController.h"

@interface StorageFirstViewController ()

@end

@implementation StorageFirstViewController
@synthesize cardNumber;
@synthesize file,fileMgr,paths,documentsDirectory;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Create the fileManager
    fileMgr = [NSFileManager defaultManager];
    
    //Get array of the paths
    self.paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    
    //Get Document Directory Path
    self.documentsDirectory = paths[0];
    
    //Create file name with qualified path of the file
    self.file = [documentsDirectory stringByAppendingPathComponent:@"s4.txt"];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    NSLog(@"Save");
    
    NSString *card = cardNumber.text;
	
	// create the string used to populate the file
	NSMutableString *string1 = [[NSMutableString alloc] init];
    
	[string1 appendString:cardNumber.text];
    
	// check to see if file already exists in documents directory
	if([self.fileMgr fileExistsAtPath:self.file])
	{
		NSLog(@"File already exists");
        
	}
	else
	{
		NSLog(@"file does not exist.. Creating File");
		// file does not already exist so create it
		[self.fileMgr createFileAtPath:file contents:nil attributes:nil];
    }
    [string1 writeToFile:self.file atomically:NO encoding:NSStringEncodingConversionAllowLossy error:nil];
    
}

- (IBAction)load:(id)sender {
     NSLog(@"Load");
	
	//Test whether this file exists before we read it
	if([self.fileMgr fileExistsAtPath:self.file])
	{
		NSLog(@"File exists we can now try to read it");
		
		NSString *content = [[NSString alloc] initWithContentsOfFile:self.file usedEncoding:nil error:nil];
        //		[webView loadHTMLString:content baseURL:nil];
        cardNumber.text = content;
        
	}
	else
	{
		NSLog(@"File does not exist no need trying to read it");
	}
}

- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)clear:(id)sender {
    cardNumber.text = @" ";
}
@end
