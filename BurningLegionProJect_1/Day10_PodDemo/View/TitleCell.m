//
//  TitleCell.m
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TitleCell.h"

@implementation TitleCell
-(UILabel *)typeLb
{
    if (_typeLb == nil) {
        _typeLb = [[UILabel alloc]init];
        [self.headView addSubview:_typeLb];
        _typeLb.backgroundColor = [UIColor colorWithRed:0.608 green:0.208 blue:0.133 alpha:1.000];
        _typeLb.textColor = [UIColor whiteColor];
        [_typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.bottom.equalTo(-10);
        }];
    }
    return _typeLb;
}

- (UILabel *)timeLb
{
    if (_timeLb == nil) {
        _timeLb = [[UILabel alloc]init];
        [self.headView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.bottom.equalTo(-10);
        }];
        _timeLb.textColor = [UIColor whiteColor];
        _timeLb.font = [UIFont systemFontOfSize:13];
    }
    return _timeLb;
}

- (UIImageView *)headView
{
    if (_headView == nil) {
        _headView = [[UIImageView alloc]init];
        [self.contentView addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
    }
    return _headView;
}

- (UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc]init];
        [self.headView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(self.timeLb.mas_top).offset(-10);
            make.right.equalTo(-10);
        }];
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
