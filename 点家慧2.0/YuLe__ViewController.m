//
//  YuLe__ViewController.m
//  点家慧2.0
//
//  Created by app on 17/5/10.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "YuLe__ViewController.h"
#import "DT_YuFooterView.h"
#import "DT_meTable_cell.h"

@interface YuLe__ViewController ()<DT_YUFooterViewDelegate>

@end

@implementation YuLe__ViewController
{
    UIButton *leftBtn ;
    UIButton *rightBtn;
    
    UIScrollView *mainScroll;
    UITableView *myTableView;
    NSMutableArray *dataSourse;
    NSMutableArray *dataArr;
    NSMutableArray *RoomNameArr;
    UIButton *BgvBtnForSelect ;
    UIView *searchView;
    DT_searchView *searVW;
    DT_scrollview_show_tableview *scroShowVC;

}
- (void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"%@(*&^",self.roomName) ;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavgationBarItemName:@"娱乐"];
    [self setButtonForBackNavgation];
    [self initDataSourse];
    [self initUI];
    


}
- (void)initUI{
    //两个来回切换.页面的Btn
    leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.titleview.height, applicationWidth*160/320, applicationHeight*45/568)];
    //    leftBtn.backgroundColor= [UIColor redColor];
    [leftBtn setTitle:@"展示自我" forState:UIControlStateNormal];
    [leftBtn setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
    //    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont   systemFontOfSize:12]}   forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    leftBtn.tag  = 100;
    [leftBtn addTarget:self action:@selector(changeViewClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
//    [[LeftBtn new]   creatLeftBtn:[UIButton new] ];

    
    rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(leftBtn.width+1, self.titleview.height, applicationWidth*160/320, applicationHeight*45/568)];
    rightBtn.tag = 101;
    //    rightBtn.backgroundColor= [UIColor blueColor];
    [rightBtn setTitle:@"学习观摩" forState:UIControlStateNormal];
    //button之间的那条线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(leftBtn.width, self.titleview.height, 1, leftBtn.height)];
    line.backgroundColor = UIColorFromRGB(0xe6e6e6);
    [self.view addSubview:line];
    
    [rightBtn setTitleColor:UIColorFromRGB(0x000000) forState:UIControlStateNormal];
    [self.view addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(changeViewClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    [rightBtn setFont:[UIFont systemFontOfSize:14]];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    //小LAB
    UILabel *titLab = [[UILabel alloc]initWithFrame:CGRectMake(0, leftBtn.marginY, applicationWidth, applicationHeight*76/1336)];
    titLab.backgroundColor = UIColorFromRGB(0xf5f5f5);
    [self.view
     addSubview:titLab];
    //灰色背景
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, titLab.marginY, applicationWidth, applicationHeight-titLab.marginY)];
    bgView.backgroundColor = UIColorFromRGB(0xf5f5f5);
    [self.view addSubview:bgView];
    
    UILabel *labForText = [[UILabel alloc]initWithFrame:CGRectMake(15, titLab.orginY, titLab.width+20, titLab.height)];
    //    labForText.backgroundColor = [UIColor orangeColor];
    labForText.text = @"我管理的房间";
    labForText.textColor = UIColorFromRGB(0x323232);
    [self.view addSubview:labForText];
    
    //scrollView用来放置两个tableView
    
    mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, leftBtn.marginY, applicationWidth, applicationHeight)];
    mainScroll.backgroundColor = UIColorFromRGB(0xf5f5f5);
    
    mainScroll.delegate=self;
    mainScroll.contentSize = CGSizeMake(2*applicationWidth, applicationHeight);
    [self.view addSubview:mainScroll];
    UILabel *test = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, applicationWidth , titLab.height)];
    //    test.backgroundColor = [UIColor orangeColor];
    test.text = @"我管理的房间";
    test.textColor = UIColorFromRGB(0x323232);
    test.font = [UIFont systemFontOfSize:13];
    
    [mainScroll addSubview:test];
    
//     *  创建 UITabView

    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, test.height, applicationWidth, applicationHeight - 64)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.backgroundColor = [UIColor clearColor];
    [mainScroll addSubview:myTableView];
