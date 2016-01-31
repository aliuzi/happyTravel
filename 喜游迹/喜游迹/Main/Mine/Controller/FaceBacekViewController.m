//
//  FaceBacekViewController.m
//  喜游迹
//
//  Created by 远山 on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import "FaceBacekViewController.h"
#import "RegexKitLite.h"
@interface FaceBacekViewController ()<UIAlertViewDelegate>
{
    __weak IBOutlet UITextView *_MessageTextView;  //反馈内容
    
    __weak IBOutlet UITextView *IdTextView;  // 用户id,手机号码，邮箱
    
    __weak IBOutlet UIButton *Button;
}

@property (nonatomic,assign) BOOL PersonID;

@end

@implementation FaceBacekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRGBColor(200, 200, 200, 1);
    
    // TextView 的基本属性设置
    //字体的对齐
    _MessageTextView.textAlignment = NSTextAlignmentLeft;
    //字体大小
    _MessageTextView.font = kSystemFont(15);
    //取消滚动视图的内容自动调整
    self.automaticallyAdjustsScrollViewInsets = NO;
    //内容是否可以修改
    _MessageTextView.editable = YES;
    
    //边框设置
    _MessageTextView.layer.cornerRadius = 6.0f;
    _MessageTextView.layer.borderWidth = 2.0f;
    
    IdTextView.editable = YES;
    IdTextView.layer.cornerRadius = 6.0f;
    IdTextView.layer.borderWidth = 2.0f;
    
    Button.layer.cornerRadius = 6.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SubmitFaceback:(id)sender {
    // 判断id是否正确
    if (_MessageTextView.text.length == 0) {
        _PersonID = NO;
    }
    else if (_MessageTextView.text.length != 0 ){
        NSString *regex1 = @"^1[3,5,8][0-9]{9}$"; // 手机号码
        NSArray *text = [IdTextView.text componentsMatchedByRegex:regex1];
        
        if (text.count == 0) {
            //不匹配，弹框。提示id不正确，请重新输入
            _PersonID = NO;
        }
        else if (text.count != 0){
            //匹配，提示发送成功
            _PersonID = YES;
        }
    }
    
    //建立一个弹框视图 提示是否提交反馈
    //反馈消息不为空
    if (_MessageTextView.text.length == 0) {
        _PersonID = NO;
    }
    else if (_MessageTextView.text.length != 0 ){
        NSString *regex1 = @"^1[3,5,8][0-9]{9}$"; // 手机号码
        NSArray *text = [IdTextView.text componentsMatchedByRegex:regex1];
        
        if (text.count == 0) {
            //不匹配，弹框。提示id不正确，请重新输入
            _PersonID = NO;
        }
        else if (text.count != 0){
            //匹配，提示发送成功
            _PersonID = YES;
        }
    }
    
    if (_PersonID == YES) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"编辑成功"
                                                       message:@"是否确认发送"
                                                      delegate:self
                                             cancelButtonTitle:@"否"
                                             otherButtonTitles:@"是", nil];
            [alert show];
    }
//     反馈消息为空
    else if(_PersonID == NO){
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"手机号码错误"
                                                   message:@"是否重新编辑"
                                                  delegate:self
                                         cancelButtonTitle:@"否"
                                         otherButtonTitles:@"是", nil];
        [alert show];
    }
}

// AlertView 的点击事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [self SaveMessage];
    }
}

- (void)SaveMessage{
    //保存到本地文件
    
    //沙盒地址
//    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Docments"] stringByAppendingPathComponent:@".text"];
//    NSString * Savemessage = [NSString stringWithContentsOfFile:fullPath encoding:nil error:nil];
   
    //发送成功清空输入框内容
    _MessageTextView.text = nil;
    IdTextView.text = nil;
}

@end