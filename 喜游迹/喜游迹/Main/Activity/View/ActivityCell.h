//
//  ActivityCell.h
//  喜游迹
//
//  Created by mac on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

@interface ActivityCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@property (weak, nonatomic) IBOutlet UILabel *imageViewTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *imagRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *bigTitle;
@property (weak, nonatomic) IBOutlet UILabel *downTitle;
@property (weak, nonatomic) IBOutlet UILabel *rightLbel;

@property (nonatomic,strong)ActivityModel *model;

@end