//
//  NewListViewController.m
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NewListViewController.h"
#import "NanFangModel.h"
#import "TitleCell.h"
#import "NormolCell.h"
#import "ImgListCell.h"
#import "PlayerCell.h"
#import "NetManager.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "WebViewController.h"
@interface NewListViewController ()
@property(nonatomic,strong)NSMutableArray<NanFangModel *> *dataList;
@property(nonatomic,assign)NSInteger page;
@end

@implementation NewListViewController

- (instancetype)initWithMsgType:(MsgType)msgType
{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        self.msgType = msgType;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TitleCell class] forCellReuseIdentifier:@"TitleCell"];
    [self.tableView registerClass:[NormolCell class] forCellReuseIdentifier:@"NormolCell"];
    [self.tableView registerClass:[ImgListCell class] forCellReuseIdentifier:@"ImgListCell"];
    [self.tableView registerClass:[PlayerCell class] forCellReuseIdentifier:@"PlayerCell"];
//    UIImageView *titleImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"titleImg"]];
//    titleImg.frame = CGRectMake(0, 0, 30, 20 );
//    self.navigationItem.titleView = titleImg;

    
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.659 green:0.047 blue:0.039 alpha:1.000];
    
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
        [NetManager getNanFanghandler:0 msgType:weakSelf.msgType handler:^(NSArray<NanFangModel *> *model, NSError *error) {
            if (error) {
                [weakSelf.view showMsg:@"❌"];
            }
            else{
                [weakSelf.dataList removeAllObjects];
                [weakSelf.dataList addObjectsFromArray:model];
                [weakSelf.tableView reloadData];
                _page = 0;
            }
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [weakSelf.tableView beginHeaderRefresh];
    
    [self.tableView addFooterRefresh:^{
       [NetManager getNanFanghandler:_page + 10 msgType:weakSelf.msgType handler:^(NSArray<NanFangModel *> *model, NSError *error) {
           if (error) {
               [weakSelf.view showMsg:error.description];
           }
           else{
               [weakSelf.dataList addObjectsFromArray:model];
               [weakSelf.tableView reloadData];
               _page += 10;
               
               [weakSelf.tableView endFooterRefresh];
           }
           
       }];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WebViewController *wvc = [[WebViewController alloc]initWithURL:self.dataList[indexPath.row].snsShare.url.yx_URL];
    [self.navigationController pushViewController:wvc animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NanFangModel *model = _dataList[indexPath.row];
    if (indexPath.row == 0) {
        return 200;
    }
    if (model.abstract_medias.count != 0) {
        return [tableView fd_heightForCellWithIdentifier:@"ImgListCell" configuration:^(ImgListCell *cell) {
            cell.titleLb.text = model.subject;
            [cell imgList];
        }];
    }
    if ([model.source isEqualToString:@"视频"]) {
        return [tableView fd_heightForCellWithIdentifier:@"PlayerCell" configuration:^(PlayerCell *cell) {
            cell.titleLb.text = model.subject;
            cell.typeLb.text = model.source;
        }];
    }
    else{
        NanFangModel *model = self.dataList[indexPath.row];
        return [tableView fd_heightForCellWithIdentifier:@"NormolCell" configuration:^(NormolCell *cell) {
            cell.titleLb.text = model.subject;
        }];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.preservesSuperviewLayoutMargins = NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"");
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     NanFangModel *model = _dataList[indexPath.row];
    if (indexPath.row == 0) {
        TitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleCell" forIndexPath:indexPath];
//        NSLog(@"%@",_dataList);
        
        cell.typeLb.text = model.source;
        cell.titleLb.text = model.subject;
        //服务器数据时间
        NSString *yearStr = [model.modified substringWithRange:NSMakeRange(0, 4) ];
        NSString *moonStr = [model.modified substringWithRange:NSMakeRange(5, 2) ];
        NSString *dayStr = [model.modified substringWithRange:NSMakeRange(8, 2)];
        NSString *hhStr = [model.modified substringWithRange:NSMakeRange(11, 2)];
        NSString* str = [NSString stringWithFormat:@"%@月%@日",moonStr,dayStr];
        NSInteger yearint = [yearStr integerValue];
        NSInteger moonint = [moonStr integerValue];
        NSInteger dayint = [dayStr integerValue];
        NSInteger hhint = [hhStr integerValue];
        
        /**
         *  当前系统时间
         */
        NSDate *curda = [NSDate date];
        NSDateFormatter *dateStr = [[NSDateFormatter alloc]init];
        [dateStr setDateFormat:@"YYYYMMddHHmmss"];
        NSString *dateString = [dateStr stringFromDate:curda];
        NSString *curYearStr = [dateString substringWithRange:NSMakeRange(0, 4)];
        NSString *curMoonStr = [dateString substringWithRange:NSMakeRange(4, 2)];
        NSString *curdayStr = [dateString substringWithRange:NSMakeRange(6, 2)];
        NSString *curHHStr = [dateString substringWithRange:NSMakeRange(8, 2)];
        NSInteger curyearint = [curYearStr integerValue];
        NSInteger curmoonint = [curMoonStr integerValue];
        NSInteger curdayint = [curdayStr integerValue];
        NSInteger curhhint = [curHHStr integerValue];
        if ((curyearint - yearint) == 0) {
            if ((curmoonint - moonint) == 0) {
                if ((curdayint - dayint) == 0) {
                    if ((curhhint - hhint) <= 1) {
                        cell.timeLb.text = @"刚刚";
                    }
                    else{
                        NSString *dateStr = [NSString stringWithFormat:@"%ld小时前",curhhint - hhint];
                        cell.timeLb.text = dateStr;
                    }
                }
                else
                {
                    cell.timeLb.text = str;
                }
            }
            else
            {
                cell.timeLb.text = str;
            }
        }
     
        NSString *imgPath = [NSString stringWithFormat:@"http://images.infzm.com/medias/%@",model.media];
        [cell.headView setImageURL:imgPath.yx_URL];
        return cell;
    }
    if ([model.source isEqualToString:@"视频"]) {
        PlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell" forIndexPath:indexPath];
        cell.titleLb.text = model.subject;
        cell.typeLb.text = model.source;
        NSString *imgPath = [NSString stringWithFormat:@"http://images.infzm.com/medias/%@",model.media];
        [cell.headImg setImageURL:imgPath.yx_URL];
        
        NSString *yearStr = [model.modified substringWithRange:NSMakeRange(0, 4) ];
        NSString *moonStr = [model.modified substringWithRange:NSMakeRange(5, 2) ];
        NSString *dayStr = [model.modified substringWithRange:NSMakeRange(8, 2)];
        NSString *hhStr = [model.modified substringWithRange:NSMakeRange(11, 2)];
        NSString* str = [NSString stringWithFormat:@"%@月%@日",moonStr,dayStr];
        
        NSInteger yearint = [yearStr integerValue];
        NSInteger moonint = [moonStr integerValue];
        NSInteger dayint = [dayStr integerValue];
        NSInteger hhint = [hhStr integerValue];
        
        /**
         *  当前系统时间
         */
        NSDate *curda = [NSDate date];
        NSDateFormatter *dateStr = [[NSDateFormatter alloc]init];
        [dateStr setDateFormat:@"YYYYMMddHHmmss"];
        NSString *dateString = [dateStr stringFromDate:curda];
        NSString *curYearStr = [dateString substringWithRange:NSMakeRange(0, 4)];
        NSString *curMoonStr = [dateString substringWithRange:NSMakeRange(4, 2)];
        NSString *curdayStr = [dateString substringWithRange:NSMakeRange(6, 2)];
        NSString *curHHStr = [dateString substringWithRange:NSMakeRange(8, 2)];
        
        NSInteger curyearint = [curYearStr integerValue];
        NSInteger curmoonint = [curMoonStr integerValue];
        NSInteger curdayint = [curdayStr integerValue];
        NSInteger curhhint = [curHHStr integerValue];
        
        if ((curyearint - yearint) == 0) {
            if ((curmoonint - moonint) == 0) {
                if ((curdayint - dayint) == 0) {
                    if ((curhhint - hhint) <= 1) {
                        cell.timeLb.text = @"刚刚";
                    }
                    else{
                        NSString *dateStr = [NSString stringWithFormat:@"%ld小时前",curhhint - hhint];
                        cell.timeLb.text = dateStr;
                    }
                }
                else
                {
                    cell.timeLb.text = str;
                }
            }
            else
            {
                cell.timeLb.text = str;
            }
        }

        return cell;
    }
    
    if (model.abstract_medias.count != 0) {
        ImgListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImgListCell" forIndexPath:indexPath];
         cell.titleLb.text = model.subject;
         cell.typeLb.text = model.source;
        
        [cell.imgList enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *imgPath = [NSString stringWithFormat:@"http://images.infzm.com/medias/%@",model.abstract_medias[idx]];
            [obj setImageWithURL:imgPath.yx_URL];
        }];
   
        //服务器数据时间
        NSString *yearStr = [model.modified substringWithRange:NSMakeRange(0, 4) ];
        NSString *moonStr = [model.modified substringWithRange:NSMakeRange(5, 2) ];
        NSString *dayStr = [model.modified substringWithRange:NSMakeRange(8, 2)];
        NSString *hhStr = [model.modified substringWithRange:NSMakeRange(11, 2)];
        NSString* str = [NSString stringWithFormat:@"%@月%@日",moonStr,dayStr];
        
        NSInteger yearint = [yearStr integerValue];
        NSInteger moonint = [moonStr integerValue];
        NSInteger dayint = [dayStr integerValue];
        NSInteger hhint = [hhStr integerValue];
        
        /**
         *  当前系统时间
         */
        NSDate *curda = [NSDate date];
        NSDateFormatter *dateStr = [[NSDateFormatter alloc]init];
        [dateStr setDateFormat:@"YYYYMMddHHmmss"];
        NSString *dateString = [dateStr stringFromDate:curda];
        NSString *curYearStr = [dateString substringWithRange:NSMakeRange(0, 4)];
        NSString *curMoonStr = [dateString substringWithRange:NSMakeRange(4, 2)];
        NSString *curdayStr = [dateString substringWithRange:NSMakeRange(6, 2)];
        NSString *curHHStr = [dateString substringWithRange:NSMakeRange(8, 2)];
        
        NSInteger curyearint = [curYearStr integerValue];
        NSInteger curmoonint = [curMoonStr integerValue];
        NSInteger curdayint = [curdayStr integerValue];
        NSInteger curhhint = [curHHStr integerValue];
        
        if ((curyearint - yearint) == 0) {
            if ((curmoonint - moonint) == 0) {
                if ((curdayint - dayint) == 0) {
                    if ((curhhint - hhint) <= 1) {
                        cell.timeLb.text = @"刚刚";
                    }
                    else{
                        NSString *dateStr = [NSString stringWithFormat:@"%ld小时前",curhhint - hhint];
                        cell.timeLb.text = dateStr;
                    }
                }
                else
                {
                    cell.timeLb.text = str;
                }
            }
            else
            {
                cell.timeLb.text = str;
            }
        }
        return cell;
    }
    
    else{
        NormolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NormolCell" forIndexPath:indexPath];
        
        cell.titleLb.text = model.subject;
        NSString *imgPath = [NSString stringWithFormat:@"http://images.infzm.com/medias/%@",model.media];
//        NSLog(@"图片地址是%@没了",imgPath);
        [cell.headIV setImageURL:imgPath.yx_URL];
        cell.typeLb.text = model.source;

        //服务器数据时间
        NSString *yearStr = [model.modified substringWithRange:NSMakeRange(0, 4) ];
        NSString *moonStr = [model.modified substringWithRange:NSMakeRange(5, 2) ];
        NSString *dayStr = [model.modified substringWithRange:NSMakeRange(8, 2)];
        NSString *hhStr = [model.modified substringWithRange:NSMakeRange(11, 2)];
        NSString* str = [NSString stringWithFormat:@"%@月%@日",moonStr,dayStr];

         NSInteger yearint = [yearStr integerValue];
         NSInteger moonint = [moonStr integerValue];
         NSInteger dayint = [dayStr integerValue];
         NSInteger hhint = [hhStr integerValue];
  
        /**
         *  当前系统时间
         */
        NSDate *curda = [NSDate date];
        NSDateFormatter *dateStr = [[NSDateFormatter alloc]init];
        [dateStr setDateFormat:@"YYYYMMddHHmmss"];
        NSString *dateString = [dateStr stringFromDate:curda];
        NSString *curYearStr = [dateString substringWithRange:NSMakeRange(0, 4)];
        NSString *curMoonStr = [dateString substringWithRange:NSMakeRange(4, 2)];
        NSString *curdayStr = [dateString substringWithRange:NSMakeRange(6, 2)];
        NSString *curHHStr = [dateString substringWithRange:NSMakeRange(8, 2)];

        NSInteger curyearint = [curYearStr integerValue];
        NSInteger curmoonint = [curMoonStr integerValue];
        NSInteger curdayint = [curdayStr integerValue];
        NSInteger curhhint = [curHHStr integerValue];
       
        if ((curyearint - yearint) == 0) {
            if ((curmoonint - moonint) == 0) {
                if ((curdayint - dayint) == 0) {
                    if ((curhhint - hhint) <= 1) {
                        cell.timeLb.text = @"刚刚";
                    }
                    else{
                        NSString *dateStr = [NSString stringWithFormat:@"%ld小时前",curhhint - hhint];
                        cell.timeLb.text = dateStr;
                    }
                }
                else
                {
                    cell.timeLb.text = str;
                }
            }
            else
            {
                cell.timeLb.text = str;
            }
        }
        return cell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - lazy
- (NSMutableArray<NanFangModel *> *)dataList
{
    if (_dataList == nil) {
        _dataList = [[NSMutableArray<NanFangModel *> alloc]init];
    }
    return _dataList;
}

@end
