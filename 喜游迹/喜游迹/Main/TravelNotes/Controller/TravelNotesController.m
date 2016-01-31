//
//  TravelNotesController.m
//  喜游迹
//
//  Created by LEO on 12/29/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import "TravelNotesController.h"
#import "WXRefresh.h"
#import "TravelNotesTableView.h"
#import "AFNetworking.h"
#import "travelNotesModel.h"
#import "userModel.h"
#import "traveNotesDetailViewController.h"
#import "CommentsTableViewController.h"
#import "VideoViewController.h"

@interface TravelNotesController ()

@end

@implementation TravelNotesController{
    TravelNotesTableView *tableView;
    NSMutableArray *dataArray;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent=NO;
    self.view.backgroundColor=[UIColor lightGrayColor];
    self.title = @"游记";
    
    //创建tableView
    tableView=[[TravelNotesTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavigationBarHeight) style:UITableViewStylePlain];
    tableView.separatorStyle=UITableViewCellSelectionStyleNone;
    tableView.tag=1;
    [self.view addSubview:tableView];
    
    //下拉刷新控件
    __weak TravelNotesController *weakSelf=self;
    [tableView addPullDownRefreshBlock:^{
        [weakSelf _loadNewData];
    }];
    
    [self _loadNewData];
    
    //监听通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pushTo:) name:@"pushTo" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pushComments) name:@"pushComments" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pushVideo:) name:@"pushVideo" object:nil];
}

//（下拉）加载数据
-(void)_loadNewData{
    //NSURL地址
    NSString *urlString=    @"http://e-traveltech.com/travelNotes/index/getRecommends?sn=0&nu=10&device_id=aimei867247022839400&plat=aphone&os_version=5.0.1&version=2.7.0&dev_model=MX5&net_type=WIFI&language=1&app=3&channel_id=1160101&invitation_code=&t=1451455857&user_id=0&s=";

    //创建manager,返回数据的解析方式
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    manager.responseSerializer=[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    
    //发送请求
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //获取到响应对象
        NSDictionary *result =[NSDictionary dictionaryWithDictionary:responseObject];
        //传递数据给它travelNotesModel
        [self result:result];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error:%@", error);
    }];    
}


//travelNotesModel接收数据
-(void)result:(NSDictionary *)result{
    
    //停止刷新控件
    [tableView.pullToRefreshView stopAnimating];
    
    //创建model数组
    NSMutableArray *modelArray=[[NSMutableArray alloc]init];
    
    //解析字典到数组
    NSArray *notesArray= result[@"data"];
    for (NSDictionary *notesDic in notesArray) {

//        @property(nonatomic,copy)NSString *bigImage; //大图图片地址 face
//        @property(nonatomic,copy)NSString *notesName; //游记名称 title
//        @property(nonatomic,retain)NSNumber *comments; //评论数 comment_nr
//        @property(nonatomic,retain)NSNumber *agree; //点赞数 agree_nr
//        @property(nonatomic,retain)NSNumber *watched; //看过人数 browse_nr
//        @property(nonatomic,copy)NSString *date; //发布时间 format_ctime
//        @property(nonatomic,retain)NSArray *commentsArrar; //评论数组 comments
//        @property(nonatomic,retain)NSNumber *videoType; //是否有视频 video_play_type
//        @property(nonatomic,retain)NSNumber *notesId; //游记序号 id
//        @property(nonatomic,copy)NSString *videoName;//视频链接 video

        //traveNotesModel传递数据
        travelNotesModel *model=[[travelNotesModel alloc]init];
        model.bigImage=[notesDic objectForKey:@"face"];
        model.notesName=[notesDic objectForKey:@"title"];
        model.comments=[notesDic objectForKey:@"comment_nr"];
        model.agree=[notesDic objectForKey:@"agree_nr"];
        model.watched=[notesDic objectForKey:@"browse_nr"];
        model.date=[notesDic objectForKey:@"format_ctime"];
        model.commentsArrar=[notesDic objectForKey:@"comments"];
        model.videoType=[notesDic objectForKey:@"video_play_type"];
        model.notesId=[notesDic objectForKey:@"id"];
        model.videoName=[notesDic objectForKey:@"video"];
        
        //userModel传递数据
        //解析user数组到字典
        NSDictionary *userDic=[notesDic objectForKey:@"user"];

        userModel *user = [[userModel alloc] init];
        user.userImage = userDic[@"logo"];
        user.userName = userDic[@"name"];
        model.usermodel=user;
        
        //把model添加到数组
        [modelArray addObject:model];
    }
    
    //把model数组传递给tableView
    tableView.DataArray = modelArray;
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushTo:(NSNotification *)sender{
    
    traveNotesDetailViewController *tr=[[traveNotesDetailViewController alloc]init];
    travelNotesModel *model=[sender object];
    tr.notesModel=model;
    tr.hidesBottomBarWhenPushed = YES;

    [self.navigationController pushViewController:tr animated:YES];
}

-(void)pushComments{
    
    CommentsTableViewController *tr=[[CommentsTableViewController alloc]init];
    tr.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:tr animated:YES];
}

-(void)pushVideo:(NSNotification *)sender{
    
    VideoViewController *tr=[[VideoViewController alloc]init];
    travelNotesModel *model=[sender object];
    tr.model=model;
    tr.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:tr animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
