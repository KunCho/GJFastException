//
//  FastExceptionCatch.h
//
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface FastExceptionCatch : NSObject
+ (instancetype)shareInstance;
- (void)exceptionOCFunction;

@end
