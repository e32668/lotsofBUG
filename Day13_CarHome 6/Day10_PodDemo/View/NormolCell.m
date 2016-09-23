//
//  NormolCell.m
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NormolCell.h"

@implementation NormolCell
- (UIImageView *)headIV
{
    if (_headIV == nil) {
        _headIV = [[UIImageView alloc]init];
        [self.contentView addSubview:_headIV];
        [_headIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(10);
            make.bottom.equalTo(-10);
            make.width.equalTo(90);
            make.height.equalTo(70);
        }];
    }
    return _headIV;
}

- (UILabel *)titleLb{

    if (_titleLb == nil) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headIV.mas_right).equalTo(10);
            make.top.equalTo(10);
            make.right.equalTo(-5);
        }];
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}

- (UILabel *)typeLb{
    if (_typeLb == nil) {
        _typeLb = [UILabel new];
        [self.contentView addSubview:_typeLb];
        [_typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLb);
            make.bottom.equalTo(self.headIV.mas_bottom);
            
        }];
        _typeLb.textColor = [UIColor grayColor];
        _typeLb.font = [UIFont systemFontOfSize:12];
    }
    return _typeLb;
}

- (UILabel *)timeLb{
    if (_timeLb == nil) {
        _timeLb = [UILabel new];
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.bottom.equalTo(self.headIV.mas_bottom);
        }];
        _timeLb.textColor = [UIColor grayColor];
        _timeLb.font = [UIFont systemFontOfSize:12];
    }
    return _timeLb;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
