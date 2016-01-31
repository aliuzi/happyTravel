//
//  TravelNotesTableViewCell.h
//  喜游迹
//
//  Created by niceDay on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "travelNotesModel.h"

@interface TravelNotesTableViewCell : UITableViewCell

@property(nonatomic,strong)travelNotesModel *model;

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *notesDate;
@property (weak, nonatomic) IBOutlet UIImageView *dateImage;
@property (weak, nonatomic) IBOutlet UIImageView *bigImage;
@property (weak, nonatomic) IBOutlet UILabel *notesName;
@property (weak, nonatomic) IBOutlet UILabel *watchedCount;
@property (weak, nonatomic) IBOutlet UIImageView *agreeImage;
@property (weak, nonatomic) IBOutlet UILabel *agreeCount;
@property (weak, nonatomic) IBOutlet UIImageView *commentsImage;
@property (weak, nonatomic) IBOutlet UILabel *commentsCount;
@property (weak, nonatomic) IBOutlet UIImageView *shareImage;
@property (weak, nonatomic) IBOutlet UIButton *videoButton;
@property (weak, nonatomic) IBOutlet UIButton *travelNotesButton;
@property (weak, nonatomic) IBOutlet UIButton *commentsButton;

@end
