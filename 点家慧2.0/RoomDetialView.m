//
//  RoomDetialView.m
//  点家慧2.0
//
//  Created by app on 17/5/11.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "RoomDetialView.h"

@implementation RoomDetialView
{
    UITextField *textFild;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavgationBarItemName:@"创建房间"];
    [self setButtonForBackNavgation];
    [self initUI];
    
    // Do any additional setup after loading the view. 324 249
}

- (void)initUI{
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(178*iPhone5Width, self.titleview.marginY+74*iPhone5Height, iPhone5Width*324, 249*iPhone5Height)];
//    imageV.backgroundColor = UIColorFromRGB(0x432b4a);
    imageV.image = [UIImage imageNamed:@"room_background_map"];
    [self.view addSubview:imageV];
    
    //textfild
    textFild = [[UITextField alloc]initWithFrame:CGRectMake(137*iPhone5Width, imageV.marginY+91*iPhone5Height, 340*iPhone5Width, 48*iPhone5Height)];
    textFild.placeholder = @"填写名称 （2-20字）";
    textFild.textAlignment = NSTextAlignmentCenter;
    textFild.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:textFild];
//    textFild.textColor =
    //底部的下划线
    UIView *unDerline = [[UIView alloc]initWithFrame:CGRectMake(137*iPhone5Width, textFild.marginY, 340*iPhone5Width, 1)];
    unDerline.backgroundColor = UIColorFromRGB(0x43d3a2);
    [self.view
     addSubview:unDerline];
    
    //添加房间的btn
    UIButton *addRoomBtn = [[UIButton alloc]initWithFrame:CGRectMake(40*applicationWidth/320, unDerline.marginY+iPhone5Height*103, applicationWidth-80, iPhone5Height*80)];
    [addRoomBtn setBackgroundImage:[UIImage imageNamed:@"room_classification_background_selected"] forState:UIControlStateNormal];
    addRoomBtn.layer.cornerRadius = 24;
    addRoomBtn.clipsToBounds = YES;
    [addRoomBtn setTitle:@"创建" forState:UIControlStateNormal];
    [addRoomBtn addTarget:self action:@selector(addRoomClick) forControlEvents:UIControlEventTouchUpInside];
//    [addRoomBtn setFont:[UIFont systemFontOfSize:18]];
    addRoomBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [addRoomBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    
    [self.view addSubview:addRoomBtn];
    

    
    
}
- (void)addRoomClick{
    if (![textFild.text isEqualToString: @""]) {
        //通知逆向传值 通知名称：@"RoomName"
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RoomName" object:nil userInfo:@{@"房间名":textFild.text}];
//        [self.navigationController popViewControllerAnimated:YES];
        PerfectRoomDetail *perfectRoomVC = [[PerfectRoomDetail alloc ]init];
        perfectRoomVC.roomName = textFild.text;
        [self.navigationController pushViewController:perfectRoomVC animated:YES];

    }
    return;
    
}
@end
