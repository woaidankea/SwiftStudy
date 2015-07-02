//
//  ViewController.m
//  Lession1
//
//  Created by Mac mini  on 15/6/27.
//  Copyright (c) 2015年 中交虹桥. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"
@interface ViewController ()
@property (nonatomic,strong)UIImage *image;
@property (nonatomic,strong)UIImageView *imageview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self serailQueue];
 //   [self initConcurrent];
   
    self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.imageview.center = self.view.center;
//    self.imageview.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageview];
    
    
  
    [GCDQueue executeInGlobalQueue:^{
        //处理业务逻辑
        NSString *neturl = @"http://pic.cnitblog.com/avatar/607542/20140226182241.png";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:neturl]];
        NSData *picdata =  [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        self.image = [UIImage imageWithData:picdata];
        
        [GCDQueue executeInMainQueue:^{
            //更新ui
            self.imageview.image = self.image;
        }];
    }];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//创建并发队列

-(void)initConcurrent{
    
    GCDQueue *queue =[[GCDQueue alloc]initConcurrent];
    //执行队列中的线程
    [queue execute:^{
        NSLog(@"1");
        
    }];
    //执行队列中的线程
    [queue execute:^{
        NSLog(@"2");
        
    }];
    //执行队列中的线程
    [queue execute:^{
        NSLog(@"3");
        
    }];
    //执行队列中的线程
    [queue execute:^{
        NSLog(@"4");
        
    }];
    //执行队列中的线程
    [queue execute:^{
        NSLog(@"5");
        
    }];
    


}


//串行队列

-(void)serailQueue{
    
    //创建队列
    GCDQueue *queue = [[GCDQueue alloc]initSerial];
    //执行队列中的线程
    [queue execute:^{
        NSLog(@"1");
        
    }];
    //执行队列中的线程
    [queue execute:^{
        NSLog(@"2");
        
    }];
    //执行队列中的线程
    [queue execute:^{
        NSLog(@"3");
        
    }];
    //执行队列中的线程
    [queue execute:^{
        NSLog(@"4");
        
    }];
    //执行队列中的线程
    [queue execute:^{
        NSLog(@"5");
        
    }];
    
    

}
@end
