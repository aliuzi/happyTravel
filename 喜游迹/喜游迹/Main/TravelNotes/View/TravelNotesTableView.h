//
//  TravelNotesTableView.h
//  喜游迹
//
//  Created by niceDay on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TravelNotesTableViewCell.h"
#import "travelNotesModel.h"

@interface TravelNotesTableView : UITableView<UITableViewDataSource,UITableViewDelegate>{
    
    UINib *nib;
}

@property(nonatomic, strong)NSArray *DataArray;
@property(nonatomic,strong)travelNotesModel *model;

@end
