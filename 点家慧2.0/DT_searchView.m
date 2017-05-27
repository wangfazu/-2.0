//
//  DT_searchView.m
//  点家慧2.0
//
//  Created by app on 17/5/16.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_searchView.h"

@interface DT_searchView()
{
    UIView *searchView;
}

@end

@implementation DT_searchView
{
    
}
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.frame = CGRectMake(applicationWidth, 0, applicationWidth, 50);
        NSLog(@"nihao");
        searchView = [[UIView alloc]init];
        searchView.frame = CGRectMake(10, 10, applicationWidth-20, 30);
        searchView.backgroundColor = UIColorFromRGB(0xffffff);
        searchView.layer.cornerRadius = 30*iPhone5Width;
        searchView.clipsToBounds = YES;
        searchView.layer.borderColor = UIColorFromRGB(0x43d3a2).CGColor;
        searchView.layer.borderWidth = 1;
        searchView.userInteractionEnabled = YES;//开启交互
        [self addSubview:searchView];
        
        //tap手势
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(event:)];
        [self addGestureRecognizer:tapGesture];
    }
    
    return self;
}

- (void)event:(UITapGestureRecognizer *)gesture
{
//    gesture.view;
    NSLog(@"单机");
//    获取是哪个View触发了此方法：
//    DT_searchDetailView *searchDetailVC = [[DT_searchDetailView alloc]init];
    

}

@end
