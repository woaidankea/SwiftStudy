//
//  ViewController.m
//  Lession3
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
    
    //等待线程1与线程2 执行完了之后再去执行线程3
    //线程1
    [GCDQueue executeInGlobalQueue:^{
        
    }];
    //线程2
    [GCDQueue executeInGlobalQueue:^{
        
    }];
    //线程3
    [GCDQueue executeInGlobalQueue:^{
        
    }];
    
    
    
    //初始化线程组合
    GCDGroup *group = [[GCDGroup alloc]init];
    
    
    //创建一个线程队列
    GCDQueue *queue = [[GCDQueue alloc]initConcurrent];
    
    //让线程在group中执行(线程1)
    
    [queue execute:^{
        NSLog(@"线程1 执行完毕");
    } inGroup:group];
    
    
    [queue execute:^{
        NSLog(@"线程2 执行完毕");
    } inGroup:group];
    
    [queue notify:^{
        NSLog(@"线程3 执行完毕");
    } inGroup:group];
    
    
   
       //
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