//tableviewの 尾部，那个随 tableViewCell 移动的 btn
    DT_YuFooterView * footview = [[DT_YuFooterView alloc] init];
    footview.delegate = self;
    [footview setclickedCreate:^{
        //点击创建按钮
        NSLog(@"点击创建安吉");
    }];
    myTableView.tableFooterView = footview;
    
    [self creatAlpth_0Btn];
    
    /**
     *  接收数据
     *
     *  @return dataArr
     */
    [dataArr addObject:@{@"roomName":@"room",@"deciption":@"lab"}];
    NSLog(@"selsct dic is:%@",[dataArr[0] objectForKey:@"deciption"]);
    
    //study and see
    searVW = [[DT_searchView alloc]init];
    [mainScroll addSubview:searVW];
    
    
    //学习观摩页面
    /**
     通过button来选择类别：交友，征婚，运动，极限挑战，。。。。越跑。
     */
    DT_kindOfSelectButton *kindBtnView = [[DT_kindOfSelectButton alloc]init];
    [self addChildViewController:kindBtnView];
    [mainScroll addSubview:kindBtnView.view];
    [kindBtnView didMoveToParentViewController:self];
    /**
     *  热门推荐 & 关注房间 btn
     */
    
    hot_attentionRoom_Btn *hotAttentionBtnVC = [[hot_attentionRoom_Btn alloc]init];
    [self addChildViewController:hotAttentionBtnVC];
    [mainScroll addSubview:hotAttentionBtnVC.view];
    [hotAttentionBtnVC setClickedTypeButtonBlock:^(int tag) {
        [scroShowVC scrollerView:tag];
    }];
    hotAttentionBtnVC.view.frame = CGRectMake(applicationWidth, kindBtnView.view.marginY, applicationWidth, 60);
    [hotAttentionBtnVC didMoveToParentViewController:self];
    
    //scrollView 加载 hotTableview & attentionTableView
    scroShowVC = [[DT_scrollview_show_tableview alloc]init];
    [self addChildViewController:scroShowVC];
    [mainScroll addSubview:scroShowVC.view];
    scroShowVC.view.frame = CGRectMake(applicationWidth, hotAttentionBtnVC.view.marginY, applicationWidth, 588*iPhone5Height);
    [scroShowVC didMoveToParentViewController:self]; 

}

- (void)didClickedButton
{
    NSLog(@"点击创建安吉");
    [self addRoomClick:nil];
}

