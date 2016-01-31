//
//  ActivityController.m
//  喜游迹
//
//  Created by LEO on 12/29/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import "ActivityController.h"
#import "ActivityTableView.h"
#import "AFNetworking.h"
#import "ActivityModel.h"
#import "ActivityCell.h"
#import "WXRefresh.h"
@interface ActivityController ()

@end

@implementation ActivityController{
    NSDictionary *dataDic;//存储获取到的数据
    NSMutableArray *dataArray;//用于存储字典中的数据，返回tableViewCell的个数;
    ActivityTableView *_activityTableView;//活动表视图;
}

#pragma mark - 第三方加载提示
- (void)createData{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:kActivityBaseURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dataDic = [[NSDictionary alloc]init];
        
        dataDic = [NSDictionary dictionaryWithDictionary:responseObject];
        
        dataArray = [[NSMutableArray alloc]init];
        
        dataArray = [dataDic objectForKey:@"data"];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in dataArray) {
            ActivityModel *model = [[ActivityModel alloc]initWithDataDic:dic];
            [array addObject:model];
        }
        
        _activityTableView.dataArray = array;
        
        [_activityTableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}


- (void)createTableView{
    _activityTableView = [[ActivityTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight -kNavigationBarHeight ) style:UITableViewStylePlain];
    [self.view addSubview:_activityTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动";
    
    [self createData];
    
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end