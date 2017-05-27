//
//  Main__ViewController.m
//  点家慧2.0
//
//  Created by app on 17/5/10.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "Main__ViewController.h"

@interface Main__ViewController ()

@end

@implementation Main__ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];

}

- (void)initUI{

//调用鸡肋的方法，自定义NavBar
    [self setNavgationBarItemName:@"点慧家"];
    
    CGFloat height = applicationWidth * 227 / 320;
    //首页图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 74, applicationWidth, height)];
    imageView.image = [UIImage imageNamed:@"banner"];
    imageView.layer.cornerRadius = 6;
    imageView.clipsToBounds = YES;
    [self.view addSubview:imageView];
    
    //button
    UIButton *btnLeft = [[UIButton alloc]initWithFrame:CGRectMake(10,imageView.marginY, applicationWidth/2-20, applicationWidth/2-20)];
    [btnLeft setBackgroundImage:[UIImage imageNamed:@"entertainment"] forState:UIControlStateNormal];
    [btnLeft addTarget:self action:@selector(GoToyuLeClick) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"%f    %f",applicationHeight*420/1334,applicationWidth);
    
    [self.view addSubview:btnLeft];
    UIButton *btnRight = [[UIButton alloc]initWithFrame:CGRectMake(btnLeft.width+30, btnLeft.orginY, applicationWidth/2-20, applicationWidth/2-20)];
    UIImage *imageBtnR = [UIImage imageNamed:@"medicine"];
    [btnRight setBackgroundImage:imageBtnR forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(GoToHelpClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnRight];
    
    //tabBar
    self.title =@"首页";
    
}
- (void)GoToyuLeClick{
    YuLe__ViewController *yuleVC = [[YuLe__ViewController alloc]init];
    yuleVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:yuleVC animated:YES];
}
- (void)GoToHelpClick{
    help__ViewController *helpVc = [[help__ViewController alloc]init];
    [self.navigationController pushViewController:helpVc animated:YES];
    
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
