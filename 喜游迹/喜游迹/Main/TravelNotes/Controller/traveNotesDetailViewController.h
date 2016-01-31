//
//  traveNotesDetailViewController.h
//  喜游迹
//
//  Created by niceDay on 16/1/3.
//  Copyright © 2016年 Leo_Lei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "notesDetailModel.h"
#import "travelNotesModel.h"

@interface traveNotesDetailViewController : UIViewController<UIWebViewDelegate>{
    UIWebView *webView;
}

@property(nonatomic,strong)notesDetailModel *model;
@property(nonatomic,strong)travelNotesModel *notesModel;

@end
