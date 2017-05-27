//
//  DT_video_room_cell.m
//  点家慧2.0
//
//  Created by app on 17/5/22.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_video_room_cell.h"
@implementation DT_video_room_cell
{
}

- (void)initWithTableView_cell:(UITableViewCell *)cell IndexPath:(NSIndexPath *)indexPath{
    
//    UIView *bGview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, applicationWidth, 360)];
//    bGview.backgroundColor = [UIColor greenColor];
//    [cell addSubview:bGview];
//    
//    
//    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 380, applicationWidth-20, 90)];
//    nameLab.backgroundColor = [UIColor purpleColor];
//    [cell addSubview:nameLab];
//    
//    playView = [FMGVideoPlayView videoPlayView];
//    // 视频资源路径
//    [playView setUrlString:@"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"];
//    // 播放器显示位置（竖屏时）
//    playView.frame = CGRectMake(0, 0, applicationWidth, cell.bounds.size.width * 9 / 16);
//    // 添加到当前控制器的view上
//    [cell addSubview:playView];
//    
//    // 指定一个作为播放的控制器
//    playView.contrainerViewController = self;
    
    [self setupVideoPlayView];
}

- (void)setupVideoPlayView
{
 
    
}
@end
