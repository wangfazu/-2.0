//
//  room_display.m
//  点家慧2.0
//
//  Created by app on 17/5/17.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "room_display.h"

@implementation room_display

{
    UIButton *leftBtn ;
    UIButton *rightBtn;
    UIScrollView *scrollView;
    BOOL roomMange;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    roomMange = YES;
    [self initUI];
    
}

- (void)initUI{
    
    [self setNavgationBarItemName:@"房间详情"];
    [self setRightBtnMangeRoom];//管理员管理房间
    [self setButtonForBackNavgation];
    [self creat_Left_Right_Btn];
    [self creatScrollView];
    [self creat_Left_displayTableView];

    
}
- (void)creat_Left_Right_Btn{
    //两个来回切换.页面的Btn
    leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.titleview.height, applicationWidth*160/320, applicationHeight*45/568)];
    [leftBtn setTitle:@"展示区" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    leftBtn.tag  = 100;
    [leftBtn addTarget:self action:@selector(changeViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    
    rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(leftBtn.width+1, self.titleview.height, applicationWidth*160/320, applicationHeight*45/568)];
    rightBtn.tag = 101;
    [rightBtn setTitle:@"互动" forState:UIControlStateNormal];
    //button之间的那条线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(leftBtn.width, self.titleview.height, 1, leftBtn.height)];
    line.backgroundColor = UIColorFromRGB(0xe6e6e6);
    [self.view addSubview:line];
    
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(changeViewClick:) forControlEvents:UIControlEventTouchUpInside];
    
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];

}

- (void)creatScrollView{
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(10, leftBtn.marginY+10, applicationWidth-20, applicationHeight)];
    scrollView.delegate=self;
    scrollView.contentSize = CGSizeMake(2*applicationWidth, applicationHeight);
    [self.view addSubview:scrollView];

    
}
- (void)changeViewClick:(UIButton *)button{
    
    leftBtn.selected = NO;
    rightBtn.selected = NO;
    [leftBtn setBackgroundColor:nil];
    [rightBtn setBackgroundColor:nil];
    button.selected = YES;
    [button setTitleColor:UIColorFromRGB(0x43d3a2) forState:UIControlStateSelected];
    [self scrollerView:button.tag];
}

- (void)scrollerView:(NSInteger)tag
{
    
    [UIView animateWithDuration:0.75 animations:^{
        [scrollView setContentOffset:CGPointMake( (tag-100) * applicationWidth, 0) animated:NO];
        if (tag ==101) {
            //触发登陆条件
            [self.navigationController pushViewController:[Login_viewController new] animated:YES];
            
        }
        
    } ];
}

- (void)creat_Left_displayTableView{
    DT_display_tableView *displayVC = [[DT_display_tableView alloc]init];
    [self addChildViewController:displayVC];
    [scrollView addSubview:displayVC.view];
    displayVC.view.frame = CGRectMake(0, 0, applicationWidth, 588*iPhone5Height);
    [displayVC didMoveToParentViewController:self];
    displayVC.automaticallyAdjustsScrollViewInsets = false;

}

- (void)setRightBtnMangeRoom{
    UIButton *roomMangeBtn = [[UIButton alloc]initWithFrame:CGRectMake(applicationWidth - 37, 35, 18, 18)];

    [roomMangeBtn setBackgroundImage:[UIImage imageNamed:@"edit@2x (2)"    ] forState:UIControlStateNormal];
    [roomMangeBtn addTarget:self action:@selector(rightBtnMangeClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.titleview addSubview:roomMangeBtn];
    
}

- (void)rightBtnMangeClick:(UIButton *)btn{
    if (roomMange==YES) {
        NSLog(@"start mange room my hoomer!");
        
//        btn.frame = CGRectMake(applicationWidth - 37, 24, 19, 31.5);
//        [btn setImage:[UIImage imageNamed:@"edit"] forState:UIControlStateSelected];
        DT_mangeRoom *mrVC = [DT_mangeRoom new];
        [self.navigationController pushViewController:mrVC animated:YES];

    }
    
}

-(void)imageLong{
    //初始化提示框
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //按钮一
    [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        pic.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
        
//        [self presentViewController:pic animated:YES completion:nil];
    }]];
    //按钮二
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        pic.sourceType=UIImagePickerControllerSourceTypeCamera;
        
//        [self presentViewController:pic animated:YES completion:nil];
    }]];
    //三
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
