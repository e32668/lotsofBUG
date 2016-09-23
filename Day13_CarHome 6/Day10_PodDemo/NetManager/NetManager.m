//
//  NetManager.m
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"
#define kTouTiaoPath   @"http://www.infzm.com/mobile/get_list_by_cat_ids?cat_id%%5B%%5D=4815&start=%ld&count=10&platform=ireader&device=iPhone%%205s&version=5.1.0&system_version=10.0&hash=cf71f5da9eeef8bf3b1921b09e110a05&format=json"
#define kDiaoChaPath  @"http://www.infzm.com/mobile/get_list_by_cat_ids?cat_id%%5B%%5D=4714&start=%ld&count=10&platform=ireader&device=iPhone%%205s&version=5.1.0&system_version=10.0&hash=cf71f5da9eeef8bf3b1921b09e110a05&format=json"
#define kShiJuPath   @"http://www.infzm.com/mobile/get_list_by_cat_ids?cat_id%%5B%%5D=4718&start=%ld&count=11&platform=ireader&device=iPhone%%205s&version=5.1.0&system_version=10.0&hash=cf71f5da9eeef8bf3b1921b09e110a05&format=json"
#define kShiPingPath  @"http://www.infzm.com/mobile/get_list_by_cat_ids?cat_id%%5B%%5D=5140&start=%ld&count=10&platform=ireader&device=iPhone%%205s&version=5.1.0&system_version=10.0&hash=ff7a70089c7d93815f9824688b0a246e&format=json"
#define kHiNanZhou   @"http://www.infzm.com/mobile/get_list_by_cat_ids?cat_id%%5B%%5D=5139&start=%ld&count=10&platform=ireader&device=iPhone%%205s&version=5.1.0&system_version=10.0&hash=cf71f5da9eeef8bf3b1921b09e110a05&format=json"

@implementation NetManager
+ (id)getNanFanghandler:(NSInteger)page msgType:(MsgType)msgType handler:(void (^)(NSArray<NanFangModel *> *, NSError *))handler
{
    NSString *path = nil;
    switch (msgType) {
        case MsgTypeTouTiao:{
            path = kTouTiaoPath;
            break;
        }
        case MsgTypeDiaoCha:{
            path = kDiaoChaPath;
            break;
        }
        case MsgTypeShiJu:{
            path = kShiJuPath;
            break;
        }
        case MsgTypeShiPing:{
            path = kShiPingPath;
            break;
        }
        case MsgTypeHiNanZhou:{
            path = kHiNanZhou;
            break;
        }
        default:
            break;
    }
    path = [NSString stringWithFormat:path,page];
    NSLog(@"%@",path);
    NSLog(@"");
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
      
        !handler ?: handler([NanFangModel parse:responseObj],nil);
    }];
}

@end
