//
//  MainTabBarController.m
//  喜游迹
//
//  Created by LEO on 12/29/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseNavigationController.h"
#import "TabBarItem.h"

@interface MainTabBarController (){
    TabBarItem *_selectButton;
}

@end

@implementation MainTabBarController

#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    //  1)创建子控制器
    [self subviewControllers];
    
    //  2)添加自定义标签栏
    [self customizeTabbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 设置标签控制器
- (void)subviewControllers {
    /*  1)将子控制器的名字放入数组, 通过名字去访问相关的故事板中的入口控制器, 其入口控制
     器为管理了一个视图控制器的导航控制器, 接着将所有导航控制器交由标签控制器管理
     */
    NSArray *controllerNames = @[@"TravelNotes", @"WorldWide", @"Activity", @"Mine"];

    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    
    for (NSString *name in controllerNames) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
        BaseNavigationController *navigationController = [storyboard instantiateInitialViewController];
        navigationController.topViewController.title = name;
        [controllers addObject:navigationController];
    }
    self.viewControllers = controllers;
}

#pragma mark - 自定义标签栏
- (void)customizeTabbar {
    //  1)移除原有的TabBarButton视图
    for (UIView *view in self.tabBar.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            [view removeFromSuperview];
        }
    }
    
    //  2)设置按钮图片数组, 视图控制器名称数组
    NSArray *imageNames = @[
                            @"tabbar_icon_travelnotes",
                            @"tabbar_icon_worldwide",
                            @"tabbar_icon_activity",
                            @"tabbar_icon_mine"];
    
    NSArray *titleNames = @[
                            @"游记",
                            @"看世界",
                            @"活动",
                            @"我"
                            ];
    
    for (NSInteger i = 0; i < kBarButtonCount; i++) {
        //  1)创建标签栏按钮
        NSString *normalImage = [NSString stringWithFormat:@"%@_normal", imageNames[i]];
        NSString *highlightImage = [NSString stringWithFormat:@"%@_highlight", imageNames[i]];
        
        CGRect barButtonFrame = CGRectMake(i * kBarButtonWidth, 0, kBarButtonWidth, kBarButtonHeight);
        
        //  使用子类化按钮进行创建
        TabBarItem *barButton = [[TabBarItem alloc] initWithTabBarButtonFrame:barButtonFrame
                                                                  normalImage:normalImage
                                                               highlightImage:highlightImage
                                                                    textLabel:titleNames[i]];
        
        //  对按钮添加点击事件
        [barButton addTarget:self action:@selector(buttonChanged:) forControlEvents:UIControlEventTouchUpInside];
        barButton.tag = i;
        [self.tabBar addSubview:barButton];
    
        //  2)创建遮盖视图
        CGRect hideFrame = CGRectMake(0, 0, kBarButtonWidth, kBarButtonHeight);
        UIView *hideView = [[UIView alloc] initWithFrame:hideFrame];
        hideView.backgroundColor = kRGBColor(25, 25, 25, 0.1);
        hideView.tag = kHideViewTag;

        //  默认应用进入时显示按钮位于第一位, 且此时按钮为不可响应状态
        if (i == 0) {
            barButton.enabled = NO;
            _selectButton = barButton;
            
            //  在按钮位于首位时, 添加遮盖视图
            [self.tabBar addSubview:hideView];
        }
    }
    //  默认应用进入时显示第一个视图
    self.selectedIndex = 0;
}

#pragma mark - 切换视图控制器
- (void)buttonChanged:(TabBarItem *)button {
    //  视图控制器的切换跟随按钮的切换
    self.selectedIndex = button.tag;
    
    //  如果当前选择的按钮不是第一个按钮, 则改变选中按钮为当前按钮, 且原有按钮可响应
    if (button != _selectButton) {
        _selectButton.enabled = YES;
        _selectButton = button;
    }
    
    //  获取遮盖视图, 改变其中心位置和选定按钮一致
    [UIView animateWithDuration:0.2 animations:^{
        UIView *hide = (UIView *)[self.tabBar viewWithTag:kHideViewTag];
        hide.center = _selectButton.center;
    }];
    
    //  新选中的按钮的响应状态为不可响应
    button.enabled = NO;
}

@end
