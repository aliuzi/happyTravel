//
//  BaseViewController.m
//  喜游迹
//
//  Created by LEO on 1/1/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "BaseViewController.h"
#import "LocationController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  统一设置页面背景色
    self.view.backgroundColor = kBackgroundColor;
    
    //  创建定位按钮
    [self createLocationButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 创建定位按钮
- (void)createLocationButton {
    UIImage *normalImage = [UIImage imageNamed:@"location_nav"];
    
    //  此时设置的尺寸只需要设置宽度, 确保字符的显示, 因为设置为导航栏按钮时高度以及位置将被限制
    CGRect buttonFrame = CGRectMake(0, 0, 100, 20);
    
    UIButton *locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    locationButton.frame = buttonFrame;
    [locationButton setImage:normalImage forState:UIControlStateNormal];
    
    [locationButton setTitle:@"杭州市" forState:UIControlStateNormal];
    [locationButton addTarget:self action:@selector(locating) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:locationButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

#pragma mark - 定位操作
- (void)locating {
    LocationController *locationView = [[LocationController alloc] init];
    locationView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:locationView animated:YES];
}
@end
