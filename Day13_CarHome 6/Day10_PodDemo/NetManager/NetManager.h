//
//  NetManager.h
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "NanFangModel.h"

typedef NS_ENUM(NSUInteger, MsgType) {
    MsgTypeTouTiao,
    MsgTypeDiaoCha,
    MsgTypeShiJu,
    MsgTypeShiPing,
    MsgTypeHiNanZhou,
};

@interface NetManager : BaseNetManager
+ (id) getNanFanghandler:(NSInteger)page msgType:(MsgType)msgType handler:(void(^)(NSArray<NanFangModel *> *model, NSError *error))handler;
@end
