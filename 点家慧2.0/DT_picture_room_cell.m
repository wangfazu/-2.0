//
//  DT_picture_room_cell.m
//  点家慧2.0
//
//  Created by app on 17/5/22.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_picture_room_cell.h"

@implementation DT_picture_room_cell

- (void)initWithTableView_cell:(UITableViewCell *)cell IndexPath:(NSIndexPath *)indexPath{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7, applicationWidth-20, applicationHeight/3-7)];
    imageView.image = [UIImage imageNamed:@"party2"];
    [cell addSubview:imageView];
    
    UIView *numView = [[UIView alloc]initWithFrame:CGRectMake(imageView.width - 50, imageView.height - 25, 45, 18)];
    numView.backgroundColor =[ UIColor blackColor];
    numView.alpha = 0.7;
    [imageView addSubview:numView];
    
    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(19, 5, 35, 11)];
    numLab.text  = [NSString stringWithFormat:@"/10"];
    numLab.textColor = [UIColor whiteColor];
    numLab.font = [UIFont systemFontOfSize:12];
    [numView addSubview:numLab];
    
    UILabel *pic_countLab = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 14, 11)];
//    pic_countLab.backgroundColor = [UIColor whiteColor];
    pic_countLab.font = [UIFont systemFontOfSize:12];
    pic_countLab.textColor = UIColorFromRGB(0x43d3a2);
    pic_countLab.textAlignment = NSTextAlignmentRight;
    pic_countLab.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];

    [numView addSubview:pic_countLab];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, applicationHeight - 100, applicationWidth, 100)];
    bgView.alpha = 0.5;
    bgView.backgroundColor = [UIColor blackColor];
    [self.window addSubview:bgView];
}
@end
