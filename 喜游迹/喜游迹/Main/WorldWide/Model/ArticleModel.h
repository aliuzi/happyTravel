//
//  ArticleModel.h
//  喜游迹
//
//  Created by LEO on 1/4/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "BaseModel.h"

/*
 {
	"error_code": 0,
	"count": 58,
	"data": [{
 "id": "308",
 "app": "3",
 "title": "\u6bcf\u65e5\u4e00\u95ee",
 "template": "1",
 "index": "1",
 "more": "1",
 "articles": [{
 "id": "1696",
 "app": "3",
 "type": 1,
 "sub_type": "1",
 "spots_type": "1",
 "spots_id": "0",
 "child_spots_id": "0",
 "title": "\u9a91\u9a6f\u9e7f\u7684\u9664\u4e86\u5723\u8bde\u8001\u4eba\uff0c\u8fd8\u6709\u8c01\uff1f",
 "short_title": "\u9a6f\u9e7f\u662f\u4ed6\u4eec\u7684\u795e\u7075\u548c\u56fe\u817e",
 "audio_title": "",
 "face": "http:\/\/static.e-traveltech.com\/image\/20\/a5\/20a5c2c767484e424ed0814e8e9e53e5.jpg",
 "face2": "http:\/\/static.e-traveltech.com\/image\/1a\/68\/1a6869a53cd3e6ec4a3fe77ad1a47d4d.jpg",
 "description": "\u9a6f\u9e7f\u9664\u4e86\u5bf9\u5723\u8bde\u8001\u4eba\u62e5\u6709\u7279\u6b8a\u5730\u4f4d\uff0c\u5bf9\u8fd9\u4e2a\u79cd\u65cf\u7684\u4eba\u7adf\u7136\u6709\u7740\u66f4\u4e3a\u91cd\u8981\u7684\u4f5c\u7528\u3002\u5b83\u8c61\u5f81\u7740\u6148\u60b2\u7684\u795e\u7075\uff0c\u662f\u4ed6\u4eec\u5fc3\u4e2d\u7684\u56fe\u817e\u3002",
 "address": "",
 "country_id": "0",
 "province_id": "0",
 "city_id": "0",
 "place_id": "0",
 "agree_nr": "0",
 "disagree_nr": "0",
 "comment_nr": "0",
 "browse_nr": "33",
 "plus_agree_nr": "0",
 "plus_disagree_nr": "0",
 "plus_comment_nr": "0",
 "plus_browse_nr": "0",
 "index": "1",
 "tag": "\u6bcf\u65e5\u4e00\u95ee",
 "relative": [],
 "audio": "",
 "open_type": 1,
 "show_footer": 1,
 "comment_type": 2,
 "url": "http:\/\/m.e-traveltech.com\/\/world\/index\/world?travel_id=1696&app=3",
 "share_url": "http:\/\/m.e-traveltech.com\/\/world\/index\/world?travel_id=1696&app=3"
 }]
	}],
	"error_msg": "Ok!"
 }
*/

@interface ArticleModel : BaseModel

@property (nonatomic, copy)NSString *tag;           //文章所属分区
@property (nonatomic, copy)NSString *articleId;     //文章标识符
@property (nonatomic, copy)NSString *title;         //文章主标题
@property (nonatomic, copy)NSString *shortTitle;    //文章副标题
@property (nonatomic, copy)NSString *faceImage;     //文章背景视图
@property (nonatomic, copy)NSString *url;           //文章链接地址
@property (nonatomic, copy)NSString *shareUrl;      //文章分享地址

@property (nonatomic, retain)NSNumber *comment;     //评论数
@property (nonatomic, retain)NSNumber *browse;      //浏览量

@end
