//
//  Attention_tableView_cell.m
//  点家慧2.0
//
//  Created by app on 17/5/17.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "Attention_tableView_cell.h"

@implementation Attention_tableView_cell
- (void)initTableViewCell:(UITableViewCell *)cell{
    
    
    cell.backgroundColor = UIColorFromRGB(0xffffff);
    UIButton *imageBtn = [[UIButton alloc]initWithFrame:CGRectMake( iPhone5Width*20, iPhone5Height*30, iPhone5Width*151, iPhone5Width*151)];
    //            imageBtn.backgroundColor = UIColorFromRGB(0x43d3a2);
    [imageBtn setBackgroundImage:[UIImage imageNamed:@"imageBtn"] forState:UIControlStateNormal];
    imageBtn.layer.cornerRadius = iPhone5Width*151/2;
    imageBtn.clipsToBounds = YES;
    [cell addSubview:imageBtn];
    imageBtn.tag = 200;
    
    UILabel *tiLab = [[UILabel alloc]initWithFrame:CGRectMake(imageBtn.marginX+10, 50*iPhone5Height, applicationWidth/4, 20)];
    tiLab.text = @"斯诺克俱乐部";
    tiLab.font = [UIFont systemFontOfSize:14];
    [cell addSubview:tiLab];
    tiLab.tag = 201;
    
    UILabel *timeLab = [[UILabel alloc]initWithFrame:CGRectMake(applicationWidth-imageBtn.width, iPhone5Height*50, tiLab.width, tiLab.height)];
    timeLab.text = @"2017-05-11";
    timeLab.textColor = UIColorFromRGB(0x969696);
    timeLab.font = [UIFont systemFontOfSize:11];
    [cell addSubview:timeLab];
    timeLab.tag = 202;
    
    UILabel *deciptionLab = [[UILabel alloc]initWithFrame:CGRectMake(imageBtn.marginX+10, tiLab.marginY+16*iPhone5Height, applicationWidth-imageBtn.width, tiLab.height)];
    deciptionLab.text = @"如果你喜欢斯诺克运动请加入我们吧...";
    deciptionLab.font = [UIFont systemFontOfSize:12];
    deciptionLab.textColor = UIColorFromRGB(0x646464);
    [cell addSubview:deciptionLab];
    deciptionLab.tag = 203;
    
    UIImageView *peopNumView = [[UIImageView alloc]initWithFrame:CGRectMake(imageBtn.marginX+10, deciptionLab.marginY+12, 33*iPhone5Width, 29*iPhone5Height)];
    peopNumView.image = [UIImage imageNamed:@"room_number"];
    [cell addSubview:peopNumView];
    peopNumView.tag = 204;
    
    UILabel *numCount = [[UILabel alloc]initWithFrame:CGRectMake(peopNumView.marginX+15, deciptionLab.marginY+12, iPhone5Height*80, 29*iPhone5Height)];
    numCount.text = @"150/200";
    numCount.font = [UIFont systemFontOfSize:11];
    [cell addSubview:numCount];
    numCount.tag = 205;
    
    
    
}
@end
