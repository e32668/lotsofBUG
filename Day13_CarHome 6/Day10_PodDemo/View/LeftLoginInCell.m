//
//  LeftLoginInCell.m
//  Day10_PodDemo
//
//  Created by LANGLANG on 16/9/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LeftLoginInCell.h"

@implementation LeftLoginInCell

- (UIImageView *)LoginIV {
    if(_LoginIV == nil) {
        _LoginIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_LoginIV];
        [_LoginIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(40);
        }];
    }
    return _LoginIV;
}

- (UILabel *)LoginLb {
    if(_LoginLb == nil) {
        _LoginLb = [[UILabel alloc] init];
        [self.contentView addSubview:_LoginLb];
        [_LoginLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.LoginIV.mas_centerX);
            make.top.equalTo(self.LoginIV.mas_bottom).offset(5);
        }];
    }
    return _LoginLb;
}

@end
