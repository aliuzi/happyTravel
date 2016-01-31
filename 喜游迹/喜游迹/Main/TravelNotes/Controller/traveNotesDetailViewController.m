//
//  traveNotesDetailViewController.m
//  喜游迹
//
//  Created by niceDay on 16/1/3.
//  Copyright © 2016年 Leo_Lei. All rights reserved.
//

#import "traveNotesDetailViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
@interface traveNotesDetailViewController ()

@end

@implementation traveNotesDetailViewController{
    
    NSDictionary *_dataDic;
    UIScrollView *_scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    [self.view addSubview:webView];

    [self _loadData];
}

#pragma mark - 解析数据

- (void)_loadData{
    //创建url
    NSString *url=[NSString stringWithFormat:@"http://e-traveltech.com/travelNotes/page/index?travel_id=%@&device_id=aimei867247022839400&plat=aphone&os_version=5.0.1&version=2.7.5&dev_model=MX5&net_type=WIFI&language=1&app=3&channel_id=1160101&invitation_code=&t=1452500996&user_id=0&s=",_notesModel.notesId];
    NSURL *urlStr=[NSURL URLWithString:url];
    [webView loadRequest:[NSURLRequest requestWithURL:urlStr]];
    
    //自适应
    webView.scalesPageToFit=YES;
    webView.delegate=self;
}

