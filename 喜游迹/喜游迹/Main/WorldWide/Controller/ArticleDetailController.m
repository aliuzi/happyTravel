//
//  ArticleDetailController.m
//  喜游迹
//
//  Created by LEO on 12/30/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import "ArticleDetailController.h"

@interface ArticleDetailController ()<UIWebViewDelegate>{
    UIActivityIndicatorView *indicator;
}

@end

@implementation ArticleDetailController

#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWebViewWithURL:@"http://m.e-traveltech.com//world/index/world?travel_id=1696" parameters:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 网页视图
- (void)loadWebViewWithURL:(NSString *)urlString parameters:(NSDictionary *)parameters {
    //  创建整体内容的网页视图
    UIWebView *articleWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    //  设置其网页内容自动适配
    articleWebView.scalesPageToFit = YES;
    articleWebView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:urlString];
    //  请求网页数据
    NSURLRequest *dataRequest = [NSURLRequest requestWithURL:url];
    [articleWebView loadRequest:dataRequest];
    
    indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [indicator stopAnimating];
    
    [self.view addSubview:articleWebView];
    [self.view addSubview:indicator];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [indicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [indicator stopAnimating];
}

@end
