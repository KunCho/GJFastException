//
//  ViewController.m
//  GJFastExceptionProduct
//
//  Created by lsr on 2020/1/10.
//  Copyright © 2020 GJNativeTeam. All rights reserved.
//

#import "ViewController.h"
#import "FastExceptionCatch.h"
#import "FastThreadException.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Appdelegate 初始化
    [[FastExceptionCatch shareInstance] exceptionOCFunction];
    
    [[FastThreadException shareInstance] callBackThread:^(NSArray *array,  NSString *reason) {
        
    }];
    
}


@end
