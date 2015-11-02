//
//  GPMainTabbarController.h
//  新浪微博
//
//  Created by qianfeng on 15-5-15.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPCategoryModel;
@interface GPMainTabbarController : UITabBarController

@property (nonatomic, strong)GPCategoryModel *categoryModel;

@end
