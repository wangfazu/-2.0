//
//  help__ViewController.m
//  点家慧2.0
//
//  Created by app on 17/5/10.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "help__ViewController.h"

@interface help__ViewController ()

@end

@implementation help__ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI{
    [self setNavgationBarItemName:@"医疗"];
    [self setButtonForBackNavgation];
    //首页滚动视图
    DT_scroller_picture *scroPicVC = [[DT_scroller_picture alloc]init];
    [self addChildViewController:scroPicVC];
    [self.view addSubview:scroPicVC.view];
    scroPicVC.view.frame = CGRectMake(0, 64, applicationWidth, applicationWidth/1.6);
    [scroPicVC didMoveToParentViewController:self];
    
    
    //就医指导
    DT_doctor_help_VC *docHelpVC = [[DT_doctor_help_VC alloc]init];
    [self addChildViewController:docHelpVC];
    [self.view addSubview:docHelpVC.view];
    docHelpVC.view.frame = CGRectMake(0, scroPicVC.view.marginY, applicationWidth, 250);
    [docHelpVC didMoveToParentViewController:self];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
