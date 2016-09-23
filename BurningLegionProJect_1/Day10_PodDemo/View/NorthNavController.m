//
//  NorthNavController.m
//  Day10_PodDemo
//
//  Created by LANGLANG on 16/9/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NorthNavController.h"

@implementation NorthNavController
-(UIStatusBarStyle)preferredStatusBarStyle{
    if(self.mm_drawerController.showsStatusBarBackgroundView){
        return UIStatusBarStyleLightContent;
    }
    else {
        return UIStatusBarStyleDefault;
    }
}

@end
