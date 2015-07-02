//
//  ViewController.m
//  Lession2
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
    
    
    //NSThread 方式的延时执行操作
    [self performSelector:@selector(threadEvent:) withObject:self afterDelay:2];
    //gcd方式
    [GCDQueue executeInMainQueue:^{
          NSLog(@"GCD线程事件");
    } afterDelaySecs:2.f];
              
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)threadEvent:(id)event
{
    NSLog(@"线程事件");

}
@end
