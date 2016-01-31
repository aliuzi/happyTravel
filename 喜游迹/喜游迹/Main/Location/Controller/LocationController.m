//
//  LocationController.m
//  喜游迹
//
//  Created by LEO on 1/1/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "LocationController.h"
#import "BaseNavigationController.h"
@interface LocationController ()

@end

@implementation LocationController

#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.navigationItem setHidesBackButton:YES];
    [self setNavigationItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - 设置返回按钮
- (void)setNavigationItem {
    CGRect buttonFrame = CGRectMake(10, 20, 30, 30);
    UIImage *backImage = [UIImage imageNamed:@"back_arrow"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = buttonFrame;
    [button setImage:backImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
}

#pragma mark - 返回上级视图
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
