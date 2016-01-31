//
//  notesDetailModel.h
//  喜游迹
//
//  Created by niceDay on 16/1/3.
//  Copyright © 2016年 Leo_Lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "userModel.h"
@interface notesDetailModel : NSObject

@property(nonatomic,copy)NSString *notesName; //游记名称 title
@property(nonatomic,retain)NSNumber *imgCount; //图片数量 image_count
@property(nonatomic,copy)NSString *backgroundUrl; //背景图片地址 background
@property(nonatomic,retain)NSArray *imageArray; //图片数组 images


@end
