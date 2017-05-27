////
////  DT_PlayVideoViewController.m
////  点家慧2.0
////
////  Created by app on 17/5/25.
////  Copyright © 2017年 inwhoop.com. All rights reserved.
////
//
//#import "DT_PlayVideoViewController.h"
////#import "FullViewController.h"
//
//@interface DT_PlayVideoViewController()
//{
//    UILabel *videoDeciption;
//    UILabel *timeLab;
//}
//
//@end
//
//@implementation DT_PlayVideoViewController
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    [self setNavgationBarItemName:@"房间详情视频"];
//    [self setButtonForBackNavgation];
//    [self initViewUI];
//}
//
//- (void)initViewUI
//{
//    [self initVideo];
//    //视频描述
//    videoDeciption = [[UILabel alloc]initWithFrame:CGRectMake(10,playView.marginY + 15, applicationWidth-20, 88)];
//    videoDeciption.text = @"    这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容";
//    videoDeciption.numberOfLines = 0;
//    [self.view addSubview:videoDeciption];
//    
//    //视频时间发表时间
//    timeLab = [[UILabel alloc]initWithFrame:CGRectMake(applicationWidth - 60, videoDeciption.marginY+13, 50, 20)];
//    timeLab.text = @"09:09:09";
//    timeLab.font = [UIFont systemFontOfSize:11];
//    timeLab.textColor = UIColorFromRGB(0x969696);
//    [self.view addSubview:timeLab];
//
//}
//
//- (void)initVideo{
//    
//    
//    
//    playView = [FMGVideoPlayView videoPlayView];
//    // 视频资源路径
//    [playView setUrlString:@"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"];
//    // 播放器显示位置（竖屏时）
//    playView.frame = CGRectMake(0, 0, applicationWidth, applicationWidth * 9 / 16);
//    // 添加到当前控制器的view上
//    [self.view addSubview:playView];
//    
//    // 指定一个作为播放的控制器
//    playView.contrainerViewController = self;
//    
//    //    [self setupVideoPlayView];
//
//}
//
//@end