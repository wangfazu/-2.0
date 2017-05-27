//
//  Register_ViewController.m
//  点家慧2.0
//
//  Created by app on 17/5/24.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "Register_ViewController.h"

@implementation Register_ViewController
{
    UIView *bgView;
    UITextField *phoneNumTf ;
    UITextField *pWdTf ;
    UIImageView *phoneImageV;
    UIImageView *secretImageV;
    UILabel *lineLab;
    UIButton *loginBtn;
    UIButton *registBtn;
    UIButton *VerificationBtn;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
}

- (void)initUI{
    [self setNavgationBarItemName:@"注册"];
    /**
     *  titleView & lab 来自Base——Viewcontrol
     */
    self.titleview.backgroundColor = [UIColor whiteColor];
    self.lab.textColor = UIColorFromRGB(0x43d3a2);
    [self setButtonForBackNavgation];
    self.view.backgroundColor = UIColorFromRGB(0xf5f5f5);
    
    
    bgView = [[UIView alloc]initWithFrame:CGRectMake(20, self.titleview.marginY+20, applicationWidth-40, 100)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    lineLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 50, bgView.width-30, 1)];
    lineLab.backgroundColor = UIColorFromRGB(0x43d3a2);
    [bgView addSubview:lineLab];
    
    //手机图标 & 密码图标
    phoneImageV = [[UIImageView alloc]initWithFrame:CGRectMake(15, 18, 13, 18)];
    phoneImageV.image = [UIImage imageNamed:@"phone_number"];
    [bgView addSubview:phoneImageV];
    secretImageV = [[UIImageView alloc]initWithFrame:CGRectMake(15,lineLab.marginY + 18, 13, 18)];
    secretImageV.image = [UIImage imageNamed:@"verification_code"];
    [bgView addSubview:secretImageV];
    
    //登陆框 & 密码框
    phoneNumTf = [[UITextField alloc]initWithFrame:CGRectMake(phoneImageV.marginX+ 15, 20, 235, 15)];
    phoneNumTf.placeholder = @"请输入手机号码";
    [bgView addSubview:phoneNumTf];
    pWdTf = [[UITextField alloc]initWithFrame:CGRectMake(secretImageV.marginX+ 15, lineLab.marginY+20, 250, 15)];
    pWdTf.placeholder = @"请输入验证码";
    [bgView addSubview:pWdTf];
    
    //验证码Btn
    VerificationBtn = [[UIButton alloc]initWithFrame:CGRectMake(phoneNumTf.marginX, 10, 75, 30)];
    VerificationBtn.backgroundColor = UIColorFromRGB(0x43d3a2);
    [VerificationBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [VerificationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [VerificationBtn.titleLabel setFont:[UIFont systemFontOfSize:11]];
    VerificationBtn.layer.cornerRadius = 4;
    VerificationBtn.clipsToBounds = YES;
    [bgView addSubview:VerificationBtn];
    
    registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registBtn.frame = CGRectMake(20, bgView.marginY + 40 , applicationWidth-40, (applicationWidth-40)/7.5);
    registBtn.layer.cornerRadius =( applicationWidth - 40)/7.5/2;
    registBtn.clipsToBounds = YES;
    registBtn.backgroundColor = UIColorFromRGB( 0x43d3a2);
    [registBtn setTitle:@"注 册" forState:UIControlStateNormal];
    [registBtn addTarget:self action:@selector(registreThisPhoneNumber) forControlEvents:UIControlEventTouchUpInside];
    [self.view
     addSubview:registBtn];
    
//    registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    registBtn.frame = CGRectMake(20, loginBtn.marginY + 20 , applicationWidth-40, (applicationWidth-40)/7.5);
//    registBtn.layer.cornerRadius =( applicationWidth - 40)/7.5/2;
//    registBtn.clipsToBounds = YES;
//    registBtn.backgroundColor = UIColorFromRGB( 0xffffff);
//    [registBtn setTitle:@"注 册" forState:UIControlStateNormal];
//    [registBtn setTitleColor:UIColorFromRGB(0x43d3a2) forState:UIControlStateNormal];
//    [registBtn.layer setBorderWidth:1];
//    [registBtn.layer setBorderColor:[UIColorFromRGB(0x43d3a2) CGColor]];
//    [registBtn addTarget:self action:@selector(goToRegisterVcClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view
//     addSubview:registBtn];
//
}

- (void)registreThisPhoneNumber{
    
    
}
@end
