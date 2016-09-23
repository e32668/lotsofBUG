//
//  LeftCell.m
//  Day10_PodDemo
//
//  Created by LANGLANG on 16/9/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LeftCell.h"

@implementation LeftCell

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.iconIV.mas_right).offset(25);
            make.centerY.equalTo(0);
            make.centerX.equalTo(-10);
        }];
    }
    return _titleLb;
}



- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(50);
            make.centerY.equalTo(0);
        }];
    }
    return _iconIV;
}



@end
