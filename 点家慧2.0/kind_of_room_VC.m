//
//  kind_of_room_VC.m
//  点家慧2.0
//
//  Created by app on 17/5/22.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "kind_of_room_VC.h"

@implementation kind_of_room_VC
{
    UITableView *detialTableView;
    /**
     * roomStyleTag:
                     0 - > 文字
                     1 - > 图片
                     2 - > 视频
     */
    NSInteger roomStyleTag;
    
}
- (void)viewDidLoad{
    
    [self initUI];
}

- (void)initUI{
    
    roomStyleTag = 1;
    detialTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, applicationWidth, applicationHeight) style:UITableViewStyleGrouped];
    detialTableView.delegate = self;
    detialTableView.dataSource = self;
    [self.view addSubview:detialTableView];
    
    switch (roomStyleTag) {
        case 0:
            [self setNavgationBarItemName:@"房间详情文字"];

            break;
        case 1:
            [self setNavgationBarItemName:@"房间详情图片"];
            
            break;
        case 2:
            [self setNavgationBarItemName:@"房间详情视频"];
            
            break;


    }
    [self setButtonForBackNavgation];
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (roomStyleTag == 0) {
        return 2;
    }
    else if (roomStyleTag == 1){
        return 10;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (roomStyleTag == 0) {
        if (indexPath.row == 0) {
            return 64;
        }else{
            
            return applicationHeight - 128;
        }
    }
    if (roomStyleTag == 1) {
        return applicationHeight/3;
    }
    return applicationHeight;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 定义唯一标识
    static NSString *CellIdentifier = @"Cell";
    // 通过唯一标识创建cell实例
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        //通过roomStyleTag来确定选择的房间类型
      
        switch (roomStyleTag) {
            case 0:
                 [[DT_text_room_cell new] initWithTableView_cell:cell IndexPath:indexPath];
            
                break;
            case 1:
                  [[DT_picture_room_cell new] initWithTableView_cell:cell IndexPath:indexPath] ;
                break;
            case 2:
//                [[DT_video_room_cell new] initWithTableView_cell:cell IndexPath:indexPath];
                break;
                
                
        }
        
    }
    else
    {
        //删除cell的所有子视图,避免重用
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    
    UILabel *titLab = [cell viewWithTag:100];
    titLab.text = @"岁易山";
    
    UILabel *timeLab = [titLab viewWithTag:200];
    timeLab.text = @"05-05";
  
            
    
    cell.selectionStyle = UITableViewCellStyleDefault;
    return  cell;
    
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
//    
//    kind_of_room_VC *kindRoomVC = [[kind_of_room_VC alloc]init];
//    
//    [self.navigationController pushViewController:kindRoomVC animated:YES];
//    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 0;
    
}

@end
