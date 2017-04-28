//
//  SDViewController.m
//  Blabber
//
//  Created by francescoceravolo on 04/28/2017.
//  Copyright (c) 2017 francescoceravolo. All rights reserved.
//

#import "SDViewController.h"
#import <Blabber/SDLogger.h>

@interface SDViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@end

@implementation SDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [[SDLogger sharedLogger] setup];
    
}

- (IBAction)segmentControlValueChanged:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
            [[SDLogger sharedLogger] setGenericLogLevel:SDLogLevelVerbose];
            break;
        case 1:
            [[SDLogger sharedLogger] setGenericLogLevel:SDLogLevelInfo];
            break;
        case 2:
            [[SDLogger sharedLogger] setGenericLogLevel:SDLogLevelWarning];
            break;
        case 3:
            [[SDLogger sharedLogger] setGenericLogLevel:SDLogLevelError];
            break;
            
            
        default:
            break;
    }
}


- (IBAction)logVerbose:(UIButton *)sender
{
    SDLogVerbose(@"This is a verbose message");
}

- (IBAction)logInfo:(UIButton *)sender
{
    SDLogInfo(@"This is an info message");
}

- (IBAction)logWarning:(UIButton *)sender
{
    SDLogWarning(@"This is a warning message");
}

- (IBAction)logError:(UIButton *)sender
{
    SDLogError(@"This is an error message");
}
@end
