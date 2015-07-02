//
//  ViewController.m
//  Lession5
//
//  Created by Mac mini  on 15/6/27.
//  Copyright (c) 2015年 中交虹桥. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //创建信号量
    GCDSemaphore *semphore = [[GCDSemaphore alloc]init];
    
    //发送信号
    
    

    
    //等待信号
  
    
    //线程1  - 异步
    [GCDQueue executeInGlobalQueue:^{
        NSLog(@"xiancheng1");
            [semphore signal];
    }];
    
    //线程2  - 异步
    [GCDQueue executeInGlobalQueue:^{
        
          [semphore wait];
        NSLog(@"xiancheng2");
    }];
    
    
    //必须线程1先执行完,然后在执行完线程2
    
    
    
}

@end
