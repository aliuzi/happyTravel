//
//  TabBarItem.m
//  喜游迹
//
//  Created by LEO on 12/29/15.
//  Copyright © 2015 Leo_Lei. All rights reserved.
//

#import "TabBarItem.h"
@interface TabBarItem()

@property (nonatomic, strong)UIImage *normalImage;
@property (nonatomic, strong)UIImage *highlightImage;

@end

@implementation TabBarItem

- (instancetype)initWithTabBarButtonFrame:(CGRect)frame
                              normalImage:(NSString *)normalName
                           highlightImage:(NSString *)highlightName
                                textLabel:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        //  1)创建按钮的图片视图(大小为20 * 20)
        _normalImage = [UIImage imageNamed:normalName];
        _highlightImage = [UIImage imageNamed:highlightName];
        
        CGRect imageFrme = CGRectMake((frame.size.width - kBarButtonImageSize) / 2, 5,
                                      kBarButtonImageSize, kBarButtonImageSize);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrme];
        
        //  设置默认图片
        imageView.image = _normalImage;
        
        //  图片自适应
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        //  2)创建标题视图
        CGFloat maxY = CGRectGetMaxY(imageFrme);
        CGRect labelFrame = CGRectMake(0, maxY, frame.size.width, kBarButtonImageSize);
        UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
        
        label.text = title;
        
        //  设置文本相关属性
        label.textColor = kBarButtonTextColor;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = kSystemFont(13);
        [self addSubview:label];
    }
    return self;
}

- (void)setEnabled:(BOOL)enabled {
    //  获得已添加的图片视图, 和文本视图
    UIImageView *imageView = (UIImageView *)self.subviews[0];
    UILabel *label = (UILabel *)self.subviews[1];
    
    if (enabled == NO) {
        //  不可响应状态时, 显示高亮图片, 字体颜色变为红色
        imageView.image = _highlightImage;
        label.textColor = kBarButtonTextHighColor;
    }else {
        //  响应状态时, 则图片, 字体颜色和图片颜色一致
        imageView.image = _normalImage;
        label.textColor = kBarButtonTextColor;
    }
}

@end
