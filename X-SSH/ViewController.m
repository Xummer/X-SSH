//
//  ViewController.m
//  X-SSH
//
//  Created by Xummer on 13-9-9.
//  Copyright (c) 2013年 Xummer. All rights reserved.
//

#import "ViewController.h"
#import "Common.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [self refreshIp];
    
    [_screenSleepSwitch setOn:[Common getIdleTimeDisabled]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)refreshButtonPressed:(id)sender {
    [self refreshIp];
}

- (IBAction)sleepSwitchChange:(UISwitch *)sender {
    [Common setIdleTimeDisabled:sender.on];
}

- (void)refreshIp {
    NSString *ipStr =
    [NSString stringWithFormat:@"ip: %@", [Common getIPAddress]];
    [_iplabel setText:ipStr];
}

@end
