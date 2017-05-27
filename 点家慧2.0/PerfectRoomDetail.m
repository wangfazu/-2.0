
//
//  PerfectRoomDetail.m
//  点家慧2.0
//
//  Created by app on 17/5/15.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "PerfectRoomDetail.h"

@implementation PerfectRoomDetail
{
    UILabel *openOrprivateLab;
    UIButton *headframeViewBtn;
    UILabel *hiddenLab;
    UITextView *roomeDeciption;
    NSMutableArray *btnImageChangeArr;
    
}
@synthesize selectImg;
- (void)viewDidLoad {
    [super viewDidLoad];
    btnImageChangeArr = [[NSMutableArray alloc]init];
    [self initDataSourse];
    [self initUI];

}

- (void)initUI{
    [self setNavgationBarItemName:@"填写房间资料"];
    [self setButtonForBackNavgation];
    [self setNavgationRightButton:@"跳过"];
    
    //headframe
    headframeViewBtn = [[UIButton alloc]initWithFrame:CGRectMake(iPhone5Width*214, self.titleview.marginY+80*iPhone5Height, iPhone5Width*210, iPhone5Width*211)];
    [headframeViewBtn setBackgroundImage:[UIImage imageNamed:@"head_frame"] forState:UIControlStateNormal];
    [headframeViewBtn addTarget:self action:@selector(addImageClick:) forControlEvents:UIControlEventTouchUpInside];
    headframeViewBtn.layer.cornerRadius = iPhone5Width*210/2;
    headframeViewBtn.clipsToBounds = YES;
    [self.view addSubview:headframeViewBtn];
    //lab
    UILabel *tLab = [[UILabel alloc]initWithFrame:CGRectMake(iPhone5Width*20, headframeViewBtn.marginY+77*iPhone5Height, iPhone5Width*120, 13)];
    tLab.text = @"房间介绍：";
    tLab.textColor = UIColorFromRGB(0x646464);
    tLab.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:tLab];
    //room deciption textfild
    roomeDeciption = [[UITextView alloc]initWithFrame:CGRectMake(iPhone5Width*20, tLab.marginY+10, applicationWidth-40, 90)];
    roomeDeciption.font = [UIFont systemFontOfSize:12];
    roomeDeciption.backgroundColor = UIColorFromRGB(0xffffff);
    roomeDeciption.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:roomeDeciption];
    roomeDeciption.delegate = self;
    //lab，textfild 提示信息
    
    hiddenLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 10,applicationWidth -30 , 20)];
    hiddenLab.text = @"简要的描述一下这个房间时什么样的组织，20到200字";
    hiddenLab.font = [UIFont systemFontOfSize:12];
    hiddenLab.textColor = UIColorFromRGB(0x969696);
    hiddenLab.textAlignment =NSTextAlignmentLeft;
    [roomeDeciption addSubview:hiddenLab];
    
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
    [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    [completeBtn  addTarget:self action:@selector(addCompleteClick) forControlEvents:UIControlEventTouchUpInside];
//    [completeBtn setFont:[UIFont systemFontOfSize:18]];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [completeBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [self.view addSubview:completeBtn];
    
   
    /**
     *  textFild
     *
     *  @return textfild
     */
  

    
    
}
- (void)initDataSourse{
   



}
- (void)openOrPrivateClick:(UIButton *)btn{
    
    for (int K = 0; K < 2; K++) {
        if (btn.tag == K + 20) {
            [btn  setBackgroundImage:[UIImage imageNamed:@"circle_selected"] forState:UIControlStateNormal];
            if (btn.tag == 20) {
                NSLog(@"我的tag是20");
            }
            if (btn.tag == 21) {
                NSLog(@"我的tag是21");
            }
        }
        else{
            UIButton * button = (UIButton *)[self.view viewWithTag:20 + K];
            [button setBackgroundImage:[UIImage imageNamed:@"circle_not_selected"] forState:UIControlStateNormal];
        }
    }
    
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@"textViewDidBeginEditing");
    hiddenLab.hidden = YES;
}
//- (void)textFieldDidBeginEditing:(UITextField *)textField;{
//    hiddenLab.hidden = YES;
//}
-(void)textViewDidEndEditing:(UITextView *)textView
{//结束编辑时
    
    NSLog(@"textViewDidEndEditing");
    self.roomDeciptionLab = roomeDeciption.text;
    NSLog(@"房间描述：%@",self.roomDeciptionLab);
    if ([roomeDeciption resignFirstResponder]) {
        if (roomeDeciption.text.length == 0) {
            hiddenLab.hidden = NO;    }
        else{
            hiddenLab.hidden = YES;
            NSLog(@"number is :%ld",roomeDeciption.text.length);

            if (roomeDeciption.text.length >20) {
                
                return ;
            }
            

        }
        NSLog(@"aaaaa");
        
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSLog(@"text will change ");
    
    if (roomeDeciption.text.length >199) {
        return NO;
    }else return YES;
    
    
}
//- (void)textFieldDidEndEditing:(UITextField *)textField{
//    if ([roomeDeciption resignFirstResponder]) {
//        if (roomeDeciption.text.length == 0) {
//            hiddenLab.hidden = NO;    }
//        else{
//            hiddenLab.hidden = YES;
//        }
//        NSLog(@"aaaaa");
//    }
//    
//}
- (void)addImageClick:(UIButton *)btn{
    [btn setBackgroundImage:[UIImage imageNamed:@"default_roomdefault_room"] forState:UIControlStateNormal];
    NSLog(@"可以添加照片了！");
    UIImagePickerController *pikerView=[[UIImagePickerController alloc]init];
    pikerView.delegate=self;
    pikerView.allowsEditing=YES;
    pikerView.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:pikerView animated:YES completion:nil];
    
}
//打开 手机相册
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    selectImg=[info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    [headframeViewBtn setBackgroundImage:selectImg forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//自定义导航栏右边的button
- (void)setNavgationRightButton:(NSString *)btnName{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(applicationWidth-50, 30, 45, 26)];
    [btn addTarget:self action:@selector(backYuleclick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:btnName forState:UIControlStateNormal];
//    [btn setFont:[UIFont systemFontOfSize:13]];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    //    [btn setBackgroundImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    [self.titleview addSubview:btn];
}

- (void)backYuleclick{
    YuLe__ViewController *yuleVC = [[YuLe__ViewController alloc]init];
    [self.navigationController pushViewController:yuleVC animated:YES];
    
}
- (void)addCompleteClick{
    RoomDetailDisplay *roomDetailVc = [[RoomDetailDisplay alloc]init];
    roomDetailVc.roomName = self.roomName;
    roomDetailVc.roomDeciptionLab = self.roomDeciptionLab;
    roomDetailVc.selectImg = self.selectImg;
    [self.navigationController pushViewController:roomDetailVc animated:YES];
    
    
    
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
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
}
@end
