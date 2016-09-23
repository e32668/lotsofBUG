//
//  NanFangModel.h
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NanFangSnsshareModel;
@interface NanFangModel : NSObject

@property (nonatomic, copy) NSString *categories;

@property (nonatomic, copy) NSString *modified;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *introtext;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *link_id;

@property (nonatomic, copy) NSString *short_subject;

@property (nonatomic, assign) BOOL is_hot;

@property (nonatomic, strong) NanFangSnsshareModel *snsShare;

@property (nonatomic, copy) NSString *sub_subject;

@property (nonatomic, copy) NSString *subject;

@property (nonatomic, copy) NSString *cat_id;
//mytemplate -->template
@property (nonatomic, copy) NSString *mytemplate;

@property (nonatomic, copy) NSString *publish_time;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, strong) NSArray *abstract_medias;

@property (nonatomic, copy) NSString *media;

//ID-->id
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *content_type;

@property (nonatomic, copy) NSString *display_time;

@property (nonatomic, copy) NSString *ordering;

@property (nonatomic, assign) NSInteger share_count;

@property (nonatomic, copy) NSString *author_avatar;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *created;

@end

@interface NanFangSnsshareModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *qqweibo;

@property (nonatomic, copy) NSString *sina;

@end

