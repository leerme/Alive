//
//  GPActivityViewController.m
//  Alive
//
//  Created by qianfeng on 15-5-21.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPActivityViewController.h"
#import "GPRevealViewController.h"
#import "GHRevealViewController.h"

@interface GPActivityViewController ()

@end

@implementation GPActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.安装导航栏图标
    [self installNavigationItem];
    
//    //2.安装侧边栏
    [self installRevealViewController];
}


#pragma mark - 方法具体实现

/**
 *  安装导航栏图标
 */
- (void)installNavigationItem
{
    //设置导航栏控制器的item
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"附近" style:UIBarButtonItemStylePlain target:self action:@selector(installRevealViewController)];
}

/**
 *  安装侧边栏
 */
- (void)installRevealViewController
{
    GPRevealViewController *reveal = [GPRevealViewController revealViewController];
    GHRevealViewController *revealVc = [reveal installRevealView];
    revealVc.navigationItem.title = @"附近综合";
    revealVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:revealVc animated:YES];
    [self.navigationController setNavigationBarHidden:YES];
}



@end
