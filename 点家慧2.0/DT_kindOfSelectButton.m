//
//  DT_kindOfSelectButton.m
//  点家慧2.0
//
//  Created by app on 17/5/16.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_kindOfSelectButton.h"

@implementation DT_kindOfSelectButton
{
    UIScrollView *scrollview;
    UIButton *kindBtn ;
    UILabel  *deciptionBtnLab;
    NSArray *btnNameArr;
    NSMutableArray *btnImageArr;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    //将BTN放在scrollView上面
    scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, applicationWidth, 93)];
//    scrollview.delegate = self;
    scrollview.contentSize = CGSizeMake(2*applicationWidth, 93);
    [self.view addSubview:scrollview];
    scrollview.showsHorizontalScrollIndicator = FALSE;//隐藏水平滚动条
    /**
     *  scroll不在自由移动，会根据导航偏移
     */
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    self.view.frame = CGRectMake(applicationWidth, 50, applicationWidth, 93);
    btnNameArr = [[NSArray alloc]initWithObjects:@"征婚",@"交友",@"运动",@"养生",@"健身",@"月跑", nil];
    btnImageArr = [[NSMutableArray alloc]initWithObjects:@"marriage_seeking",@"make_friends",@"motion",@"health",@"bodybuilding",@"sing", nil];

    for (int i=0; i<6; i++) {
        //select kind of button
        kindBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        kindBtn.frame = CGRectMake(10+120*i*iPhone5Width, 15, 40, 40);
        [kindBtn setBackgroundImage:[UIImage imageNamed:btnImageArr[i]] forState:UIControlStateNormal];
        [scrollview addSubview:kindBtn];
        
        //select kind of deciption lab for button
        deciptionBtnLab = [[UILabel alloc]init];
        deciptionBtnLab.frame = CGRectMake(10+120*i*iPhone5Width, 5+50, 40, 40);
        deciptionBtnLab.text = btnNameArr[i];
        deciptionBtnLab.font = [UIFont systemFontOfSize:13];
        deciptionBtnLab.textColor = UIColorFromRGB(0x323232);
        deciptionBtnLab.textAlignment = NSTextAlignmentCenter;
        [scrollview addSubview:deciptionBtnLab];
        
        
    }
}
@end
