//
//  DT_mangeTableviewCell.m
//  点家慧2.0
//
//  Created by app on 17/5/27.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_mangeTableviewCell.h"

@implementation DT_mangeTableviewCell



- (void)mangeRoomInitTableViewCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    UIButton *selectBtn = [[UIButton alloc]init];
    selectBtn.frame = CGRectMake(10, 50, 20, 20);
    selectBtn.backgroundColor = [UIColor redColor];
    selectBtn.tag = indexPath.row;
    [selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:selectBtn];
    
    
    
    
}

- (void)selectBtnClick:(UIButton *)btn{
    if (btn.tag == 0) {
        NSLog(@"you select %ld",btn.tag);

    }
    
}
@end
