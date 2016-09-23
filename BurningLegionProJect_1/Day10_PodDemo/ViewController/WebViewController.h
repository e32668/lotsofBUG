//
//  WebViewController.h
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
- (instancetype) initWithURL:(NSURL *) webURL;
@property(nonatomic,strong) NSURL *webURL;
@end
