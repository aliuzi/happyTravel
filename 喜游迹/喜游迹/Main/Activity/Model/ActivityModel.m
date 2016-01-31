//
//  ActivityModel.m
//  喜游迹
//
//  Created by mac on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel
//baseModel的处理
- (NSDictionary*)attributeMapDictionary{
    NSDictionary *mapAtt = @{
                             @"faceUrl":@"face",
                             @"show_time":@"show_time",
                             @"title":@"title",
                             @"price":@"price",
                             @"show_tip":@"show_tip",
                             @"confirm_user_count":@"confirm_user_count",
                             @"requstUrlStr":@"detail_url",
                             @"idStr":@"id"
                             };
    return mapAtt;
}

@end