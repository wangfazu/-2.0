//
//  DT_text_room_cell.m
//  点家慧2.0
//
//  Created by app on 17/5/22.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_text_room_cell.h"

@implementation DT_text_room_cell
- (void)initWithTableView_cell:(UITableViewCell *)cell IndexPath:(NSIndexPath *)indexPath{

    [[kind_of_room_VC new] setNavgationBarItemName:@"房间详情文字"];

    if (indexPath.row == 0) {
        UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, applicationWidth - 20, cell.height)];
        titleLab.tag = 100;
        titleLab.font = [UIFont systemFontOfSize:16 weight:1];
        titleLab.text = @"最美的太阳";
        titleLab.textColor = UIColorFromRGB(0x1a1a1a);
        [cell addSubview:titleLab];
        
        UILabel *timeLab = [[UILabel alloc]initWithFrame:CGRectMake(titleLab.width - 32, titleLab.height - 15, 35, 10)];
        timeLab.tag = 200;
        timeLab.font = [UIFont systemFontOfSize:10];
        timeLab.textColor = UIColorFromRGB(0x969696);
        timeLab.text = @"13-32";
        [titleLab addSubview:timeLab];
    }else{
        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, applicationWidth - 20, applicationHeight) ];
        //    textview 改变字体的行间距
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 10;// 字体的行间距
        [cell addSubview:textView];
        textView.text = @"生命里，一些缱绻，无论素净，还是喧哗，都已经被岁月赋予了清喜的味道，一些闲词，或清新，或淡雅，总会在某一个回眸的时刻醉了流年，濡湿了柔软的心，冥冥之中，我们沿着呼唤的风声，终于在堆满落花的秋里，再次重逢，念在天涯，心在咫尺，我相信，一米阳光，才是我们最好的距离。缘起是诗缘离是画，这些关于岁月，关于记忆的章节，终会被时光搁置在无法触及的红尘之外，曾经，你我一别经年，可风里，总有一段美丽会与我们不期而遇，一盏琉璃，半杯心悦，端然着那一份醉人的静，这安静行走的流年，总会被过往赋予一份清喜，一份浪漫。";
        textView.font = [UIFont systemFontOfSize:14 weight:0];
        textView.textColor = UIColorFromRGB(0x646464);
        

        
    }

}
@end
