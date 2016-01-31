//
//  RecommendModel.h
//  喜游迹
//
//  Created by LEO on 1/5/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "BaseModel.h"

/*
 {
	"error_code": 0,
	"data": [{
 "id": "1693",
 "type": 1,
 "title": "\u4e0d\u60f3\u65b0\u5e74\u7b2c\u4e00\u5929\u5c31\u4e0d\uff01\u5f00\uff01\u5fc3\uff01",
 "content": "",
 "url": "http:\/\/m.e-traveltech.com\/world\/index\/world?travel_id=1693&app=3",
 "face": "http:\/\/static.e-traveltech.com\/image\/46\/03\/4603f201a1af1b274cf75243da6f187f.jpg",
 "share_url": "http:\/\/m.e-traveltech.com\/world\/index\/world?travel_id=1693&app=3",
 "short_title": "2016\u5168\u7403\u5341\u4f73\u8de8\u5e74\u5730",
 "description": "\u95f9\u5fc3\uff01\u5f53\u5317\u4eac\u8de8\u5e74\u6d3b\u52a8\u548c\u96fe\u973e\u53ea\u80fd\u6346\u7ed1\u7684\u65f6\u5019\uff0c\u4f60\u60f3\u5230\u4e86\u4ec0\u4e48\uff1f",
 "agree_nr": "0",
 "comment_nr": "1",
 "browse_nr": "106",
 "open_type": 1,
 "show_footer": 1,
 "comment_type": 2
	}],
	"error_msg": "Ok!"
 }
 */

@interface RecommendModel : BaseModel

@property (nonatomic, copy)NSString *url;
@property (nonatomic, copy)NSString *shareUrl;
@property (nonatomic, copy)NSString *faceImage;

@property (nonatomic, retain)NSNumber *titleId;
@property (nonatomic, retain)NSNumber *agree;
@property (nonatomic, retain)NSNumber *comment;
@property (nonatomic, retain)NSNumber *browse;

@end