////网络请求解析数据
//-(void)_loadData{
//    
//    //创建url
//    NSString *url=[NSString stringWithFormat:@"http://e-traveltech.com/travelNotes/index/getTravelNotes?travel_id=%@&channel_id=1160101&plat=aphone&version=2.7.5&extra=",_notesModel.notesId];
//    //创建manager,返回数据的解析方式
//    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
//    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
//    manager.responseSerializer=[AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
//    
//    //发送请求
//    [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        
//        //获取到响应对象
//        NSDictionary *result=[NSDictionary dictionaryWithDictionary:responseObject];
//                NSLog(@"%@",result);
//        _dataDic=result[@"data"];
//        //传递数据给travelNotesModel
//        [self result:result];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"Error:%@",error);
//    }];
//}
//
//#pragma mark - 传递数据搭建页面
//
////传递数据
//-(void)result:(NSDictionary *)result{
//    
//    //视图背景
//    _dataDic= result[@"data"];
//    NSString *bgImgStr = _dataDic[@"background"];
//    UIImageView *bgImg=[[UIImageView alloc]initWithFrame:self.view.bounds];
//    [bgImg sd_setImageWithURL:[NSURL URLWithString:bgImgStr]];
//    [self.view addSubview:bgImg];
//    
//    //底部视图
//    UIView *bottomView=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-40, kScreenWidth, 40)];
//    bottomView.backgroundColor=[UIColor whiteColor];
//    
//    //底部视图看过人数
//    UIImageView *watchedImage=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
//    [watchedImage setImage:[UIImage imageNamed:@"view_icon_gray@3x.png"]];
//    watchedImage.contentMode=UIViewContentModeScaleAspectFill;
//    [bottomView addSubview:watchedImage];
//    UILabel *watchedLable=[[UILabel alloc]initWithFrame:CGRectMake(37, 5, 40, 30)];
//    NSString *watchedStr=_dataDic[@"browse_nr"];
//    watchedLable.text=watchedStr;
//    watchedLable.textColor=[UIColor lightGrayColor];
//    watchedLable.font=[UIFont systemFontOfSize:13.0f];
//    [bottomView addSubview:watchedLable];
//    
//    //底部视图评论数
//    UIImageView *commentImage=[[UIImageView alloc]initWithFrame:CGRectMake(80, 5, 30, 30)];
//    [commentImage setImage:[UIImage imageNamed:@"comment_icon_gray@3x.png"]];
//    commentImage.contentMode=UIViewContentModeScaleAspectFill;
//    [bottomView addSubview:commentImage];
//    UILabel *commentLable=[[UILabel alloc]initWithFrame:CGRectMake(113, 5, 40, 30)];
//    NSString *commentStr=_dataDic[@"comment_nr"];
//    commentLable.text=commentStr;
//    commentLable.textColor=[UIColor lightGrayColor];
//    commentLable.font=[UIFont systemFontOfSize:13.0f];
//    [bottomView addSubview:commentLable];
//    
//    //添加底部视图
//    [self.view addSubview:bottomView];
//    
//    //搭建scrollview
//    [self _createScrollView];
//}
//
//#pragma mark - 搭建scrollview
//
//-(void)_createScrollView{
//    
//    //用户字典
//    NSDictionary *userDic=_dataDic[@"user"];
//    
//    //图片数组
//    NSArray *imageArray=_dataDic[@"images"];
//    
//    //存储所有图片信息的数组
//    NSMutableArray *allIamgeArray=[[NSMutableArray alloc]init];
//    
//    //解析出图片数组所有字典到一个新的数组里
//    NSNumber *arrayCount=_dataDic[@"day_count"];
//    for (NSDictionary *imgDic in imageArray) {
//        NSArray *imageArray1=imgDic[@"marks"];
//        for (NSDictionary *imgDic2 in imageArray1) {
//            NSArray *imageArray2=imgDic2[@"marks"];
//            for (NSDictionary *imageDic in imageArray2) {
//                [allIamgeArray addObject:imageDic];
//                NSLog(@"%@",imageDic)
//                ;
//            }
//        }
//    }
//    
//    //滚动视图页数
//    NSNumber *pageCount=[_dataDic objectForKey:@"image_count"];
//    int pageCountInt=[pageCount intValue];
//    
//    //创建scrollView
//    _scrollView=[[UIScrollView alloc]init];
//    _scrollView.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight-104);
//    _scrollView.backgroundColor=[UIColor clearColor];
//    [_scrollView setContentSize:CGSizeMake(kScreenWidth*(pageCountInt+2), kScreenHeight-104)];
//    [_scrollView setPagingEnabled:YES];
//    _scrollView.showsHorizontalScrollIndicator=NO;
//    _scrollView.showsVerticalScrollIndicator=NO;
//    [self.view addSubview:_scrollView];
//    
//    //创建滑动视图
//    for (int i=0; i<pageCountInt+2; i++ ) {
//        UIView *subView=[[UIView alloc]initWithFrame:CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight-104)];
//        subView.backgroundColor=[UIColor clearColor];
//        
//        //第一张页面处理
//        if (i==0) {
//            
//            //背景图片
//            NSString *bgImageStr=_dataDic[@"face"];
//            UIImageView *bgImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-104)];
//            bgImage.contentMode=UIViewContentModeScaleAspectFill;
//            [bgImage sd_setImageWithURL:[NSURL URLWithString:bgImageStr]];
//            bgImage.clipsToBounds=YES;
//            [subView addSubview:bgImage];
//            
//            //播放背景
//            UIImageView *playBgImage=[[UIImageView alloc]initWithFrame:CGRectMake(10 , kScreenHeight-220, kScreenWidth-20, 110)];
//            playBgImage.contentMode=UIViewContentModeScaleToFill;
//            [playBgImage setImage:[UIImage imageNamed:@"travelnote_cover_bg.png"]];
//            [bgImage addSubview:playBgImage];
//
//            //播放按钮
//            UIButton *playButton=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth/2-30, kScreenHeight-290, 60, 60)];
//            [playButton setImage:[UIImage imageNamed:@"video_play@3x.png"] forState:UIControlStateNormal];
//            [bgImage addSubview:playButton];
//            
//            //游记名称
//            UILabel *notesLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, kScreenHeight-220, kScreenWidth-20, 40)];
//            notesLabel.backgroundColor=[UIColor clearColor];
//            NSString *notesStr=_dataDic[@"title"];
//            notesLabel.text=notesStr;
//            notesLabel.textAlignment=NSTextAlignmentCenter;
//            notesLabel.font=[UIFont systemFontOfSize:20.0f];
//            notesLabel.textColor=[UIColor whiteColor];
//            [bgImage addSubview:notesLabel];
//            UILabel *notesLabel1=[[UILabel alloc]initWithFrame:CGRectMake(9, kScreenHeight-221, kScreenWidth-20, 40)];
//            notesLabel1.backgroundColor=[UIColor clearColor];
//            notesLabel1.text=notesStr;
//            notesLabel1.textAlignment=NSTextAlignmentCenter;
//            notesLabel1.font=[UIFont systemFontOfSize:20.0f];
//            notesLabel1.textColor=[UIColor blackColor];
//            [bgImage addSubview:notesLabel1];
//            
//            //用户头像
//            UIImageView *userImg=[[UIImageView alloc]initWithFrame:CGRectMake(15, kScreenHeight-185, 65, 65)];
//            NSString *userImgStr=userDic[@"logo"];
//            [userImg sd_setImageWithURL:[NSURL URLWithString:userImgStr]placeholderImage:[UIImage imageNamed:@"image_icon_large@3x.png"]];
//            userImg.layer.masksToBounds=YES;
//            userImg.layer.cornerRadius=32.5f;
//            [bgImage addSubview:userImg];
//            
//            //用户昵称
//            UILabel *userName=[[UILabel alloc]initWithFrame:CGRectMake(85, kScreenHeight-165, kScreenWidth/2, 30)];
//            NSString *userNameStr=userDic[@"name"];
//            userName.text=[NSString stringWithFormat:@"导演／%@",userNameStr];
//            userName.textColor=[UIColor whiteColor];
//            userName.font=[UIFont systemFontOfSize:17.0f];
//            [bgImage addSubview:userName];
//            UILabel *userName1=[[UILabel alloc]initWithFrame:CGRectMake(84, kScreenHeight-166, kScreenWidth/2, 30)];
//            userName1.text=[NSString stringWithFormat:@"导演／%@",userNameStr];
//            userName1.textColor=[UIColor blackColor];
//            userName1.font=[UIFont systemFontOfSize:17.0f];
//            [bgImage addSubview:userName1];
//            
//            //通过时间戳获取游记时间
//            NSNumber *notesDate=_dataDic[@"start_time"];
//            NSString *dateStr=[NSString stringWithFormat:@"%@",notesDate];
//            NSTimeInterval time=[dateStr doubleValue]+28800;
//            NSDate *date=[NSDate dateWithTimeIntervalSince1970:time];
//            NSDateFormatter *yearDateFormatter=[[NSDateFormatter alloc]init];
//            [yearDateFormatter setDateFormat:@"yyyy"];
//            NSString *yearStr=[yearDateFormatter stringFromDate:date];
//            NSDateFormatter *monthAndDayDateFormatter=[[NSDateFormatter alloc]init];
//            [monthAndDayDateFormatter setDateFormat:@"MM/dd"];
//            NSString *MonthAndDayStr=[monthAndDayDateFormatter stringFromDate:date];
//
//            //游记日期
//            UILabel *notesYear=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-80, kScreenHeight-180, 70, 40)];
//            notesYear.text=yearStr;
//            notesYear.font=[UIFont systemFontOfSize:19.0f];
//            notesYear.textAlignment=NSTextAlignmentCenter;
//            notesYear.textColor=[UIColor whiteColor];
//            [bgImage addSubview:notesYear];
//            UILabel *notesYear1=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-79, kScreenHeight-181, 70, 40)];
//            notesYear1.text=yearStr;
//            notesYear1.font=[UIFont systemFontOfSize:19.0f];
//            notesYear1.textAlignment=NSTextAlignmentCenter;
//            notesYear1.textColor=[UIColor blackColor];
//            [bgImage addSubview:notesYear1];
//            UILabel *notesMonthAndDay=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-80, kScreenHeight-150, 70, 30)];
//            notesMonthAndDay.text=MonthAndDayStr;
//            notesMonthAndDay.font=[UIFont systemFontOfSize:16.0f];
//            notesMonthAndDay.textAlignment=NSTextAlignmentCenter;
//            notesMonthAndDay.textColor=[UIColor whiteColor];
//            [bgImage addSubview:notesMonthAndDay];
//            UILabel *notesMonthAndDay1=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-79, kScreenHeight-151, 70, 30)];
//            notesMonthAndDay1.text=MonthAndDayStr;
//            notesMonthAndDay1.font=[UIFont systemFontOfSize:16.0f];
//            notesMonthAndDay1.textAlignment=NSTextAlignmentCenter;
//            notesMonthAndDay1.textColor=[UIColor blackColor];
//            [bgImage addSubview:notesMonthAndDay1];
//        }
//        
//        
//        //中间每页的处理
//        else if(i<pageCountInt+1&&i>0){
//            
//            //取出图片数组里的图片字典信息
//            NSDictionary *imageDic=[allIamgeArray objectAtIndex:i-1];
//            
//            //计算图片长宽
//            NSNumber *imageWidth=imageDic[@"width"];
//            NSNumber *imageHeight=imageDic[@"height"];
//            if (imageWidth>imageHeight) {
//                UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake((i-(i-1)-1)*kScreenWidth+10, 40, kScreenWidth-20, kScreenHeight/3)];
//                NSString *imageStr=imageDic[@"url"];
//                [image sd_setImageWithURL:[NSURL URLWithString:imageStr]];
//                [subView addSubview:image];
//            }
//            else{
//                UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake((i-(i-1)-1)*kScreenWidth+kScreenWidth/8, 40, kScreenWidth/4*3, kScreenHeight/4*3)];
//                NSString *imageStr=imageDic[@"url"];
//                [image sd_setImageWithURL:[NSURL URLWithString:imageStr]];
//                [subView addSubview:image];
//            }
////            UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(i*kScreenWidth+10, 20, kScreenWidth, kScreenHeight)];
////            NSString *imageStr=imageDic[@"url"];
////            NSLog(@"%@",imageStr);
////            [image sd_setImageWithURL:[NSURL URLWithString:imageStr]];
////            [subView addSubview:image];
//        }
//        
//        //最后的视图处理
//        else {
//            
//            //用户头像
//            UIImageView *userImg=[[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*i+kScreenWidth/2-32, kScreenHeight/9, 64, 64)];
//            NSString *userImgStr=userDic[@"logo"];
//            [userImg sd_setImageWithURL:[NSURL URLWithString:userImgStr]placeholderImage:[UIImage imageNamed:@"image_icon_large@3x.png"]];
//            userImg.layer.masksToBounds=YES;
//            userImg.layer.cornerRadius=32;
//            [subView addSubview:userImg];
//            
//            //用户昵称
//            UILabel *userName=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth*(i-1)+10, kScreenHeight/9+64, kScreenWidth-20, 35)];
//            NSString *userNameStr=userDic[@"name"];
//            userName.text=[NSString stringWithFormat:@"导演／%@",userNameStr];
//            userName.textColor=[UIColor blackColor];
//            userName.textAlignment=NSTextAlignmentCenter;
//            userName.font=[UIFont systemFontOfSize:17.0f];
//            [subView addSubview:userName];
//            UILabel *userName1=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth*(i-1)+9, kScreenHeight/9+64, kScreenWidth-20, 35)];
//            userName1.text=[NSString stringWithFormat:@"导演／%@",userNameStr];
//            userName1.textColor=[UIColor whiteColor];
//            userName1.textAlignment=NSTextAlignmentCenter;
//            userName1.font=[UIFont systemFontOfSize:17.0f];
//            [subView addSubview:userName1];
//            
//            //广告语
//            UILabel *logeText=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth*(i-1)+10, kScreenHeight/9+100, kScreenWidth-20, 35)];
//            logeText.text=[NSString stringWithFormat:@"嘻游记，做生活的导演"];
//            logeText.textColor=[UIColor whiteColor];
//            logeText.textAlignment=NSTextAlignmentCenter;
//            logeText.font=[UIFont systemFontOfSize:16.0f];
//            [subView addSubview:logeText];
//            UILabel *logeText1=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth*(i-1)+9, kScreenHeight/9+99, kScreenWidth-20, 35)];
//            logeText1.text=[NSString stringWithFormat:@"嘻游记，做生活的导演"];
//            logeText1.textColor=[UIColor lightGrayColor];
//            logeText1.textAlignment=NSTextAlignmentCenter;
//            logeText1.font=[UIFont systemFontOfSize:16.0f];
//            [subView addSubview:logeText1];
//        }
//            
//        [_scrollView addSubview:subView];
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
