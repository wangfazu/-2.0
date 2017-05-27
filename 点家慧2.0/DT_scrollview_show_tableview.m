//
//  DT_scrollview_show_tableview.m
//  点家慧2.0
//
//  Created by app on 17/5/17.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_scrollview_show_tableview.h"

@implementation DT_scrollview_show_tableview
{
    UIScrollView *scrollview;

    
}
-(void)viewDidLoad{
    [self initUI];
   
}


- (void)initUI{
    
    scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, applicationWidth, 588*iPhone5Height)];
    //    scrollview.delegate = self;
    scrollview.contentSize = CGSizeMake(2*applicationWidth, 93);
    [self.view addSubview:scrollview];
    scrollview.showsHorizontalScrollIndicator = FALSE;//隐藏水平滚动条
    /**
     热门推荐TableView
     */
    DT_Hot_tableview *hotTableVC = [[DT_Hot_tableview alloc]init];
    [self addChildViewController:hotTableVC];
    [scrollview addSubview:hotTableVC.view];
    hotTableVC.view.frame = CGRectMake(0, 0, applicationWidth, 588*iPhone5Height);
    [hotTableVC didMoveToParentViewController:self];
    /**
     关注房间TableView
     */
    DT_attention_tableView *attentionTableVC = [[DT_attention_tableView alloc]init];
    [self addChildViewController:attentionTableVC];
    [scrollview addSubview:attentionTableVC.view];
    attentionTableVC.view.frame = CGRectMake(applicationWidth, 0, applicationWidth, 588*iPhone5Height);
    [attentionTableVC didMoveToParentViewController:self];
    



}
- (void)scrollerView:(int)tag
{
    [UIView animateWithDuration:0.75 animations:^{
        [scrollview setContentOffset:CGPointMake(tag * applicationWidth, 0) animated:NO];

        
    } ];
}

@end
