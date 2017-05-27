//
//  Base__ViewController.m
//  点家慧2.0
//
//  Created by app on 17/5/10.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "Base__ViewController.h"


@interface Base__ViewController ()

@end

@implementation Base__ViewController
@synthesize titleview,lab,backBtn;

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
    [self preferredStatusBarStyle];//将状态栏，改变为白色
}
#pragma mark - 自定义导航栏
-(void)setNavgationBarItemName:(NSString *)setString{
   titleview= [[UIView alloc]initWithFrame:CGRectMake(0, 0, applicationWidth, 64)];
    [self.view addSubview: titleview];
    titleview.backgroundColor = UIColorFromRGB(0x43d3a2);
    
    lab  = [[UILabel alloc]initWithFrame:CGRectMake(applicationWidth/2-100, 28, 200, 29)];
    lab.textColor = [UIColor whiteColor];
    lab.text = setString;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font=[UIFont systemFontOfSize:18];

    [titleview addSubview:lab];
}
#pragma mark - 自定义，导航栏上面返回的，button

- (void)setButtonForBackNavgation{
    backBtn = [[UIButton alloc]initWithFrame:CGRectMake(12, 30, 13, 23)];
    [backBtn addTarget:self action:@selector(backVCclick) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    [titleview addSubview:backBtn];

}
- (void)backVCclick{
    [self.navigationController popViewControllerAnimated:YES];
    
}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.view endEditing:YES];
//}
#pragma mark - 添加手势，键盘消失
- (void)ViewKyebordDownTap{
    UITapGestureRecognizer *TapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keyBordDownClick: )];
    TapGestureRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:TapGestureRecognizer];
    

}
- (void)keyBordDownClick:(UITapGestureRecognizer *)tap{

    [self.view endEditing:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xfafafa);
    [self ViewKyebordDownTap];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 在导航栏的右边添加一个按钮，做事件响应
- (void)setRightBtnForNavgationWithTitle:(NSString *)btnName btnImage:(NSString *)btnImageName{
    
    UIButton *rightBtnNav = [[UIButton alloc]initWithFrame:CGRectMake(applicationWidth - 37, 30, 54/2, 45/2)];
//    rightBtnNav.backgroundColor = [UIColor redColor];
    [rightBtnNav setBackgroundImage:[UIImage imageNamed:btnImageName] forState:UIControlStateNormal];
    [rightBtnNav addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [titleview addSubview:rightBtnNav];
}


#pragma mark - 自定义状态栏的颜色为黑色，改变为白色

-(UIStatusBarStyle)preferredStatusBarStyle

{
    
    
    return UIStatusBarStyleLightContent;  //默认的值是黑色的
    
}
//- (void)setClickTypeButtonBlock:(clickTypeButtonBlock)_block{
//    block = _block;
//    
//}

- (void)rightBtnClick{
//    if (block) {
//        block([UIImage imageNamed:@"follow"]);
//    }
    NSLog( @"you select this btn!");
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
