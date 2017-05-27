//
//  DT_mangeRoom.m
//  点家慧2.0
//
//  Created by app on 17/5/26.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_mangeRoom.h"
#import "DT_mangeTableviewCell.h"

@implementation DT_mangeRoom
{
    UITableView *displayTableView;
    
}

-(void)viewDidLoad{
    [self initUI];
    
}

- (void)initUI{
    self.view.backgroundColor = UIColorFromRGB(0xf5f5f5);
    [self setNavgationBarItemName:@"文件管理"];
    [self setButtonForBackNavgation];
    [self creatTableView];


    
}
- (void)creatTableView{
    
    displayTableView = [[ UITableView alloc]initWithFrame:CGRectMake(0, 64, applicationWidth, applicationHeight)  style:UITableViewStyleGrouped];
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
        [[DT_mangeTableviewCell new ] mangeRoomInitTableViewCell:cell indexPath:indexPath];
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    NSArray *imageArr = @[@"release_video",@"release_picture",@"post_text"];
    
    for (int i =0; i<3; i++) {
        /**
         *  发表文字，图片，视频 按钮
         */
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(15+200*iPhone5Width*i, 15, 95, 40);
        btn.tag = 100+i;
        btn.backgroundColor = UIColorFromRGB( 0xffffff);
        [btn.layer setBorderColor:[UIColorFromRGB(0x43d3a2) CGColor]];
        [btn.layer setBorderWidth:1];
        btn.layer.cornerRadius = 5;
        btn.clipsToBounds =YES;
        [btn addTarget:self action:@selector(pushCLick:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
        [btn setTitleColor:UIColorFromRGB(0x323232) forState:UIControlStateNormal];
        
        [tableView addSubview:btn];
        
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(12, 10, 20, 20)];
        imageV.image = [UIImage imageNamed:imageArr[i]];
//        imageV.backgroundColor = [UIColor orangeColor];
        [btn addSubview:imageV];
        
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(imageV.marginX+6, 11, 65, 16)];
        NSArray *labArr = @[@"发布视频",@"发布图片",@"发布文字"];
        lab.text = labArr[i];
        lab.font = [UIFont systemFontOfSize:13];
        lab.textColor = UIColorFromRGB(0x323232);
        [btn addSubview:lab];
        
    }
    return 66;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSLog(@"are you ok?");
    
}
- (void)pushCLick:(UIButton *)btn{
    
    NSLog(@"push click come!");
    switch (btn.tag) {
        case 100:
            [self.navigationController pushViewController:[DT_pushVideoVC new] animated:YES];
            break;
        case 101:
            [self.navigationController pushViewController:[DT_pushPictureVC         new] animated:YES];
            break;
        case 102:
            [self.navigationController pushViewController:[DT_pushTextVC new] animated:YES];
            break;
    
    }
    
}

@end
