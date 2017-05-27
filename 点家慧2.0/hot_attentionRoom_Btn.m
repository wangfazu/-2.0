
//
//  hot_attentionRoom_Btn.m
//  点家慧2.0
//
//  Created by app on 17/5/17.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "hot_attentionRoom_Btn.h"

@implementation hot_attentionRoom_Btn
{
    UIButton *leftBtn;
    UIButton *rightBtn;
    
}
-(void)viewDidLoad{
    
    UIView *bGview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, applicationWidth, 60)];
    bGview.backgroundColor = UIColorFromRGB(0xf5f5f5);
    [self.view addSubview:bGview];
    
    UIView *buttonView = [UIView new];
    buttonView.frame = CGRectMake((applicationWidth - 200) / 2, 20, 200, 32);
    buttonView.backgroundColor = UIColorFromRGB(0xffffff);
    buttonView.layer.cornerRadius = 4;
    buttonView.layer.masksToBounds = YES;
    buttonView.layer.borderColor = UIColorFromRGB(0x43d3a2).CGColor;
    buttonView.layer.borderWidth = 1;
    [bGview addSubview:buttonView];
    
    leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 32)];
    leftBtn.tag = 0;
    [leftBtn setTitle:@"热门推荐" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(clickedButtonType:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [leftBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [leftBtn setTitleColor:UIColorFromRGB(0x43d3a2) forState:UIControlStateNormal];
    [leftBtn setBackgroundColor:UIColorFromRGB(0x43d3a2)];
    leftBtn.selected = YES;
    [buttonView addSubview:leftBtn];
    
    rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(leftBtn.marginX, 0, 100, 32)];
    rightBtn.tag = 1;
    [rightBtn setTitle:@"关注房间" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickedButtonType:) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateSelected];
    [rightBtn setTitleColor:UIColorFromRGB(0x43d3a2) forState:UIControlStateNormal];
    [buttonView addSubview:rightBtn];
}

- (void)setClickedTypeButtonBlock:(ClickedTypeButtonBlock)_block
{
    block = _block;
}

- (void)clickedButtonType:(UIButton *)button
{
    if (block)
    {
        block((int)button.tag);
    }
    leftBtn.selected = NO;
    rightBtn.selected = NO;
    [leftBtn setBackgroundColor:nil];
    [rightBtn setBackgroundColor:nil];
    button.selected = YES;
    [button setBackgroundColor:UIColorFromRGB(0x43d3a2)];

}

@end
