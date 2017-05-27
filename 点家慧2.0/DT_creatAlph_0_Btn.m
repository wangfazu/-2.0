//
//  DT_creatAlph_0_Btn.m
//  点家慧2.0
//
//  Created by app on 17/5/12.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_creatAlph_0_Btn.h"

@implementation DT_creatAlph_0_Btn
{
    NSMutableArray *RoomNameArr;

}
@synthesize BgvBtnForSelect;

- (void)creatAlpth_0Btn{
//    RoomNameArr = [[NSMutableArray alloc]initWithObjects:@"交友",@"征婚", @"运动",@"健身",@"养生", @"唱歌", @"其他", @"其他",@"交友",@"征婚", @"运动",@"健身",@"养生", @"唱歌", @"其他", @"其他", nil];
//    //创建一个透明的背景
//    BgvBtnForSelect = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, applicationWidth, applicationHeight)];
//    BgvBtnForSelect.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
//    BgvBtnForSelect.hidden = YES;
//    [BgvBtnForSelect addTarget:self action:@selector(dissmissThisBtn:) forControlEvents:UIControlEventTouchUpInside];
//    //将Btn添加在Window上
//    [[[[UIApplication sharedApplication]delegate]window] addSubview:BgvBtnForSelect];
//    
//    //创建背景上面的View机器选项
//    UIView *smallbg = [[UIView alloc]initWithFrame:CGRectMake(iPhone5Width*30, iPhone5Height*311, iPhone5Width*582, iPhone5Height*427)];
//    smallbg.backgroundColor = [UIColor whiteColor];
//    [BgvBtnForSelect addSubview:smallbg];
//    smallbg.alpha = 1;
//    smallbg.layer.cornerRadius = 8;
//    smallbg.clipsToBounds = YES;
//    //font
//    UILabel *titlab = [[UILabel alloc]initWithFrame:CGRectMake(190*iPhone5Width , 50*iPhone5Height, 215*iPhone5Width, 30*iPhone5Height)];
//    titlab.text = @"请选择房间类型";
//    titlab.font = [UIFont systemFontOfSize:15];
//    [smallbg addSubview:titlab];
//    
//    //select type for btn
//    for (int i=0; i<16; i++) {
//        UIButton *btttn = [[UIButton alloc]initWithFrame:CGRectMake(20*iPhone5Width+140*iPhone5Width*(i%4), 120*iPhone5Height +70*iPhone5Height*(i/4), 120*iPhone5Width, 50*iPhone5Height)];
//        //        btttn.backgroundColor = UIColorFromRGB(0xff);
//        //        btttn.layer.cornerRadius = 8;
//        //        btttn.clipsToBounds = YES;
//        //正常 OR 选中 状态图片room_classification_background
//        [btttn setTitle:RoomNameArr[i] forState:UIControlStateNormal];
//        [btttn setTitleColor:UIColorFromRGB(0x323232) forState:UIControlStateNormal];
//        btttn.titleLabel.font = [UIFont systemFontOfSize:12];
//        [btttn setBackgroundImage:[UIImage imageNamed:@"room_classification_background"] forState:UIControlStateNormal];
//        [btttn addTarget:self action:@selector(btn_16_Click:) forControlEvents:UIControlEventTouchUpInside];
//        [btttn setBackgroundImage:[UIImage imageNamed:@"room_classification_background_selected"] forState:UIControlStateSelected];
//        btttn.tag = 300+i;
//        [smallbg addSubview:btttn];
//        
//    }
}
@end
