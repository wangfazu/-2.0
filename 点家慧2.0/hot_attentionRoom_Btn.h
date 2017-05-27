//
//  hot_attentionRoom_Btn.h
//  点家慧2.0
//
//  Created by app on 17/5/17.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "Base__ViewController.h"

typedef void(^ClickedTypeButtonBlock)(int tag);

@interface hot_attentionRoom_Btn : Base__ViewController
{
    ClickedTypeButtonBlock block;
}

- (void)setClickedTypeButtonBlock:(ClickedTypeButtonBlock)_block;

@end
