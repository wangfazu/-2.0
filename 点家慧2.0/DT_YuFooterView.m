//
//  DT_YuFooterView.m
//  点家慧2.0
//
//  Created by app on 17/5/12.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_YuFooterView.h"

@implementation DT_YuFooterView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.frame = CGRectMake(0, 0, applicationWidth, 60);
        self.backgroundColor = [UIColor clearColor];
        
        [self addFooterView];
    }
    return self;
    
}

- (void)addFooterView
{
    UIButton *addRoomBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 0, applicationWidth-30, 40)];
    [addRoomBtn setBackgroundImage:[UIImage imageNamed:@"room_classification_background_selected"] forState:UIControlStateNormal];
    addRoomBtn.layer.cornerRadius = 20;
    addRoomBtn.clipsToBounds = YES;
    [addRoomBtn addTarget:self action:@selector(clickedButton) forControlEvents:UIControlEventTouchUpInside];
    [addRoomBtn setTitle:@"+ 创建房间" forState:UIControlStateNormal];
//    [addRoomBtn addTarget:self action:@selector(addRoomClick:) forControlEvents:UIControlEventTouchUpInside];
    [addRoomBtn.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [addRoomBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    
    [self addSubview:addRoomBtn];
    
    //温馨提示Lab
    UILabel *tipLab = [[UILabel alloc]initWithFrame:CGRectMake(0, addRoomBtn.marginY + 10, applicationWidth, 12)];
    tipLab.text = @"你最多可以创建三个房间，普通群组最多容纳五十人";
    tipLab.font = [UIFont systemFontOfSize:12];
    tipLab.textColor = UIColorFromRGB(0x969696);
    tipLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:tipLab];
}

- (void)clickedButton
{
//    if (block)
//    {
//        block();
//    }
    if (_delegate && [_delegate respondsToSelector:@selector(didClickedButton)])
    {
        [_delegate didClickedButton];
    }
}

- (void)setclickedCreate:(clickedCreate)_block
{
    block = _block;
}

@end