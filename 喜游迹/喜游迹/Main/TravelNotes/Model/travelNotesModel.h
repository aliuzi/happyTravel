//
//  travelNotesModel.h
//  喜游迹
//
//  Created by niceDay on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "userModel.h"
@interface travelNotesModel : NSObject

@property(nonatomic,copy)NSString *bigImage; //大图图片地址 face
@property(nonatomic,copy)NSString *notesName; //游记名称 title
@property(nonatomic,retain)NSNumber *comments; //评论数 comment_nr
@property(nonatomic,retain)NSNumber *agree; //点赞数 agree_nr
@property(nonatomic,retain)NSNumber *watched; //看过人数 browse_nr
@property(nonatomic,copy)NSString *date; //发布时间 format_ctime
@property(nonatomic,retain)NSArray *commentsArrar; //评论数组 comments
@property(nonatomic,retain)NSNumber *videoType; //是否有视频 video_play_type
@property(nonatomic,retain)NSNumber *notesId; //游记序号 id
@property(nonatomic,copy)NSString *videoName;//视频链接 video

@property(nonatomic,strong)userModel *usermodel; //用户model

@end