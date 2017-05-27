//
//  DT_display_tableView.m
//  点家慧2.0
//
//  Created by app on 17/5/18.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_display_tableView.h"
#import "DT_PlayVideoViewController.h"
#import "VideoPlayViewController.h"
#import "ZXVideo.h"
@implementation DT_display_tableView
{
    UITableView *displayTableView;
    
}

-(void)viewDidLoad{
    
    displayTableView = [[ UITableView alloc]initWithFrame:CGRectMake(0, -44, applicationWidth - 20, applicationHeight)  style:UITableViewStyleGrouped];
    displayTableView.delegate = self;
    displayTableView.dataSource = self;
    [self.view addSubview:displayTableView];
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (applicationWidth-20)/1.265;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 定义唯一标识
    static NSString *CellIdentifier = @"Cell";
    // 通过唯一标识创建cell实例
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [[DT_display_tableView_cell new] initWithTableView_cell:cell];
    }
    else
    {
        //删除cell的所有子视图,避免重用
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    UILabel *titLab = [cell viewWithTag:201];
    titLab.text = @"66666";
    
    UIImageView *mainimageView = [cell viewWithTag:300];
    if (indexPath.row == 9) {
        mainimageView.image = [UIImage imageNamed:@"party2"];;
    }

    
    cell.selectionStyle = UITableViewCellStyleDefault;
    return  cell;
    
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    
//    kind_of_room_VC *kindRoomVC = [[kind_of_room_VC alloc]init];
//    
//    [self.navigationController pushViewController:kindRoomVC animated:YES];

    
    /**
     zx视频 当房间的 style 为视频：跳转至一个viewcontrol，图片和文字，分别加载，TableViewCell 来展现文字、图片两种不同风格的内容
     
     - returns: videoPlayer
     */
    ZXVideo *video = [[ZXVideo alloc] init];
    video.playUrl = @"http://baobab.wdjcdn.com/1451897812703c.mp4";
    video.title = @"Rollin'Wild 圆滚滚的";
    
    VideoPlayViewController *vc = [[VideoPlayViewController alloc] init];
    vc.video = video;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
}

@end
