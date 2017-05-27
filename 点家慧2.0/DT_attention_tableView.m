//
//  DT_attention_tableView.m
//  点家慧2.0
//
//  Created by app on 17/5/17.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "DT_attention_tableView.h"

@implementation DT_attention_tableView

{
    UITableView *attentionTableView;
    
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
    attentionTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -44, applicationWidth, applicationHeight) style:UITableViewStyleGrouped];
    attentionTableView.delegate = self;
    attentionTableView.dataSource = self;
    [self.view addSubview:attentionTableView];
    
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
        
    }
    UILabel *titLab = [cell viewWithTag:201];
    titLab.text = @"777777";
    cell.selectionStyle = UITableViewCellStyleDefault;
    return  cell;
    
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}

@end
