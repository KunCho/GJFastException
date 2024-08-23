//
//  NSCache+FastException.h
//
//  Created by allen  on 15/7/2016.
//  Copyright © 2016 Taobao lnc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSCache (FastException)
- (void)fastSetObject:(id)obj forKey:(id)key; // 0 cost
- (void)fastSetObject:(id)obj forKey:(id)key cost:(NSUInteger)cost;
@end
