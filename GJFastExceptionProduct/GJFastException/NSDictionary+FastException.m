//
//  NSDictionary+FastException.m
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import "NSDictionary+FastException.h"
#import "FastThreadException.h"


@implementation NSDictionary (FastException)

+ (instancetype)FastDictionaryWithObjects:(const id[])objects forKeys:(const id<NSCopying>[])keys count:(NSUInteger)cnt {
    for (NSInteger i = 0; i < cnt; i++) {
        id tmpkey = keys[i];
        id tmpitem = objects[i];
        if (tmpitem == nil || tmpkey == nil) {
            [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"NSDictionary value is nil"];
            return nil;
        }
    }

    return [self FastDictionaryWithObjects:objects forKeys:keys count:cnt];
}

@end


@implementation NSMutableDictionary (AKException)

- (void)fastSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (anObject && aKey) {
        [self fastSetObject:anObject forKey:aKey];
    } else {
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"NSMutableDictionary value is nil"];
    }
}

- (void)fastRemoveObjectForKey:(id)aKey {
    if (aKey) {
        [self fastRemoveObjectForKey:aKey];
    } else {
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"NSMutableDictionary remove is nil"];
    }
}

@end
