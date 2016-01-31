//
//  ActivityTableView.h
//  喜游迹
//
//  Created by mac on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy)NSArray *dataArray;

@end