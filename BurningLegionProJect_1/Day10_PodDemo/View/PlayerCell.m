//
//  PlayerCell.m
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "PlayerCell.h"

@implementation PlayerCell
-(UIImageView *)headImg
{
    if (_headImg == nil) {
        _headImg = [[UIImageView alloc]init];
        [self.contentView addSubview:_headImg];
        [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(10);
            make.height.equalTo(150);
        }];
    }
    return _headImg;
}

- (UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:15];
        _titleLb.numberOfLines = 0;
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(self.headImg.mas_bottom).offset(10);
            make.bottom.equalTo(self.typeLb.mas_top).offset(-10);
            
        }];
    }
    return _titleLb;
}

- (UILabel *)typeLb{
    if (_typeLb == nil) {
        _typeLb = [UILabel new];
        [self.contentView addSubview:_typeLb];
        _typeLb.textColor = [UIColor grayColor];
        _typeLb.font = [UIFont systemFontOfSize:12];
        [_typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLb);
            make.bottom.equalTo(self.timeLb);
        }];
    }
    return _typeLb;
}

- (UILabel *)timeLb{
    if (_timeLb == nil) {
        _timeLb = [UILabel new];
        [self.contentView addSubview:_timeLb];
        _timeLb.textColor = [UIColor grayColor];
        _timeLb.font = [UIFont systemFontOfSize:12];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.bottom.equalTo(-10);
        }];
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
