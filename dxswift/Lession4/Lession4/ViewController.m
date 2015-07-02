//
//  ViewController.m
//  Lession4
//
//  Created by Mac mini  on 15/6/27.
//  Copyright (c) 2015年 中交虹桥. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"
@interface ViewController ()
@property (nonatomic,strong)GCDTimer *gcdTimer;
@property (nonatomic,strong)NSTimer *nsTimer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //GCD定时器
    
    [self runGCDTimer];
    
    
}

-(void)runGCDTimer{
  //初始化定时器
    self.gcdTimer = [[GCDTimer alloc]initInQueue:[GCDQueue mainQueue]];
    
    
    //指定时间间隔和执行事件
    
    
    [self.gcdTimer event:^{
        NSLog(@"GCD定时器");
    } timeInterval:1];
    
    [self.gcdTimer start];

}

-(void)runNSTimer
{


}

@end
