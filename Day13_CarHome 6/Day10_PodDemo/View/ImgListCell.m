//
//  ImgListCell.m
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ImgListCell.h"

@implementation ImgListCell
-(NSMutableArray<UIImageView *> *)imgList
{
    if (_imgList == nil) {
        _imgList = [[NSMutableArray<UIImageView *> alloc]init];
        for (int i = 0; i < 3; i++) {
            UIImageView *icon = [[UIImageView alloc]init];
            [self.contentView addSubview:icon];
            icon.layer.cornerRadius =4;
            [icon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(10);
                make.bottom.equalTo(self.titleLb.mas_top).offset(-20);
                make.width.equalTo(icon.mas_height).multipliedBy(1.3);
                if (i == 0) {
                    make.left.equalTo(10);
                }
                else{
                    make.left.equalTo(_imgList.lastObject.mas_right).offset(5);
                    make.width.equalTo(_imgList.lastObject);
                    if (i == 2) {
                        make.right.equalTo(-10);
                    }
                }
            }];
            [_imgList addObject:icon];
        }
    }
    return _imgList;
}

-(UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:19];
        _titleLb.numberOfLines = 0;
        
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(self.typeLb.mas_top).offset(-20);
            make.right.equalTo(-10);
        }];
    }
    return _titleLb;
}

- (UILabel *)typeLb
{
    if (_typeLb == nil) {
        _typeLb = [UILabel new];
        [self.contentView addSubview:_typeLb];
        _typeLb.textColor = [UIColor grayColor];
        _typeLb.font = [UIFont systemFontOfSize:12];
        [_typeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(-10);
        }];
    }
    return _typeLb;
}

- (UILabel *)timeLb
{
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
