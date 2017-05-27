//
//  PerfectRoomDetail.h
//  点家慧2.0
//
//  Created by app on 17/5/15.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "Base__ViewController.h"

@interface PerfectRoomDetail : Base__ViewController< UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate>

@property (nonatomic,retain) NSString *roomName;
@property (nonatomic,retain) UIImage *selectImg;
@property (nonatomic,retain) NSString *roomDeciptionLab;
@property (nonatomic,assign) NSInteger *openOrPrivate;

@end
