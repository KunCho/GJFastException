//
//  NSString+FastException.h
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (FastException)
- (NSString *)fastSubstringWithRange:(NSRange)range;
- (NSString *)fastSubstringToIndex:(NSUInteger)to;
- (NSString *)fastSubstringFromIndex:(NSUInteger)from;
@end
