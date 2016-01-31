//
//  ActivityModel.h
//  喜游迹
//
//  Created by mac on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface ActivityModel :BaseModel
/*

"id": "50",
"origi_site": "",
"confirm_user_count": "0",
"has_bonus": "1",
"title": "\u4e18\u6bd4\u7279\u5143\u65e6\u4e91\u53f0\u5c71\u767b\u9ad8\u8d4f\u51b0\u6302\u590d\u5782 ",
"description": "",
"face": "http:\/\/static.e-traveltech.com\/image\/96\/99\/9699009d347f08e0a3846884c7b16a53.jpg",
"time": "1451577600",
"show_time": "2016.01.01",
"show_tip": "\u4e91\u53f0\u5c71",
"price": "550.00",
"preferential": "0",
"detail_url": "http:\/\/m.e-traveltech.com\/activity\/index\/details_new?target_id=50",
"type": 4,
"comment_type": 0,
"tag_logo": ""
 
 */

@property (nonatomic,copy)NSString *requstUrlStr;       //存储所有的网络请求的链接

@property (nonatomic,copy)NSString *faceUrl;            //存取的大图网址

@property (nonatomic,copy)NSString *title;              //大标题

@property (nonatomic,copy)NSString *show_time;          //开始日期

@property (nonatomic,copy)NSString *price;              //价格

@property (nonatomic,copy)NSString *show_tip;           //场地名

@property (nonatomic,copy)NSString *confirm_user_count; //确定报名的人数

@property (nonatomic,copy)NSString *idStr;              //标示信息

@property (nonatomic,strong)NSArray *dataArray;         //字典中的数组


@end
