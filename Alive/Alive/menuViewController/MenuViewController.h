//
//  MenuViewController.h
//  ShouGongKe
//
//  Created by qianfeng on 15/4/23.
//  Copyright (c) 2015年 ZYF. All rights reserved.
//

//==============================================================
/**
 *  使用方法
 *
1.设置titleArray  , vcArray , frame
2.添加view
 _menuvc = [[MenuViewController alloc] initViewControllerWithTitleArray:@[@"首页",@"动态"] vcArray:@[marsterVc, dynamicVc]];
 _menuvc.view.frame = CGRectMake(0, 64, self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 49);
 [self.view addSubview:_menuvc.view];
 */
//==============================================================


#import <UIKit/UIKit.h>

@protocol MenuViewControllerDelegate <NSObject>

-(void)menuViewController:(id)vc currentPageChanged:(NSInteger)pageIndex;

@end

@interface MenuViewController : UIViewController
@property(nonatomic,assign) id<MenuViewControllerDelegate>delegate;

-(id)initWithFrame:(CGRect)frame titles:(NSArray*)titleArray vcArray:(NSArray *)vcArray;

-(id)initViewControllerWithTitleArray:(NSArray *)titleArray vcArray:(NSArray*)vcArray;
@end
