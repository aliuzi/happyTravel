//
//  VideoViewController.m
//  喜游迹
//
//  Created by niceDay on 16/1/12.
//  Copyright © 2016年 Leo_Lei. All rights reserved.
//

#import "VideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController (){
    MPMoviePlayerController *playCtrl;
    NSURL *url;
}

@end

@implementation VideoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    url=[NSURL URLWithString:_model.videoName];
    playCtrl=[[MPMoviePlayerController alloc]initWithContentURL:url];
    
    playCtrl.controlStyle=MPMovieControlStyleDefault;
    [playCtrl prepareToPlay];
    
    [self.view addSubview:playCtrl.view];
    
    playCtrl.shouldAutoplay=YES;
    [playCtrl setControlStyle:MPMovieControlStyleNone];
    [playCtrl setFullscreen:YES];
    [playCtrl.view setFrame:self.view.bounds];
    
    [playCtrl prepareToPlay];
    
    playCtrl.useApplicationAudioSession = NO;
    [playCtrl play];
    
}

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
