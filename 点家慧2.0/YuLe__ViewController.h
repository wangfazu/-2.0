//
//  YuLe__ViewController.h
//  点家慧2.0
//
//  Created by app on 17/5/10.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "Base__ViewController.h"
#import "DT_creatAlph_0_Btn.h"


#import "DT_searchView.h"
#import "DT_kindOfSelectButton.h"
#import "DT_searchDetailView.h"
#import "hot_attentionRoom_Btn.h"
#import "DT_scrollview_show_tableview.h"


@interface YuLe__ViewController : Base__ViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

//@property(nonatomic,retain)    UIButton *leftBtn;
@property (nonatomic,retain) NSString *roomName;
@property (nonatomic,retain) UIImage *selectImg;
@property (nonatomic,retain) NSString *roomDeciptionLab;
@property (nonatomic,assign) NSInteger *openOrPrivate;

@end
