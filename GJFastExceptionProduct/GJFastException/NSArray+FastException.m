//
//  NSArray+FastException.m
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import "NSArray+FastException.h"
#import "FastSmartFunction.h"
#import "FastThreadException.h"


@implementation NSArray (FastException)
- (id)fastObjectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"数据越界"];
        return nil;
    } else {
        if (index > self.count - 1) {
            index = self.count - 1;
        }

        return [self fastObjectAtIndex:index];
    }
}


+ (instancetype)fastArrayWithObjects:(const id[])objects count:(NSUInteger)cnt {
    for (NSInteger i = 0; i < cnt; i++) {
        id itemId = objects[i];

        if (itemId == nil) {
            [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"数组内容为空"];
            return nil;
        }
    }
    return [self fastArrayWithObjects:objects count:cnt];
}

@end


@implementation NSMutableArray (FastException)
- (id)fastObjectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        FastSmartFunction *fun = [[FastSmartFunction alloc] init];
        [self addObject:fun];
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"数组越界"];
    } else {
        if (index > self.count - 1) {
            index = self.count - 1;
        }
    }
    return [self fastObjectAtIndex:index];
}

- (void)fastAddObject:(id)anObject {
    if (anObject) {
        [self fastAddObject:anObject];
    } else {
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"数组添加数据越界"];
    }
}

- (void)fastInsertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject) {
        [self fastInsertObject:anObject atIndex:index];
    } else {
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"数组插入数据越界"];
    }
}

- (void)fastRemoveObjectAtIndex:(NSUInteger)index {
    if (self.count > 0 && index <= self.count - 1) {
        [self fastRemoveObjectAtIndex:index];
    } else {
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"数组删除数据越界"];
    }
}

- (void)fastReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (index > self.count - 1) {
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"数组替换数据越界"];
        return;
    }

    if (anObject == nil) {
        [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"数组替换数据越界"];
        return;
    }
    [self fastReplaceObjectAtIndex:index withObject:anObject];
}

@end
