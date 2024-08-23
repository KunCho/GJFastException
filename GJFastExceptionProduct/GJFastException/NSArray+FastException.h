//
//  NSArray+FastException.h
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (FastException)
- (id)fastObjectAtIndex:(NSUInteger)index;
+ (instancetype)fastArrayWithObjects:(const id[])objects count:(NSUInteger)cnt;
@end


@interface NSMutableArray (FastException)
- (id)fastObjectAtIndex:(NSUInteger)index;
- (void)fastAddObject:(id)anObject;
- (void)fastInsertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)fastRemoveObjectAtIndex:(NSUInteger)index;
- (void)fastReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
@end
