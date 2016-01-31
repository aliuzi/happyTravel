//
//  ArticleModel.m
//  喜游迹
//
//  Created by LEO on 1/4/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "ArticleModel.h"

@implementation ArticleModel

//  重写该方法, 确保映射字典取到的值是正确的, 而不是由变量名去访问取值
- (void)setAttributes:(NSDictionary *)dataDic {
    [super setAttributes:dataDic];
    
    _articleId = dataDic[@"id"];
    _shortTitle = dataDic[@"short_title"];
    _faceImage = dataDic[@"face"];
    _shareUrl = dataDic[@"share_url"];
    
    _comment = dataDic[@"comment_nr"];
    _browse = dataDic[@"browse_nr"];
}

@end
