//
//  FastExceptionCatch.m
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import "FastExceptionCatch.h"
#import "NSString+FastException.h"
#import "NSArray+FastException.h"
#import "NSDictionary+FastException.h"
#import "NSCache+FastException.h"
#import "NSObject+ForwardingTarget.h"
#import "NSObject+FastSwizzle.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>
#import <dlfcn.h>
//#import "fishhook.h"

/*
static void  (*orig_free)(void*);

void save_original_symbols() {
    orig_free = dlsym(RTLD_DEFAULT, "free");
}

void safe_free(void* p){
    size_t memsize = malloc_size(p);
    memset(p, 0x00, memsize);
    orig_free(p);
}
*/


@implementation FastExceptionCatch
+ (instancetype)shareInstance {
    static FastExceptionCatch *_instance;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) {
        _instance = [FastExceptionCatch new];

    });
    return _instance;
}

- (void)exceptionOCFunction {
    // 不可变空数组 __Array0
    // 不可变单一元素数组 __NSSingleObjectArrayI
    // 不可变多元素数组 __ArrayI
    // 针对objectAtIndex数组越界需要保护 __NSSingleObjectArrayI 和 __ArrayI
    NSArray *arr0 = [NSArray array];
    NSArray *singleArr = @[ @"1" ];
    NSArray *arrI = @[ @"1", @"2" ];
    NSMutableArray *mutableArr = [NSMutableArray array];
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionary];
    NSString *stringc = [NSString new];
    NSObject *obj = [[NSObject alloc] init];

    Class tmpObj = objc_getClass(NSStringFromClass([obj class]).UTF8String);
    Class tmp0 = objc_getClass(NSStringFromClass([arr0 class]).UTF8String);
    Class tmpSingle = objc_getClass(NSStringFromClass([singleArr class]).UTF8String);
    Class tmpI = objc_getClass(NSStringFromClass([arrI class]).UTF8String);
    Class tmpM = objc_getClass(NSStringFromClass([mutableArr class]).UTF8String);
    Class tmpDM = objc_getClass(NSStringFromClass([mutableDic class]).UTF8String);
    Class tmpCFS = objc_getClass(NSStringFromClass([stringc class]).UTF8String);

    // 未知方法调用保护
    [[NSObject class] fastSwizzleClassMethod:@selector(forwardingTargetForSelector:)
                             withClassMethod:@selector(fastForwardingTargetForSelector:)
                                       error:nil];

    [tmpObj fastSwizzleMethod:@selector(forwardingTargetForSelector:)
                   withMethod:@selector(fastForwardingTargetForSelector:)
                        error:nil];

    // 数组保护
    [[NSArray class] fastSwizzleClassMethod:@selector(arrayWithObjects:count:)
                            withClassMethod:@selector(fastArrayWithObjects:count:)
                                      error:nil];
    [tmp0 fastSwizzleMethod:@selector(objectAtIndex:)
                 withMethod:@selector(fastObjectAtIndex:)
                      error:nil];
    [tmpSingle fastSwizzleMethod:@selector(objectAtIndex:)
                      withMethod:@selector(fastObjectAtIndex:)
                           error:nil];
    [tmpI fastSwizzleMethod:@selector(objectAtIndex:)
                 withMethod:@selector(fastObjectAtIndex:)
                      error:nil];

    [tmpM fastSwizzleMethod:@selector(objectAtIndex:)
                 withMethod:@selector(fastObjectAtIndex:)
                      error:nil];
    [tmpM fastSwizzleMethod:@selector(addObject:)
                 withMethod:@selector(fastAddObject:)
                      error:nil];
    [tmpM fastSwizzleMethod:@selector(insertObject:atIndex:)
                 withMethod:@selector(fastInsertObject:atIndex:)
                      error:nil];
    [tmpM fastSwizzleMethod:@selector(replaceObjectAtIndex:withObject:)
                 withMethod:@selector(fastReplaceObjectAtIndex:withObject:)
                      error:nil];
    [tmpM fastSwizzleMethod:@selector(removeObjectAtIndex:)
                 withMethod:@selector(fastRemoveObjectAtIndex:)
                      error:nil];

    // 字典保护
    [[NSDictionary class] fastSwizzleClassMethod:@selector(dictionaryWithObjects:forKeys:count:)
                                 withClassMethod:@selector(FastDictionaryWithObjects:forKeys:count:)
                                           error:nil];

    [tmpDM fastSwizzleMethod:@selector(setObject:forKey:)
                  withMethod:@selector(fastSetObject:forKey:)
                       error:nil];
    [tmpDM fastSwizzleMethod:@selector(removeObjectForKey:)
                  withMethod:@selector(fastRemoveObjectForKey:)
                       error:nil];

    // 字符串保护
    [tmpCFS fastSwizzleMethod:@selector(substringWithRange:)
                   withMethod:@selector(fastSubstringWithRange:)
                        error:nil];
    [tmpCFS fastSwizzleMethod:@selector(substringToIndex:)
                   withMethod:@selector(fastSubstringToIndex:)
                        error:nil];
    [tmpCFS fastSwizzleMethod:@selector(substringFromIndex:)
                   withMethod:@selector(fastSubstringFromIndex:)
                        error:nil];

    // NSCache保护
    [[NSCache class] fastSwizzleMethod:@selector(setObject:forKey:)
                            withMethod:@selector(fastSetObject:forKey:)
                                 error:nil];
    [[NSCache class] fastSwizzleMethod:@selector(setObject:forKey:cost:)
                            withMethod:@selector(fastSetObject:forKey:cost:)
                                 error:nil];
}

/*
-(void)exceptionCFunction{
    save_original_symbols();
    rcd_rebind_symbols((struct rcd_rebinding[1]){{"free", safe_free}}, 1);
}
*/

@end
