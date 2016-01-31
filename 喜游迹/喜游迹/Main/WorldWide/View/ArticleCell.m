//
//  ArticleCell.m
//  喜游迹
//
//  Created by LEO on 1/4/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "ArticleCell.h"

@interface ArticleCell()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;  //文章背景图片
@property (weak, nonatomic) IBOutlet UILabel *title;            //文章大标题
@property (weak, nonatomic) IBOutlet UILabel *shortTitle;       //文章小标题

@end

@implementation ArticleCell

#pragma mark - 系统方法
- (void)awakeFromNib {
    //  将超出图片视图部分进行裁剪
    _bgImageView.clipsToBounds = YES;
    
    //  修剪背景图片样式
    self.bgImageView.layer.cornerRadius = 20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setArticleModel:(ArticleModel *)articleModel {
    if (_articleModel != articleModel) {
        _articleModel = articleModel;
        [self setNeedsLayout];
    }
}

#pragma mark - 加载数据
- (void)layoutSubviews {
    [super layoutSubviews];
    
//    NSURL *imageUrl = [NSURL URLWithString:_articleModel.faceImage];
//    [_bgImageView sd_setImageWithURL:imageUrl];
//    
//    _title.text = _articleModel.title;
//    _shortTitle.text = _articleModel.shortTitle;
    
    _bgImageView.image = [UIImage imageNamed:@"auto_image_1"];
    _title.text = @"hello";
    _shortTitle.text = @"bye";
}

@end
