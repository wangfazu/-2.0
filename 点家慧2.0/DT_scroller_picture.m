//
//  DT_scroller_picture.m
//  点家慧2.0
//
//  Created by app on 17/5/18.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_scroller_picture.h"

@implementation DT_scroller_picture
{
    UIScrollView *picScroView;
    UIImageView *imageV;
    UIButton *select_no_btn;
    CGFloat btnTag;
}

- (void)viewDidLoad{
    
    picScroView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, applicationWidth,(applicationWidth)/1.828)];
    picScroView.delegate = self;
    picScroView.contentSize = CGSizeMake(5*applicationWidth, (applicationWidth)/1.828);
    [self.view addSubview:picScroView];
    picScroView.showsHorizontalScrollIndicator = FALSE;//隐藏水平滚动条
    
    for (int i=1; i<6; i++) {
        imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10+applicationWidth*i, 10, applicationWidth - 20, (applicationWidth-20)/1.83)];
        imageV.image = [UIImage imageNamed:@"ylmain"];
        [picScroView addSubview:imageV];
        
        //button under picture

            select_no_btn = [[UIButton alloc]initWithFrame:CGRectMake(277*iPhone5Width+12*i, imageV.marginY+10, 6, 6)];
            [select_no_btn setBackgroundImage:[UIImage imageNamed:@"dot"] forState:UIControlStateNormal];
            select_no_btn.tag = i;
            [self.view addSubview:select_no_btn];
        
    }
    
    
 


    NSTimer *timerNew = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(xunhuanClick:) userInfo:nil repeats:YES];
     [timerNew setFireDate:[NSDate distantPast]];
    

   
}

- (void)xunhuanClick:(UIButton *)btn{

    CGFloat moveNum = picScroView.contentOffset.x;//偏移量
    if (moveNum == 5*applicationWidth) {
        moveNum = 0;
        
    }
    moveNum = moveNum + applicationWidth;
    btnTag = moveNum/applicationWidth;
    [picScroView setContentOffset:CGPointMake(moveNum, 0) animated:YES];
    NSLog(@"%f",moveNum/applicationWidth);
    btn = [self.view viewWithTag:btnTag];
    [btn setBackgroundImage:[UIImage imageNamed:@"dot_selected"] forState:UIControlStateNormal];
    if (btnTag == 1) {//当 tag= 1时候，把 tag= 5 的button 的背景设置为空状态
        UIButton *firstBtn = [self.view viewWithTag:5];
        [firstBtn setBackgroundImage:[UIImage imageNamed:@"dot"] forState:UIControlStateNormal];
    }
    if (btnTag>1) {// 把每一个tag 前面的button的背景设置为 空状态

        UIButton *nextBtn = [self.view viewWithTag:btnTag-1];
        [nextBtn setBackgroundImage:[UIImage imageNamed:@"dot"] forState:UIControlStateNormal];
        
    }
    




}

@end
