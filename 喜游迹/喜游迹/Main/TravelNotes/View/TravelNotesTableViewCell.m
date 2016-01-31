//
//  TravelNotesTableViewCell.m
//  喜游迹
//
//  Created by niceDay on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import "TravelNotesTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "CommentsTableViewController.h"

@implementation TravelNotesTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(travelNotesModel *)model{
    if (_model!=model) {
        _model =model;
        [self setNeedsLayout];
    }
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
//    @property (weak, nonatomic) IBOutlet UILabel *userName;
//    @property (weak, nonatomic) IBOutlet UIImageView *userImage;
//    @property (weak, nonatomic) IBOutlet UILabel *notesDate;
//    @property (weak, nonatomic) IBOutlet UIImageView *dateImage;
//    @property (weak, nonatomic) IBOutlet UIImageView *bigImage;
//    @property (weak, nonatomic) IBOutlet UILabel *notesName;
//    @property (weak, nonatomic) IBOutlet UILabel *watchedCount;
//    @property (weak, nonatomic) IBOutlet UIImageView *agreeImage;
//    @property (weak, nonatomic) IBOutlet UILabel *agreeCount;
//    @property (weak, nonatomic) IBOutlet UIImageView *commentsImage;
//    @property (weak, nonatomic) IBOutlet UILabel *commentsCount;
//    @property (weak, nonatomic) IBOutlet UIImageView *shareImage;
//    @property (weak, nonatomic) IBOutlet UIButton *videoButton;

    //用户昵称
    _userName.text=_model.usermodel.userName;
    
    //用户头像
    NSString *userImageStr=_model.usermodel.userImage;
    NSURL *userImageUrl=[NSURL URLWithString:userImageStr];
    [_userImage sd_setImageWithURL:userImageUrl placeholderImage:[UIImage imageNamed:@"image_icon_large@3x.png"]];
    _userImage.layer.masksToBounds=YES;
    _userImage.layer.cornerRadius=12.5f;
    
    //发布时间
    _notesDate.text=_model.date;
    
    //时钟图片
    [_dateImage setImage:[UIImage imageNamed:@"clock_gray@3x.png"]];
    
    //游记大图
    NSString *bigImageStr=_model.bigImage;
    NSURL *bigImageUrl=[NSURL URLWithString:bigImageStr];
    [_bigImage sd_setImageWithURL:bigImageUrl];
    _bigImage.clipsToBounds = YES;
    
    //游记名字
    _notesName.text=_model.notesName;
    
    //看过人数
    _watchedCount.text=[NSString stringWithFormat:@"%@人看过",_model.watched];
    
    //点赞图片
    [_agreeImage setImage:[UIImage imageNamed:@"praise_hand_gray@3x.png"]];
    
    //点赞数
    _agreeCount.text=[NSString stringWithFormat:@"%@",_model.agree];
    
    //评论图片
    [_commentsImage setImage:[UIImage imageNamed:@"comment_icon_gray@3x.png"]];
    
    //评论数
    _commentsCount.text=[NSString stringWithFormat:@"%@",_model.comments];
    
    //分享图片
    [_shareImage setImage:[UIImage imageNamed:@"share_red@3x.png"]];
    
    //页面类型判断
    int num=[_model.videoType intValue];
    
    //游记详情页面
    if (num==0) {
        self.travelNotesButton.hidden=NO;
    }
    else{
        self.travelNotesButton.hidden=YES;
    }
    
    [_commentsButton setBackgroundColor:[UIColor blackColor]];
    
    //视频播放按钮
    [self.videoButton setBackgroundImage:[UIImage imageNamed:@"video_play@3x.png"] forState:UIControlStateNormal];
    if (num==2) {
        self.videoButton.hidden=NO;
    }
    else{
        self.videoButton.hidden=YES;
    }
}

@end