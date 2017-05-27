//
//  RoomDetailDisplay.m
//  点家慧2.0
//
//  Created by app on 17/5/16.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "RoomDetailDisplay.h"

@implementation RoomDetailDisplay
{
  
        UILabel *openOrprivateLab;
        UIButton *headframeViewBtn;
        UILabel *hiddenLab;
        UILabel *roomeDeciption;
        NSMutableArray *btnImageChangeArr;
        UILabel *textFild;
 
  
}
- (void)viewDidLoad{
    [self setNavgationBarItemName:@"房间资料"];
    [self setButtonForBackNavgation];
    [self initUI];
}

- (void)initUI{
    self.view.backgroundColor = UIColorFromRGB(0xf5f5f5);
    //headframe
    headframeViewBtn = [[UIButton alloc]initWithFrame:CGRectMake(iPhone5Width*214, self.titleview.marginY+80*iPhone5Height, iPhone5Width*210, iPhone5Width*211)];
    [headframeViewBtn setBackgroundImage:[UIImage imageNamed:@"default_roomdefault_room"] forState:UIControlStateNormal];
    [headframeViewBtn setImage:self.selectImg forState:UIControlStateNormal];
//    [headframeViewBtn addTarget:self action:@selector(addImageClick:) forControlEvents:UIControlEventTouchUpInside];
    headframeViewBtn.layer.cornerRadius = iPhone5Width*210/2;
    headframeViewBtn.clipsToBounds = YES;
    [self.view addSubview:headframeViewBtn];
    //下滑先上啊的房间名字
    //textfild-RoomName
    textFild = [[UILabel alloc]initWithFrame:CGRectMake(137*iPhone5Width, headframeViewBtn.marginY+40*iPhone5Height, 340*iPhone5Width, 48*iPhone5Height)];
//    textFild.placeholder = @"填写名称 （2-20字）";
    textFild.text = self.roomName;
    textFild.textAlignment = NSTextAlignmentCenter;
    textFild.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:textFild];
    //    textFild.textColor =
    //底部的下划线
    UIView *unDerline = [[UIView alloc]initWithFrame:CGRectMake(137*iPhone5Width, textFild.marginY, 340*iPhone5Width, 1)];
    unDerline.backgroundColor = UIColorFromRGB(0x43d3a2);
    [self.view
     addSubview:unDerline];
    //lab
    UILabel *tLab = [[UILabel alloc]initWithFrame:CGRectMake(iPhone5Width*20, unDerline.marginY+77*iPhone5Height, iPhone5Width*120, 13)];
    tLab.text = @"房间介绍：";
    tLab.textColor = UIColorFromRGB(0x646464);
    tLab.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:tLab];
    //room deciption textfild
    roomeDeciption = [[UILabel alloc]initWithFrame:CGRectMake(iPhone5Width*20, tLab.marginY+10, applicationWidth-40, 90)];
    roomeDeciption.font = [UIFont systemFontOfSize:12];
    roomeDeciption.backgroundColor = UIColorFromRGB(0xffffff);
    roomeDeciption.textAlignment = NSTextAlignmentLeft;
    roomeDeciption.text = self.roomDeciptionLab;
    [self.view addSubview:roomeDeciption];
    
    UILabel *selectLab = [[UILabel alloc]initWithFrame:CGRectMake(iPhone5Width*20, roomeDeciption.marginY+15, iPhone5Width*190, 15)];
    selectLab.font = [UIFont systemFontOfSize:13];
    selectLab.textColor = UIColorFromRGB(0x646464);
    selectLab.text = @"选择开放程度：";
    [self.view addSubview:selectLab];
    //selectBtn 公开 ，私有
    for (int i=0; i<2; i++) {
        NSArray * imgArry =@[@"circle_selected",@"circle_not_selected"];
        UIButton *openBtn = [[UIButton alloc]initWithFrame:CGRectMake(iPhone5Width*38+iPhone5Width*134*i, selectLab.marginY+25, iPhone5Width*30, iPhone5Width*30)];
        [openBtn setBackgroundImage:[UIImage imageNamed:imgArry[i]] forState:UIControlStateNormal];//@"circle_selected"
        openBtn.tag = 20+i;
        [openBtn addTarget:self action:@selector(openOrPrivateClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:openBtn];
        
        
        [btnImageChangeArr addObject:openBtn];
        
        
        openOrprivateLab = [[UILabel alloc]initWithFrame:CGRectMake(86*iPhone5Width+iPhone5Width*134*i, selectLab.marginY+24, iPhone5Width*54, 14)];
        openOrprivateLab.font = [UIFont systemFontOfSize:14];
        openOrprivateLab.textColor = UIColorFromRGB(0x1a1a1a);
        openOrprivateLab.tag = 100+i;
        if (openOrprivateLab.tag == 100 ) {
            openOrprivateLab.text = @"公开";
        }else{
            openOrprivateLab.text = @"私密";
        }
        [self.view addSubview:openOrprivateLab];
    }
    //完成按钮
    UIButton *completeBtn = [[UIButton alloc]initWithFrame:CGRectMake(40*applicationWidth/320, openOrprivateLab.marginY+iPhone5Height*103, applicationWidth-80, iPhone5Height*80)];
    [completeBtn setBackgroundImage:[UIImage imageNamed:@"room_classification_background_selected"] forState:UIControlStateNormal];
    completeBtn.layer.cornerRadius = 24;
    completeBtn.clipsToBounds = YES;
    [completeBtn setTitle:@"保存" forState:UIControlStateNormal];
//    [completeBtn setFont:[UIFont systemFontOfSize:18]];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [completeBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [completeBtn addTarget:self action:@selector(addCompleteClick2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:completeBtn];
    
}

- (void)addCompleteClick2{
    /**
     *  老吕特有的方法，逆向传值。
     */
    YuLe__ViewController *vc;
    for (vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[YuLe__ViewController class]])
        {
            vc.roomName = self.roomName;
            vc.roomDeciptionLab = self.roomDeciptionLab;
            vc.openOrPrivate = self.openOrPrivate;
            vc.selectImg = self.selectImg;
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}
- (void)openOrPrivateClick:(UIButton *)btn{
    NSLog(@"公开或者私密");
}
@end
