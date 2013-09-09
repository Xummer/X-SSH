//
//  Common.h
//  X-SSH
//
//  Created by Xummer on 13-9-9.
//  Copyright (c) 2013年 Xummer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

+ (NSString *)getIPAddress;

+ (void)setIdleTimeDisabled:(BOOL)disabled;
+ (BOOL)getIdleTimeDisabled;

@end
