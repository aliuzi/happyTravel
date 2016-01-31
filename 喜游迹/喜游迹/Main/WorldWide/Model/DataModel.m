//
//  DataModel.m
//  喜游迹
//
//  Created by LEO on 1/7/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (void)setAttributes:(NSDictionary *)dataDic {
    [super  setAttributes:dataDic];
    
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in dataDic[@"articles"]) {
        [mArray addObject:[[ArticleModel alloc] initWithDataDic:dic]];
    }
    
    self.articles = mArray;
}

+ (NSArray *)dataWithDics:(NSArray *)dics {
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in dics) {
        [mArray addObject:[[DataModel alloc] initWithDataDic:dic]];
    }
    return mArray;
}

@end
