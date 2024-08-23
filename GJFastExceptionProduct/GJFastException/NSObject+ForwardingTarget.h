//
//  NSObject+ForwardingTarget.h
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (ForwardingTarget)
- (id)fastForwardingTargetForSelector:(SEL)aSelector;
@end
