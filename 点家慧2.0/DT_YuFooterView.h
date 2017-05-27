//
//  DT_YuFooterView.h
//  点家慧2.0
//
//  Created by app on 17/5/12.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^clickedCreate)(void);

@protocol DT_YUFooterViewDelegate <NSObject>

- (void)didClickedButton;

@end

@interface DT_YuFooterView : UIView
{
    clickedCreate block;
}

- (void)setclickedCreate:(clickedCreate)_block;
@property (assign, nonatomic) id<DT_YUFooterViewDelegate> delegate;

@end
