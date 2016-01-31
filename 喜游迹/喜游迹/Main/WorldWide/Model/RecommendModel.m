//
//  RecommendModel.m
//  喜游迹
//
//  Created by LEO on 1/5/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel

- (void)setAttributes:(NSDictionary *)dataDic {
    [super setAttributes:dataDic];
    _shareUrl = dataDic[@"share_url"];
    _faceImage = dataDic[@"face"];
    _titleId = dataDic[@"id"];
    
    _agree = dataDic[@"agree_nr"];
    _comment = dataDic[@"comment_nr"];
    _browse = dataDic[@"browse_nr"];
}

@end
