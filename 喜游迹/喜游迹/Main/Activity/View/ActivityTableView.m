//
//  ActivityTableView.m
//  喜游迹
//
//  Created by mac on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import "ActivityTableView.h"
#import "ActivityCell.h"
#import "UIView+UIViewController.h"

#import "DetailActivityController.h"

@implementation ActivityTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    
        UINib *nib = [UINib nibWithNibName:@"ActivityCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:@"ActivityCellID"];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        
        UINib *nib = [UINib nibWithNibName:@"ActivityCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:@"ActivityCellID"];
    }
    
    return self;
}

#pragma mark - TableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityCellID"];
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    cell.model = self.dataArray[indexPath.row];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 290;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取视图控制器
    UIViewController *vc = self.belongController;
    
    DetailActivityController *detailController = [[DetailActivityController alloc]init];
    detailController.model = _dataArray[indexPath.row];
    detailController.title = detailController.model.title;
    detailController.hidesBottomBarWhenPushed = YES;
    
    [vc.navigationController pushViewController:detailController animated:YES];
}

@end