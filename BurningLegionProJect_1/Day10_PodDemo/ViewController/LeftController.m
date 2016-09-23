//
//  LeftController.m
//  Day10_PodDemo
//
//  Created by LANGLANG on 16/9/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LeftController.h"
#import "LeftCell.h"
#import "LeftLoginInCell.h"

@implementation LeftController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[LeftCell class] forCellReuseIdentifier:@"LeftCell"];
    [self.tableView registerClass:[LeftLoginInCell class] forCellReuseIdentifier:@"LeftLoginInCell"];
}

#pragma mark - Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 170;
    }else{
        return 70;
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 0;
}

-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
}

#pragma mark - Data Source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        LeftLoginInCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftLoginInCell" forIndexPath:indexPath];
        cell.LoginLb.text = @"登录";
        cell.LoginLb.textColor = [UIColor grayColor];
        UIImage *TitleIV = [UIImage imageNamed:@"UserLogIn"];
        [cell.LoginIV setImage:TitleIV];
        return cell;
    }
    else{
        LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftCell" forIndexPath:indexPath];
        NSArray *LabelText = @[@"我定制",@"新闻 ",@"经济 ",@"文化 ",@"评论 ",@"视觉 ",@"生活+"];
        cell.titleLb.text =  [LabelText objectAtIndex:indexPath.row-1];
        
        
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"A%ld.png",(long)indexPath.row-1]];
        [cell.iconIV setImage:img];
            return cell;
    }

    
//    cell.iconIV = [[UIImageView alloc]initWithImage:img];
//    cell.iconIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"A%ld.png",(long)indexPath.row]]];
    

}



@end
