//
//  DT_Hot_tableview.m
//  点家慧2.0
//
//  Created by app on 17/5/17.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_Hot_tableview.h"

@implementation DT_Hot_tableview
{
    UITableView *hotTableView;
    
}
-(void)viewDidLoad{

    [self initUI];
    
}

-(void)initUI{
    
    /**
     *  test tabelView is success!
     */
    UIView *bGview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, applicationWidth, applicationHeight)];
    bGview.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bGview];
    /**
     *  creat hotTableView
     */
    hotTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -44, applicationWidth, applicationHeight) style:UITableViewStyleGrouped];
    hotTableView.delegate = self;
    hotTableView.dataSource = self;
    [self.view addSubview:hotTableView];
    
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return applicationHeight*106/568;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        [[DT_meTable_cell new] initTableViewCell:cell];
        
    }  else
    {
        //删除cell的所有子视图,避免重用
        while ([cell.contentView.subviews lastObject] != nil)
        {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    UILabel *titLab = [cell viewWithTag:201];
    titLab.text = @"66666";
    if (indexPath.row == 7) {
        titLab.text = @"发现了？我？";
    }
    cell.selectionStyle = UITableViewCellStyleDefault;
    return  cell;

    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    room_display *roomDisplayVC = [[room_display alloc]init];
    [self.navigationController pushViewController:roomDisplayVC animated:YES];
    
}
@end