- (void)creatAlpth_0Btn{
    //创建一个透明的背景
    BgvBtnForSelect = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, applicationWidth, applicationHeight)];
    BgvBtnForSelect.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    BgvBtnForSelect.hidden = YES;
    [BgvBtnForSelect addTarget:self action:@selector(dissmissThisBtn:) forControlEvents:UIControlEventTouchUpInside];
    //将Btn添加在Window上
    [[[[UIApplication sharedApplication]delegate]window] addSubview:BgvBtnForSelect];
    
    //创建背景上面的View机器选项
    UIView *smallbg = [[UIView alloc]initWithFrame:CGRectMake(iPhone5Width*30, iPhone5Height*311, iPhone5Width*582, iPhone5Height*427)];
    smallbg.backgroundColor = [UIColor whiteColor];
    [BgvBtnForSelect addSubview:smallbg];
    smallbg.alpha = 1;
    smallbg.layer.cornerRadius = 8;
    smallbg.clipsToBounds = YES;
    //font
    UILabel *titlab = [[UILabel alloc]initWithFrame:CGRectMake(190*iPhone5Width , 50*iPhone5Height, 215*iPhone5Width, 30*iPhone5Height)];
    titlab.text = @"请选择房间类型";
    titlab.font = [UIFont systemFontOfSize:15];
    [smallbg addSubview:titlab];
    
    //select type for btn
    for (int i=0; i<16; i++) {
        UIButton *btttn = [[UIButton alloc]initWithFrame:CGRectMake(20*iPhone5Width+140*iPhone5Width*(i%4), 120*iPhone5Height +70*iPhone5Height*(i/4), 120*iPhone5Width, 50*iPhone5Height)];
        //        btttn.backgroundColor = UIColorFromRGB(0xff);
        //        btttn.layer.cornerRadius = 8;
        //        btttn.clipsToBounds = YES;
        //正常 OR 选中 状态图片room_classification_background
        [btttn setTitle:RoomNameArr[i] forState:UIControlStateNormal];
        [btttn setTitleColor:UIColorFromRGB(0x323232) forState:UIControlStateNormal];
        btttn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btttn setBackgroundImage:[UIImage imageNamed:@"room_classification_background"] forState:UIControlStateNormal];
        [btttn addTarget:self action:@selector(btn_16_Click:) forControlEvents:UIControlEventTouchUpInside];
        [btttn setBackgroundImage:[UIImage imageNamed:@"room_classification_background_selected"] forState:UIControlStateSelected];
        btttn.tag = 300+i;
        [smallbg addSubview:btttn];
        
    }
    
}
- (void)initDataSourse{
    dataSourse = [[NSMutableArray alloc]init];
    dataArr = [[NSMutableArray alloc]init];
    
    RoomNameArr = [[NSMutableArray alloc]initWithObjects:@"交友",@"征婚", @"运动",@"健身",@"养生", @"唱歌", @"其他", @"其他",@"交友",@"征婚", @"运动",@"健身",@"养生", @"唱歌", @"其他", @"其他", nil];
    
    // 接收一个名称为：@"RoomName" 的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getNotification:) name:@"RoomName" object:nil];

    
    
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSourse.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell==nil) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
            [[DT_meTable_cell new] initTableViewCell:cell];

        }
    UILabel *titLab = [cell viewWithTag:201];
    titLab.text = dataSourse[indexPath.row];
            cell.selectionStyle = UITableViewCellStyleDefault;
            return  cell;
        
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
return applicationHeight*106/568;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, myTableView.marginY, 80, 89)];
//    btn.backgroundColor = [UIColor blueColor];
//    [myTableView.tableFooterView addSubview:btn];
//    return  100;
//    
//    
//}

- (void)changeViewClick:(UIButton *)btn{
    /**
     *  通过button的 tag 来控制所要现实的当前页面
     
     
     */
    leftBtn.selected = NO;
    rightBtn.selected = NO;
    [leftBtn setBackgroundColor:nil];
    [rightBtn setBackgroundColor:nil];
    btn.selected = YES;
    [btn setTitleColor:UIColorFromRGB(0x43d3a2) forState:UIControlStateSelected];
    if (btn.tag==100) {
        NSLog( @"dianjile Left");
        [UIView animateWithDuration:0.75 animations:^{
            mainScroll.contentOffset = CGPointMake(applicationWidth*0, 0);
        } ];


    }else{
        
        NSLog(@"dian ji le Right");
        [UIView animateWithDuration:0.75 animations:^{
            mainScroll.contentOffset = CGPointMake(applicationWidth*1, 0);
            
            
        } ];
    }
    
}
- (void)addRoomClick:(UIButton *)btn{
    if (dataSourse.count==2) {
        
        btn.hidden = YES;
    }

    if (dataSourse.count>2) {
        NSLog(@"你不能再添加，房间了!");
        
        return;
    }
    BgvBtnForSelect.hidden = NO;
}

- (void)getNotification:(NSNotification *)notification{
    NSDictionary *dic=notification.userInfo;
    [dataSourse addObject:dic[@"房间名"]];
    NSLog(@"房间名%@ -----",dic[@"房间名"]);
    [myTableView reloadData];

}

- (void)dissmissThisBtn:(UIButton *)btn{
    btn.alpha = 0;
}

- (void)btn_16_Click:(UIButton *)btn{
    btn.selected = !btn.selected;
    if ( btn.selected) {
        BgvBtnForSelect.hidden = YES;
            RoomDetialView *roomVC = [[RoomDetialView alloc]init];
            [self.navigationController pushViewController:roomVC animated:YES];
        NSLog(@"添加房间成功");
        [btn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    }else{
        [btn setTitleColor:UIColorFromRGB(0x323232) forState:UIControlStateNormal];

    }
    NSLog(@"%@",btn.titleLabel.text);

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
