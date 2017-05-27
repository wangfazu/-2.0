//
//  DT_display_tableView_cell.m
//  点家慧2.0
//
//  Created by app on 17/5/18.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_display_tableView_cell.h"

@implementation DT_display_tableView_cell
- (void)initWithTableView_cell:(UITableViewCell *)cell{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, applicationWidth-20, (applicationWidth-20)/1.775)];
    imageView.tag = 300;
    imageView.image = [UIImage imageNamed:@"party"];
    [cell addSubview:imageView];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 19+imageView.marginY, 200, 14)];
    titleLab.text = @"2029.13.09聚会视频";
    titleLab.font = [UIFont systemFontOfSize:14];
    titleLab.textColor = UIColorFromRGB(0x1a1a1a);
//    <#Description#>.textAlignment =
    [cell addSubview:titleLab];
    
    UILabel *timeLab = [[UILabel alloc]initWithFrame:CGRectMake(applicationWidth - 100, imageView.marginY+15, 100, 11)];
    timeLab.text = @"25:23:61";
    timeLab.font = [UIFont systemFontOfSize:11];
    timeLab.textColor = UIColorFromRGB(0x969696);
//    timeLab.textAlignment =
    [cell addSubview:timeLab];
    
    UILabel *priceLab = [[UILabel alloc]initWithFrame:CGRectMake(10, titleLab.marginY+15, applicationWidth - 20, 17)];
    priceLab.text = @"￥666";
    priceLab.font = [UIFont systemFontOfSize:17];
    priceLab.textColor = UIColorFromRGB(0x43d3a2);
//    priceLab.textAlignment =
    [cell addSubview:priceLab];

}
@end
