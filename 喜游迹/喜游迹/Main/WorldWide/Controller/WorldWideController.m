//
//  WorldWideController.m
//  喜游迹
//
//  Created by LEO on 12/29/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import "WorldWideController.h"
#import "WorldWideTableView.h"
#import "DataModel.h"
#import "ArticleModel.h"
#import "RecommendModel.h"
#import "RecommendView.h"

@interface WorldWideController () {
    WorldWideTableView *_tableView;
    RecommendView *_view;
}

@end

@implementation WorldWideController

#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  更改当前视图控制器的名字
    self.navigationItem.title = @"看世界";
    
    //  显示内容视图
    [self showContentTableView];
    
    //  网络获取数据
    [self getRecommendData];
    [self getArticleData];
    
    __weak WorldWideController *weakSelf = self;
    
    //  下拉刷新
    [_tableView addPullDownRefreshBlock:^{
        NSLog(@"下拉刷新");
        [weakSelf getRecommendData];
        [weakSelf getArticleData];
    }];
    
    //  上拉加载
    [_tableView addInfiniteScrollingWithActionHandler:^{
        NSLog(@"上拉加载");
        [weakSelf getRecommendData];
        [weakSelf getArticleData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 显示内容视图
- (void)showContentTableView {
    //  创建tableView, 设置当前视图控制器的视图为表视图
    CGRect tableViewFrame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    _tableView = [[WorldWideTableView alloc] initWithFrame:tableViewFrame
                                                     style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
}

#pragma mark 请求文章数据 
- (void)getArticleData {
    //  1)创建网络请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //  参数可以不设置, 默认也是从索引值为0的文章开始, 获取10篇文章
    NSDictionary *parameters = @{@"sn": @"0",
                                 @"nu": @"10"};

    //  2)发送GET请求获取数据
    //  获取文章数据
    [manager GET:kArticleBaseURL parameters:parameters progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //  创建一个数组用语存储访问到的数据
        NSArray *dataModels = [[NSArray alloc] init];
        NSArray *dataResult = responseObject[@"data"];
        
        //  将以data为键访问到数据 进行解析并存储
        dataModels = [DataModel dataWithDics:dataResult];
        
        //  创建一个可变集合用语存储data中的title, 即文章的分组名称
        NSMutableSet *mSet = [NSMutableSet set];
        for (DataModel *data in dataModels) {
            [mSet addObject:data.title];
        }
        
        //  创建一个数组来对访问到的是数据进行整理
        NSMutableArray *sortDataArray = [NSMutableArray array];
        
        /*
         通过已获得的文章分组名称集合进行名称比较, 将同名称的文章放在同一个数组中, 
         再将这些数组放到事先创建好的数据整理数组中
         */
        for (NSString *str in mSet) {
            NSMutableArray *mArray = [NSMutableArray array];
            for (DataModel *data in dataModels) {
                if ([data.title isEqualToString:str]) {
                    [mArray addObject:data];
                }
            }
            [sortDataArray addObject:mArray];
        }
        
        _tableView.dataArray = sortDataArray;
        [_tableView reloadData];
        
        [_tableView.pullToRefreshView stopAnimating];
        [_tableView.infiniteScrollingView stopAnimating];
    }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"文章页面网络请求失败, 错误原因:%@", error);
    }];
}

#pragma mark 请求推荐页面数据
- (void)getRecommendData {
    //  1)创建网络请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    //  2)获取推荐文章数据
    [manager GET:kRecommendBaseURL parameters:nil progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //  创建数组用于存储请求数据
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];
        
        //  将通过data键访问到的数据存到数组中
        NSArray *dataResult = responseObject[@"data"];
        
        for (NSDictionary *dataDic in dataResult) {
            //  解析数组中的数据
            RecommendModel *recommendModel = [[RecommendModel alloc] initWithDataDic:dataDic];
            //  将解析好的数据存到数组中
            [dataArray addObject:recommendModel];
        }
        //  3)数据传递给表视图
        _tableView.recommendArray = dataArray;
        
        [_tableView reloadData];
             
        //  4)停止刷新动画
        [_tableView.pullToRefreshView stopAnimating];
        [_tableView.infiniteScrollingView stopAnimating];
    }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"推荐页面网络请求失败, 错误原因:%@", error);
    }];
}

@end
