//
//  Common.h
//  喜游迹
//
//  Created by LEO on 12/29/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#ifndef Common_h
#define Common_h

//-----------------------------------基础配置------------------------------------
/*设备型号*/
#define kiOS_7_OR_LATER         ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define kiOS_8_OR_LATER         ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

/*屏幕尺寸*/
#define kScreenWidth            [UIScreen mainScreen].bounds.size.width
#define kScreenHeight           [UIScreen mainScreen].bounds.size.height
#define kTabBarHeight           49
#define kNavigationBarHeight    64

/*字体*/
#define kBoldFont(x)            [UIFont boldSystemFontOfSize:x]
#define kSystemFont(x)          [UIFont systemFontOfSize:x]

/*颜色*/
#define kRGBColor(R, G, B, A)   [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]


//------------------------------------导航栏-------------------------------------
#define kNavBGColor             kRGBColor(221, 81, 114, 1)

//------------------------------------标签栏-------------------------------------
/*按钮*/
#define kBarButtonCount         4
#define kBarButtonWidth         kScreenWidth / kBarButtonCount
#define kBarButtonHeight        kTabBarHeight

/*按钮文字颜色*/
#define kBarButtonTextColor     kRGBColor(103, 103, 103, 1)
#define kBarButtonTextHighColor kRGBColor(244, 70, 97, 1)

/*按钮图片大小*/
#define kBarButtonImageSize     20

//------------------------------------标签值-------------------------------------
#define kHideTag                1111
#endif /* Common_h */
