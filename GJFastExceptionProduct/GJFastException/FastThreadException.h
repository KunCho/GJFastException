//
//  FastThreadException.h
//
//  Created by allen  on 19/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CallStackBlock)(NSArray *array, NSString *reason);
@interface FastThreadException : NSObject
+ (instancetype)shareInstance;
- (void)saveExceptionThreadFrameWtihReason:(NSString *)reason;
- (void)callBackThread:(CallStackBlock)threadArray;
@end
