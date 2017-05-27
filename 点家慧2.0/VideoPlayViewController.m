//
//  VideoPlayViewController.m
//  ZXVideoPlayer
//
//  Created by Shawn on 16/4/29.
//  Copyright © 2016年 Shawn. All rights reserved.
//

#import "VideoPlayViewController.h"
#import "ZXVideoPlayerController.h"
#import "ZXVideo.h"

@interface VideoPlayViewController ()

@property (nonatomic, strong) ZXVideoPlayerController *videoController;

@end

@implementation VideoPlayViewController
{
    
    
    UILabel *videoDeciption;
    UILabel *timeLab;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    self.view.backgroundColor = [UIColor whiteColor];
       [self initViewUI];
    [self playVideo];
 
}

- (void)playVideo
{
    if (!self.videoController) {
        self.videoController = [[ZXVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, kZXVideoPlayerOriginalWidth, kZXVideoPlayerOriginalHeight)];
        
        
        
        
        __weak typeof(self) weakSelf = self;
        self.videoController.videoPlayerGoBackBlock = ^{
            __strong typeof(self) strongSelf = weakSelf;
            
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
            
            [strongSelf.navigationController popViewControllerAnimated:YES];
            [strongSelf.navigationController setNavigationBarHidden:NO animated:YES];
            
            [[NSUserDefaults standardUserDefaults] setObject:@0 forKey:@"ZXVideoPlayer_DidLockScreen"];
            
            strongSelf.videoController = nil;
        };
        
        self.videoController.videoPlayerWillChangeToOriginalScreenModeBlock = ^(){
            NSLog(@"切换为竖屏模式");
        };
        self.videoController.videoPlayerWillChangeToFullScreenModeBlock = ^(){
            NSLog(@"切换为全屏模式");
        };
        
        [self.videoController showInView:self.view];
    }
    
    self.videoController.video = self.video;
}

- (void)initViewUI
{
    
        [self preferredStatusBarStyle];
        

  
    //视频描述
    videoDeciption = [[UILabel alloc]initWithFrame:CGRectMake(10,kZXVideoPlayerOriginalHeight + 15, applicationWidth-20, 88)];
    videoDeciption.text = @"    这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容";
    videoDeciption.numberOfLines = 0;
    [self.view addSubview:videoDeciption];
    
    //视频时间发表时间
    timeLab = [[UILabel alloc]initWithFrame:CGRectMake(applicationWidth - 60, videoDeciption.marginY+13, 50, 20)];
    timeLab.text = @"09:09:09";
    timeLab.font = [UIFont systemFontOfSize:11];
    timeLab.textColor = UIColorFromRGB(0x969696);
    [self.view addSubview:timeLab];
    
}
-(UIStatusBarStyle)preferredStatusBarStyle

{
    
    return UIStatusBarStyleLightContent;  //默认的值是黑色的
    
}
@end
