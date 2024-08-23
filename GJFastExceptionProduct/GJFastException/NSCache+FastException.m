//
//  NSCache+FastException.m
//  AKClient4IOS-Base-AppCore
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import "NSCache+FastException.h"
#import "FastThreadException.h"


@implementation NSCache (FastException)
- (void)fastSetObject:(id)obj forKey:(id)key {
    if (obj && key) {
        [self fastSetObject:obj forKey:key];
    } else {
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"NSCache setobject is nil"];
    }
}

- (void)fastSetObject:(id)obj forKey:(id)key cost:(NSUInteger)cost {
    if (obj && key) {
        [self fastSetObject:obj forKey:key cost:cost];
    } else {
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"NSCache setobject of key is nil"];
    }
}


@end
