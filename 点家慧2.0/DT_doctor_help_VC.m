//
//  DT_doctor_help_VC.m
//  点家慧2.0
//
//  Created by app on 17/5/18.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_doctor_help_VC.h"


@implementation DT_doctor_help_VC
{
    UIButton *docHelpBtn;
}

- (void)viewDidLoad{
    /**
     *  UIButton *btttn = [[UIButton alloc]initWithFrame:CGRectMake(20*iPhone5Width+140*iPhone5Width*(i%4), 120*iPhone5Height +70*iPhone5Height*(i/4), 120*iPhone5Width, 50*iPhone5Height)];
     */
    CGRect frame;
    for (int i=0; i<6; i++) {
        frame.size.width = 282*iPhone5Width;
        frame.size.height = 141*iPhone5Width;
        frame.origin.x = (i % 2) * frame.size.width + (i % 2) * 15+15;
        frame.origin.y = floor(i / 2) * frame.size.height + 10 + (i / 2) * 10;
        docHelpBtn = [[UIButton alloc]initWithFrame:frame];
        docHelpBtn.backgroundColor = [UIColor blueColor];
        [self.view addSubview:docHelpBtn];

        NSLog(@"%d   ,%d",(i%2), (i/2));
    }
    UIButton *helpOnlineBtn = [[UIButton alloc]initWithFrame:CGRectMake( 15, 10, docHelpBtn.width, 2 * docHelpBtn.height+10)];
    helpOnlineBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:helpOnlineBtn];
    
}
@end
