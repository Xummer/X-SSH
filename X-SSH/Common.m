//
//  Common.m
//  X-SSH
//
//  Created by Xummer on 13-9-9.
//  Copyright (c) 2013年 Xummer. All rights reserved.
//

#import "Common.h"
#import <ifaddrs.h>
#import <arpa/inet.h>

@implementation Common

+ (NSString *)getIPAddress
{
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    NSString *wifiAddress = nil;
    NSString *cellAddress = nil;
    
    // retrieve the current interfaces - returns 0 on success
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            sa_family_t sa_type = temp_addr->ifa_addr->sa_family;
            if(sa_type == AF_INET || sa_type == AF_INET6) {
                NSString *name =
                 [NSString stringWithUTF8String:temp_addr->ifa_name];
                
                NSString *addr =
                 [NSString stringWithUTF8String:
                  inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)
                 ]; // pdp_ip0
                
                NSLog(@"NAME: \"%@\" addr: %@", name, addr); // see for yourself
                
                if([name isEqualToString:@"en0"]) {
                    // Interface is the wifi connection on the iPhone
                    wifiAddress = addr;
                } else
                    if([name isEqualToString:@"pdp_ip0"]) {
                        // Interface is the cell connection on the iPhone
                        cellAddress = addr;
                    }
            }
            temp_addr = temp_addr->ifa_next;
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    NSString *addr = wifiAddress ? wifiAddress : cellAddress;
    return addr ? addr : @"0.0.0.0";
}

+ (void)setIdleTimeDisabled:(BOOL)disabled {
    [[UIApplication sharedApplication] setIdleTimerDisabled:disabled];
}

+ (BOOL)getIdleTimeDisabled {
    return [UIApplication sharedApplication].idleTimerDisabled;
}

@end
