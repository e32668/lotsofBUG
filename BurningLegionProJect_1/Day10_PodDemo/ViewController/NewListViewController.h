//
//  NewListViewController.h
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetManager.h"
@interface NewListViewController : UITableViewController
@property(nonatomic) MsgType msgType;
- (instancetype)initWithMsgType:(MsgType)msgType;
@end
