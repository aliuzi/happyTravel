//
//  TabBarItem.h
//  喜游迹
//
//  Created by LEO on 12/29/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarItem : UIControl

- (instancetype)initWithTabBarButtonFrame:(CGRect)frame
                              normalImage:(NSString *)normalName
                           highlightImage:(NSString *)highlightName
                                textLabel:(NSString *)title;

@end
