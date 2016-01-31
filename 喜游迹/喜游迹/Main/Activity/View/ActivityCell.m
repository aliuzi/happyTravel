//
//  ActivityCell.m
//  喜游迹
//
//  Created by mac on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import "ActivityCell.h"
#import "ActivityModel.h"
#import "UIImageView+WebCache.h"

@implementation ActivityCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSString *bigImageViewString = _model.faceUrl;
    NSURL *bigImageViewUrl = [NSURL URLWithString:bigImageViewString];
    [_bigImageView sd_setImageWithURL:bigImageViewUrl];
    
    _bigTitle.text = _model.title;
    _imageViewTopLabel.text = _model.show_time;
    _imagRightLabel.text = _model.price;
    _downTitle.text = _model.show_tip;
    
    NSString *string = [NSString stringWithFormat:@"%@人报名",_model.confirm_user_count];
    _rightLbel.text = string;
}

- (void)setModel:(ActivityModel *)model{
    if (_model !=model) {
        _model = model;
        [self setNeedsLayout];
    }
}

@end