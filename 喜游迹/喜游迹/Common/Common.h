//
//  Common.h
//  喜游迹
//
//  Created by LEO on 12/29/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#ifndef Common_h
#define Common_h

//***********************************基础配置************************************
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
#define kRGBColor(R, G, B, A)   [UIColor colorWithRed:R / 255.0f green:G / 255.0f blue:B / 255.0f alpha:A]

/*基础背景色*/
#define kBackgroundColor        kRGBColor(239, 239, 239, 1)

/*搜索页背景色*/
#define kSearchBGColor          kRGBColor(232, 235, 244, 1)

//------------------------------------导航栏-------------------------------------
/*导航栏背景色*/
#define kNavBGColor             kRGBColor(221, 81, 114, 1)

//------------------------------------标签栏-------------------------------------
/*按钮*/
#define kBarButtonCount         4
#define kBarButtonWidth         kScreenWidth / kBarButtonCount
#define kBarButtonHeight        kTabBarHeight

/*按钮文字颜色*/
#define kBarButtonTextColor     kRGBColor(103, 103, 103, 1) //标签栏按钮文字颜色
#define kBarButtonTextHighColor kRGBColor(244, 70, 97, 1)   //标签栏按钮文字高亮颜色

/*按钮图片大小*/
#define kBarButtonImageSize     20

//------------------------------------标签值-------------------------------------
#define kHideViewTag            1111

//---------------------------------单元格标识符-----------------------------------
#define kArticleCellId          @"articleCell"              //看世界单元格标识符


//************************************看世界*************************************
#define kRecommendHeaderHeight  50                          //文章分类的视图高度
#define kRecommendViewHeight    250                         //推荐四图的父视图高度

#define kArticleBaseURL         @"http://e-traveltech.com/travelNotes/article/getArticleBlocks"
#define kRecommendBaseURL       @"http://e-traveltech.com/api/operate/getRecommends?app=3&type=4"


//*************************************活动**************************************
#define kActivityBaseURL        @"http://e-traveltech.com/api/operate/getActivities"


//*************************************其他**************************************
/*消除警告*/
#define SuppressPerformSelectorLeakWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)

#endif /* Common_h */

