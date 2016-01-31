//
//  DetailActivityController.m
//  喜游迹
//
//  Created by mac on 16/1/3.
//  Copyright © 2016年 Leo_Lei. All rights reserved.
//

#import "DetailActivityController.h"
#import "AFNetworking.h"


#import "DetailModel.h"

@interface DetailActivityController ()

@end

@implementation DetailActivityController
- (void)createTableView{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight -kNavigationBarHeight)];
    
    NSString *urlStr = [NSString stringWithFormat:@"http://m.e-traveltech.com/activity/index/details_new?target_id=%@&device_id=BA62AD8D-3180-436C-A532-724A597D6818&os=iOS&os_version=9.2&version=2.6.2&dev_model=iPhone5,2&net_type=WiFi&resolution=640*1136&cpu_model=armv7s&cpu_frequency=-1&plat=iPhone&language=1&channel_id=105&t=1451784974",self.model.idStr];
    
    NSURLRequest *requst = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [webView loadRequest:requst];
    
    [self.view addSubview:webView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end