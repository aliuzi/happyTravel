//
//  WorldWideTableView.m
//  喜游迹
//
//  Created by LEO on 12/30/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import "WorldWideTableView.h"
#import "ArticleCell.h"
#import "ArticleDetailController.h"
#import "ArticleModel.h"
#import "RecommendView.h"
#import "DataModel.h"
#import "MoreArticleTableViewController.h"

@interface WorldWideTableView(){
    //  推荐视图
    RecommendView *_recommendView;
    UIView *_headerView;
}

@property (nonatomic, strong) ArticleModel *articleModel;

@end

@implementation WorldWideTableView

#pragma mark - 添加表视图
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        //  设置代理、数据源对象
        self.delegate = self;
        self.dataSource = self;
        
        //  注册单元格
        UINib *nib = [UINib nibWithNibName:@"ArticleCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:kArticleCellId];
        
        //  去掉分割线样式
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self createHeaderView];
    }
    return self;
}

#pragma mark - 添加表视图的头视图
- (void)createHeaderView {
    //  1、创建父视图
    CGRect headerFrame = CGRectMake(0, 0, kScreenWidth, kRecommendViewHeight);
    _headerView = [[UIView alloc] initWithFrame:headerFrame];
    
    //  2、加载xib创建推荐视图
    CGRect recommendFrame = headerFrame;
    _recommendView = [[NSBundle mainBundle] loadNibNamed:@"RecommendView"
                                                   owner:self
                                                 options:nil].lastObject;
    _recommendView.frame = recommendFrame;
    [_headerView addSubview:_recommendView];
    
    self.tableHeaderView = _headerView;
}

#pragma mark - 表视图的代理、数据源方法
#pragma mark 表视图的组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataArray.count;
}

#pragma mark 表视图单组中的单元格数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray[section] count];
}

#pragma mark 单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

#pragma mark 组的头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CGRect viewFrame = CGRectMake(0, 0, kScreenWidth, kRecommendHeaderHeight);
    UIView *view = [[UIView alloc] initWithFrame:viewFrame];
    view.backgroundColor = [UIColor whiteColor];
    
    //  添加分组名字
    //  由于dataArray里存了每个分组的Model, 故任意取其中一个Model的title即分区名字
    DataModel *dataModel = [_dataArray[section] lastObject];
    
    CGRect textFrame = CGRectMake(25, 15, kScreenWidth - 25, 20);
    UILabel *groupName = [[UILabel alloc] initWithFrame:textFrame];
    groupName.font = kSystemFont(20);
    groupName.text = dataModel.title;
    [view addSubview:groupName];
    
    //  添加更多按钮
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.frame = CGRectMake(kScreenWidth - 60, 15, 40, 20);
    [moreButton setTitle:@"更多" forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    //  为按钮添加加载更多文章的操作
    [moreButton addTarget:self
                   action:@selector(loadMoreArticle:)
         forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:moreButton];
    
    //  添加分组前图标
    UIView *pinkView = [[UIView alloc] initWithFrame:CGRectMake(10, 15, 10, 20)];
    pinkView.backgroundColor = kNavBGColor;
    pinkView.layer.cornerRadius = 5.0f;
    [view addSubview:pinkView];
    
    //  添加大于号图标
    CGRect arrowFrame = CGRectMake(kScreenWidth - 20, 15, 8, 20);
    UIImageView *arrow = [[UIImageView alloc] initWithFrame:arrowFrame];
    arrow.image = [UIImage imageNamed:@"arrow_right"];
    arrow.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:arrow];
    
    return view;
}


#pragma mark 组的头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kRecommendHeaderHeight;
}

#pragma mark 单元格内容填充
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //  创建单元格
    ArticleCell *articleCell = [tableView dequeueReusableCellWithIdentifier:kArticleCellId
                                                               forIndexPath:indexPath];
    
    articleCell.articleModel = _dataArray[indexPath.row];
    _recommendView.recommendModel = _recommendArray[indexPath.section];
    articleCell.backgroundColor = kBackgroundColor;

    return articleCell;
}

#pragma mark - 访问文章详情页
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //  文章详情页面
    ArticleDetailController *articleDetail = [[ArticleDetailController alloc] init];
    
    //  当页面被push到下一页面时, 隐藏标签栏
    articleDetail.hidesBottomBarWhenPushed = YES;
    [self.belongController.navigationController pushViewController:articleDetail animated:YES];
    
    //  取消单元格选中样式
    [self deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark 访问更多同类文章
- (void)loadMoreArticle:(UIButton *)button {
    //  更多分组文章页面
    MoreArticleTableViewController *moreArticle = [[MoreArticleTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    //  当页面被push到下一页面时, 隐藏标签栏
    moreArticle.hidesBottomBarWhenPushed = YES;
    [self.belongController.navigationController pushViewController:moreArticle animated:YES];
}

@end
