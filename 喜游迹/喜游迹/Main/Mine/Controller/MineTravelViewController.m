//
//  MineTravelViewController.m
//  喜游迹
//
//  Created by 远山 on 16/1/4.
//  Copyright © 2016年 Leo_Lei. All rights reserved.
//

#import "MineTravelViewController.h"

@interface MineTravelViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UIScrollView * _scrollview;
    
    UIImage * _image ;
}

@end

@implementation MineTravelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    _scrollview.showsHorizontalScrollIndicator = NO;
    _scrollview.showsVerticalScrollIndicator = NO;
    _scrollview.contentSize = CGSizeMake(kScreenWidth, kScreenHeight-64);
    _scrollview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"theme_travel_bg.jpg"]];
    
    [self.view addSubview:_scrollview];
}

- (IBAction)Building:(id)sender {
     [self _photoPicker:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    if (_image != nil) {
        //建立照片视图
        static NSInteger i = 0;
        
        float ImageWidth = kScreenWidth/3 - 10 ;
        float ImageHeight = kScreenHeight/5 ;
        
        UIImageView * _imageview =[[UIImageView alloc]initWithFrame:CGRectMake(10+i%3*ImageWidth, 10+i*ImageHeight, ImageWidth, ImageHeight)];
        _imageview.image =_image;
        
        _imageview.layer.cornerRadius = 6.0f;
        _imageview.clipsToBounds = YES;
        
        _imageview.layer.cornerRadius = 6.0f;
        _imageview.clipsToBounds = YES;
        
        i++;
        
        [_scrollview addSubview:_imageview];
        
        if (i >= 4) {
            _scrollview.contentSize = CGSizeMake(kScreenWidth, kScreenHeight-64+ (i-4)*ImageHeight);
        }
    
    // 获取沙盒路径
    NSString * path_sandox = NSHomeDirectory();
    
    //设置一个图片的存储路径
    NSString *imagePath =[path_sandox stringByAppendingString:[NSString stringWithFormat:@"/Documents/%li.png",(long)i]];
  
    //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    [UIImagePNGRepresentation(_image) writeToFile:imagePath atomically:YES];
    }
}

//读取沙盒中的图片
- (void)_readimage{
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Docments"] stringByAppendingPathComponent:@".png"];
    UIImage *savedImage = [[UIImage alloc] initWithContentsOfFile:fullPath];
    NSLog(@"readImage:%@", savedImage);
}

- (void)_photoPicker:(BOOL)isCamera
{
    UIImagePickerControllerSourceType sourceType;
    if (isCamera) { // 打开相机
        sourceType =UIImagePickerControllerSourceTypeCamera ;
        //检查相机是否可用
        
        BOOL isCameraAvailable = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
        
        if (!isCameraAvailable) {
            NSLog(@"相机不可用");
            return ;
        }
    } else{
        //打开相册
        sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    
    [self presentViewController:picker animated:YES completion:nil];
}

// UIimagePicker 代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //00 淡出视图控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    //01 得到图片
    _image =[info objectForKey:UIImagePickerControllerOriginalImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end