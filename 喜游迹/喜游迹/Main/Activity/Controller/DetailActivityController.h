//
//  DetailActivityController.h
//  喜游迹
//
//  Created by mac on 16/1/3.
//  Copyright © 2016年 Leo_Lei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

@interface DetailActivityController : UIViewController

@property (nonatomic,strong)ActivityModel *model;

@property (nonatomic,strong)NSArray *dataArray;

@end
