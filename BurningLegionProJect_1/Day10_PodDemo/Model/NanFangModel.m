//
//  NanFangModel.m
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NanFangModel.h"

@implementation NanFangModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"mytemplate":@"template",@"ID":@"id"};
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"snsShare":@"NanFangSnsshareModel"};
}
@end


@implementation NanFangSnsshareModel

@end


