//
//  NSObject+FastSwizzle.h
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (FastSwizzle)
+ (BOOL)fastSwizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError **)error_;
+ (BOOL)fastSwizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError **)error_;
@end


@interface NSObject (KVCProtection)
@end
