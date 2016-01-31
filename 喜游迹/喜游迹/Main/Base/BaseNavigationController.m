//
//  BaseNavigationController.m
//  喜游迹
//
//  Created by LEO on 12/29/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  设置导航栏为不透明
    self.navigationBar.translucent = NO;
    
    //  改变导航栏的背景颜色为特定的粉色
    self.navigationBar.barTintColor = kNavBGColor;
    
    //  设置导航栏字体, 这里仅修改字体颜色为白色
    self.navigationBar.titleTextAttributes = @{
                                               NSForegroundColorAttributeName:[UIColor whiteColor]
                                               };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
