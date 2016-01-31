//
//  DataModel.h
//  喜游迹
//
//  Created by LEO on 1/7/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "BaseModel.h"
#import "ArticleModel.h"

@interface DataModel : BaseModel

@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSArray *articles;

+ (NSArray *)dataWithDics:(NSArray *)dics;

@end
