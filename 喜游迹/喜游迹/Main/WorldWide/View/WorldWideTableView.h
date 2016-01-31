//
//  WorldWideTableView.h
//  喜游迹
//
//  Created by LEO on 12/30/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorldWideTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy)NSArray *dataArray;
@property (nonatomic, copy)NSArray *recommendArray;

@end
