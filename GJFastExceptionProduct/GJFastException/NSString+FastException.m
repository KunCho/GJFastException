//
//  NSString+FastException.m
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import "NSString+FastException.h"
#import "FastThreadException.h"


@implementation NSString (FastException)
- (NSString *)fastSubstringWithRange:(NSRange)range {
    if (self.length == 0) {
        return @"";
    }

    NSUInteger safeLocal = range.location;
    if (safeLocal > self.length - 1) {
        safeLocal = self.length - 1;
        NSUInteger length = range.length;
        range = NSMakeRange(safeLocal, 1);
        if (length != 0) {
            [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"字符串NSMakeRange出错"];
        }
    } else {
        NSUInteger safeLength = range.length;
        if (safeLength > self.length - range.location) {
            safeLength = self.length - range.location;
            range = NSMakeRange(safeLocal, safeLength);
            [[FastThreadException shareInstance] saveExceptionThreadFrameWtihReason:@"字符串NSMakeRange出错"];
        }
    }
    return [self fastSubstringWithRange:range];
}

- (NSString *)fastSubstringToIndex:(NSUInteger)to {
    NSUInteger safeTo = to;
    if (safeTo > self.length) {
        safeTo = self.length;
    }
    return [self fastSubstringToIndex:safeTo];
}
- (NSString *)fastSubstringFromIndex:(NSUInteger)from {
    NSUInteger safeFrom = from;
    if (safeFrom > self.length) {
        safeFrom = self.length;
    }
    return [self fastSubstringFromIndex:safeFrom];
}

@end
