//
//  ViewController.m
//  Timer
//
//  Created by FengDing_Ping on 2017/11/3.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "ViewController.h"
#import "TimerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"主页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(jump)];
}


- (void)jump{
    
    TimerViewController *timer = [[TimerViewController alloc]init];
    [self.navigationController pushViewController:timer animated:YES];
    
}

@end
