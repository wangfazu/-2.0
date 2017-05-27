//
//  Base__ViewController.h
//  点家慧2.0
//
//  Created by app on 17/5/10.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef void(^clickTypeButtonBlock)(UIImage *btnImage);

@interface Base__ViewController : UIViewController
//{
//    clickTypeButtonBlock block;
//}
@property(nonatomic,retain)UIView *titleview;
@property(nonatomic,retain)UILabel *lab;
@property(nonatomic,retain)UIButton *backBtn;
//- (void)setClickedTypeButtonBlock:(ClickedTypeButtonBlock)_block;
//- (void)setClickTypeButtonBlock:(clickTypeButtonBlock)_block;

- (void)setNavgationBarItemName:(NSString *)setString;
- (void)setButtonForBackNavgation;
- (void)setRightBtnForNavgationWithTitle:(NSString *)btnName btnImage:(NSString *)btnImageName;

//- (void)setNavgationRightButton:(NSString *)btnName;

@end
