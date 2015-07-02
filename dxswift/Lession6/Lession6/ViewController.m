//
//  ViewController.m
//  Lession6
//
//  Created by Mac mini  on 15/6/27.
//  Copyright (c) 2015年 中交虹桥. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"
@interface ViewController ()
@property (nonatomic,strong)UIImageView *view1;
@property (nonatomic,strong)UIImageView *view2;
@property (nonatomic,strong)UIImageView *view3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view1 = [self createImageViewWithFrame:CGRectMake(0, 0, 100, 100)];
    self.view2 = [self createImageViewWithFrame:CGRectMake(100, 0, 100, 100)];
    self.view3 = [self createImageViewWithFrame:CGRectMake(200, 0, 100, 100)];
    
    //初始化信号量
    GCDSemaphore *semaphre = [[GCDSemaphore alloc]init];
    
    
    NSString *net1 = @"http://pic.cnitblog.com/avatar/607542/20140226182241.png";
    NSString *net2 = @"http://pic.cnitblog.com/avatar/708810/20141230105233.png";
    NSString *net3 = @"http://pic.cnitblog.com/avatar/704178/20141216150843.png";
    
    [GCDQueue executeInGlobalQueue:^{
        //获取图片1
        
        UIImage *image1 = [self accessDataByNetString:net1];
        
        [GCDQueue executeInMainQueue:^{
            [UIView animateWithDuration:2.f animations:^{
                self.view1.image = image1;
                self.view1.alpha =1.f;
            } completion:^(BOOL finished) {
                [semaphre signal];
            }];
        }];
    }];
    
    [GCDQueue executeInGlobalQueue:^{
        //获取图片2
 
        UIImage *image1 = [self accessDataByNetString:net2];
               [semaphre wait];
        [GCDQueue executeInMainQueue:^{
            [UIView animateWithDuration:2.f animations:^{
             
                self.view2.image = image1;
                self.view2.alpha =1.f;
            } completion:^(BOOL finished) {
                [semaphre signal];
            }];
        }];
    }];

    [GCDQueue executeInGlobalQueue:^{
        //获取图片3
        
        UIImage *image1 = [self accessDataByNetString:net3];
                        [semaphre wait];
        [GCDQueue executeInMainQueue:^{
            [UIView animateWithDuration:2.f animations:^{

                self.view3.image = image1;
                self.view3.alpha =1.f;
            } completion:^(BOOL finished) {
                
            }];
        }];
    }];

}

-(UIImageView *)createImageViewWithFrame :(CGRect)frame
{
    UIImageView *imageview = [[UIImageView alloc]initWithFrame :frame];
    
    imageview.alpha = 0;
    
    
    [self.view addSubview:imageview];
    
    return imageview;

}

-(UIImage *)accessDataByNetString :(NSString *)string{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    UIImage *image = [UIImage imageWithData:data];
    return image;
    
    
    
    


}



@end
