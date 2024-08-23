//
//  NSDictionary+FastException.h
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (FastException)
+ (instancetype)FastDictionaryWithObjects:(const id[])objects forKeys:(const id<NSCopying>[])keys count:(NSUInteger)cnt;
@end


@interface NSMutableDictionary (FastException)
- (void)fastSetObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (void)fastRemoveObjectForKey:(id)aKey;
@end
