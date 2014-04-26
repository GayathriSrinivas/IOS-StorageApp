//
//  StorageThirdViewController.m
//  Storage
//
//  Created by Vignesh Venkatasubramanian on 4/24/14.
//  Copyright (c) 2014 CMPE277. All rights reserved.
//

#import "StorageThirdViewController.h"

@interface StorageThirdViewController ()

@end

@implementation StorageThirdViewController

@synthesize databasePath,contactDB;
@synthesize name,phone,address,status;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSString * docsDir;
    NSArray * dirPaths;
    
    //Get array of the paths
   dirPaths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    
    //Get Document Directory Path
    docsDir = dirPaths[0];
    
    //Create file name with qualified path of the file
    self.databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"contacts.db"]];
    
    NSLog(self.databasePath);
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    if([fileMgr fileExistsAtPath:self.databasePath] == NO){
        
        const char *dbpath = [self.databasePath UTF8String];
        
        if(sqlite3_open(dbpath,&contactDB ) == SQLITE_OK){
            
            char *errMsg;
            
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT , ADDRESS TEXT , PHONE TEXT )";
            
            if( sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg))
            {
                    status.text = @"FAILED TO CREATE TABLE";
            }
            sqlite3_close(contactDB);
        }else{
            status.text = @"FAILED TO OPEN/CREATE TABLE";
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveData:(id)sender {
    
    const char *dbpath = [self.databasePath UTF8String];
    
    sqlite3_stmt *statement ;
    
    if(sqlite3_open(dbpath, &contactDB) == SQLITE_OK){
        
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO CONTACTS(name,address,phone) VALUES (\"%@\",\"%@\",\"%@\")",name.text,address.text,phone.text];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(contactDB, insert_stmt, -1, &statement, NULL);
        
        if(sqlite3_step(statement) == SQLITE_DONE){
            
            status.text = @"CONTACT ADDED";
            name.text = @" ";
            address.text = @" ";
            phone.text = @" ";
        }else{
            status.text = @"FAILED TO ADD CONTACT";
        }
        sqlite3_finalize(statement);
        sqlite3_close(contactDB);
    }
}

- (IBAction)findContact:(id)sender {
    const char *dbpath = [self.databasePath UTF8String];
    
    sqlite3_stmt *statement ;
    
    if(sqlite3_open(dbpath, &contactDB) == SQLITE_OK){
        
        NSString *insertSQL = [NSString stringWithFormat:@"SELECT address, phone FROM CONTACTS where name=\"%@\"",name.text];
        
        const char *query_stmt = [insertSQL UTF8String];
    
        NSLog(@"%@", insertSQL);
        if(sqlite3_prepare_v2(contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK){
            
            if(sqlite3_step(statement) == SQLITE_ROW){
                NSString *addressField = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
                address.text = addressField;
                NSString *phoneField =  [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                phone.text = phoneField;
 
                status.text = @"MATCH FOUND";
            }else{
                status.text = @"MATCH NOT FOUND";
                address.text = @" ";
                phone.text = @" ";
            }
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(contactDB);
    }

}

- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
}
@end
