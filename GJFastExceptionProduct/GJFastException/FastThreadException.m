//
//  FastThreadException.m
//
//  Created by allen  on 19/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//


#import "FastThreadException.h"
@interface FastThreadException ()
@property (nonatomic, copy) CallStackBlock callStack;
@end
@implementation FastThreadException

+ (instancetype)shareInstance {
    static FastThreadException *_instance;

    static dispatch_once_t once;

    dispatch_once(&once, ^(void) {

        _instance = [FastThreadException new];

    });

    return _instance;
}

- (void)saveExceptionThreadFrameWtihReason:(NSString *)reason {
    NSArray *arrayThread = [NSThread callStackSymbols];
    if (arrayThread) {
        if (self.callStack) {
            self.callStack(arrayThread,reason);
        }
    }
}

- (void)callBackThread:(CallStackBlock)threadArray {
    self.callStack = threadArray;
}
@end
