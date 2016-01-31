//
//  TravelNotesTableView.m
//  喜游迹
//
//  Created by niceDay on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import "TravelNotesTableView.h"
#import "TravelNotesTableViewCell.h"
#import "CommentsTableViewController.h"
#import "TravelNotesController.h"
#import "UIViewExt.h"
#import "traveNotesDetailViewController.h"
#import "travelNotesModel.h"

static NSString *TravelNotesCellId = @"TravelNotesCellId";

@implementation TravelNotesTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        self.dataSource=self;
        self.delegate=self;
        UINib *nibFile=[UINib nibWithNibName:@"TravelNotesTableViewCell" bundle:nil];
        [self registerNib:nibFile forCellReuseIdentifier:TravelNotesCellId];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.dataSource=self;
        self.delegate=self;
        UINib *nibFile=[UINib nibWithNibName:@"TravelNotesTableViewCell" bundle:nil];
        [self registerNib:nibFile forCellReuseIdentifier:TravelNotesCellId];
    }
    
    return self;
}

#pragma mark - tableView代理方法
//row数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DataArray.count;
}

//cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 478;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TravelNotesTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:TravelNotesCellId forIndexPath:indexPath];
    cell.model=_DataArray[indexPath.row];
    
    //评论按钮(这个按钮有bug。。。)
//    [cell.commentsButton addTarget:self action:@selector(commentsAction:) forControlEvents:UIControlEventTouchUpInside];
//    cell.commentsButton.tag=indexPath.row;

    //游记详情页面
    [cell.travelNotesButton addTarget:self action:@selector(travelNotesAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.travelNotesButton.tag=indexPath.row;
    
    //视频播放按钮
    [cell.videoButton addTarget:self action:@selector(videoPaly:) forControlEvents:UIControlEventTouchUpInside];
    cell.videoButton.tag=indexPath.row;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

//跳转评论页面
-(void)commentsAction:(UIButton *)sender{
    travelNotesModel *model=_DataArray[sender.tag];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"pushComments" object:model];
}

//游记详情页面
-(void)travelNotesAction:(UIButton *)sender{
    
    travelNotesModel *model=_DataArray[sender.tag];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"pushTo" object:model];
}

//播放视频
-(void)videoPaly:(UIButton *)sender{
    travelNotesModel *model=_DataArray[sender.tag];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"pushVideo" object:model];
}

@end
