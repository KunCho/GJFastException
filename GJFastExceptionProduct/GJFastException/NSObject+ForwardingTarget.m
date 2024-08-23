//
//  NSObject+ForwardingTarget.m
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import "NSObject+ForwardingTarget.h"
#import "FastSmartFunction.h"
#import "FastThreadException.h"


@implementation NSObject (ForwardingTarget)
- (id)fastForwardingTargetForSelector:(SEL)aSelector {
    BOOL bResponse = [self respondsToSelector:aSelector];
    NSMethodSignature *signatrue = [self methodSignatureForSelector:aSelector];
    if (bResponse || signatrue) {
        return [self fastForwardingTargetForSelector:aSelector];
    } else {
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"消息转发没有找到对象"];
        FastSmartFunction *func = [[FastSmartFunction alloc] init];
        [func addFunction:aSelector];
        return func;
    }
}
@end
