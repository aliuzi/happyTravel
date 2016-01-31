//
//  UIView+UIViewController.m
//  喜游迹
//
//  Created by LEO on 1/4/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "UIView+UIViewController.h"

@implementation UIView (UIViewController)

//  为UIView扩展一个类目, 可以访问到它所递属的视图控制器
- (UIViewController *)belongController {
    UIResponder *responder = self.nextResponder;
    while (responder != nil) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = responder.nextResponder;
    }
    return nil;
}
@end
