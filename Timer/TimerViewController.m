//
//  TimerViewController.m
//  Timer
//
//  Created by FengDing_Ping on 2017/11/3.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "TimerViewController.h"
#import "JSTimer.h"
#import "JSGCDTimer.h"

@interface TimerViewController ()

@property (nonatomic, strong)JSTimer *timer;

@property (nonatomic, strong)JSGCDTimer *gcdTimer;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"Timer";
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, self.view.bounds.size.width - 200, 60)];
    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"JStimer" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(js_runJSTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 350, self.view.bounds.size.width - 200, 60)];
    [button1 setBackgroundColor:[UIColor redColor]];
    [button1 setTitle:@"JSGCDtimer" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(js_runJSGCDTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
}

//测试JSTimer
- (void)js_runJSTimer{
    
    _timer = [JSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [_timer fire];
    
}
//测试GCDTimer
- (void)js_runJSGCDTimer{
    
    _gcdTimer = [JSGCDTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

- (void)timerAction{
    NSLog(@"TimerAction");
}

- (void)dealloc{
    
    [_timer invalidate];
    [_gcdTimer invalidate];
    NSLog(@"销毁了- -!");
}
    

@end
