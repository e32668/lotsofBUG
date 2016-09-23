//
//  ImgListCell.h
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgListCell : UITableViewCell
@property (nonatomic,strong) NSMutableArray<UIImageView *> *imgList;
@property(nonatomic,strong) UILabel *titleLb;
@property(nonatomic,strong) UILabel *typeLb;
@property(nonatomic,strong) UILabel *timeLb; 

@end
