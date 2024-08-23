//
//  FastSmartFunction.m

//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import "FastSmartFunction.h"
#import <objc/runtime.h>
static void *smartFunc(id sel, SEL fun, ...) {
    return NULL;
}


@implementation FastSmartFunction
- (BOOL)addFunction:(SEL)sel {
    return class_addMethod([FastSmartFunction class], sel, (IMP)smartFunc, "");
}
@end
