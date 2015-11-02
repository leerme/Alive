//
//  GPRevealViewController.m
//  Alive
//
//  Created by qianfeng on 15-5-24.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPRevealViewController.h"
#import "GPRevealMenuCell.h"
#import "GPRevealMenuViewController.h"
#import "GPMenuBaseViewController.h"
#import "GHRevealViewController.h"


@interface GPRevealViewController ()

@property (nonatomic, strong) GHRevealViewController *revealController;
@property (nonatomic, strong) GPRevealMenuViewController *menuController;

@end

@implementation GPRevealViewController


+ (id)revealViewController
{
    return [[self alloc]init];
}

- (id)init
{
    if (self = [super init]) {
        [self installRevealView];
    }
    return self;
}


- (id)installRevealView
{
    //1.设置 revealController
    self.revealController = [[GHRevealViewController alloc] initWithNibName:nil bundle:nil];
    self.revealController.view.backgroundColor = [UIColor lightGrayColor];
    RevealBlock revealBlock = ^(){
        [self.revealController toggleSidebar:!self.revealController.sidebarShowing
                                    duration:kGHRevealSidebarDefaultAnimationDuration];
    };
    
    //2.
    NSArray *headers = @[
                         [NSNull null],
                         @"分类",
                         ];
    NSArray *controllers = @[
                             @[
                                 [[UINavigationController alloc] initWithRootViewController:[[GPMenuBaseViewController alloc] initWithTitle:@"附近综合" withRevealBlock:revealBlock withRevealVc:self.revealController]]
                                 ],
                             @[
                                 [[UINavigationController alloc] initWithRootViewController:[[GPMenuBaseViewController alloc] initWithTitle:@"新闻" withRevealBlock:revealBlock withRevealVc:self.revealController]],
                                 [[UINavigationController alloc] initWithRootViewController:[[GPMenuBaseViewController alloc] initWithTitle:@"体育" withRevealBlock:revealBlock withRevealVc:self.revealController]],
                                 [[UINavigationController alloc] initWithRootViewController:[[GPMenuBaseViewController alloc] initWithTitle:@"美食" withRevealBlock:revealBlock withRevealVc:self.revealController]],
                                 [[UINavigationController alloc] initWithRootViewController:[[GPMenuBaseViewController alloc] initWithTitle:@"健身" withRevealBlock:revealBlock withRevealVc:self.revealController]],
                                 [[UINavigationController alloc] initWithRootViewController:[[GPMenuBaseViewController alloc] initWithTitle:@"活动" withRevealBlock:revealBlock withRevealVc:self.revealController]],
                                 [[UINavigationController alloc] initWithRootViewController:[[GPMenuBaseViewController alloc] initWithTitle:@"KTV" withRevealBlock:revealBlock withRevealVc:self.revealController]],
                                 [[UINavigationController alloc] initWithRootViewController:[[GPMenuBaseViewController alloc] initWithTitle:@"地图" withRevealBlock:revealBlock withRevealVc:self.revealController]]
                                 
                                 ]
                             ];
    NSArray *cellInfos = @[
                           @[
                               @{kSidebarCellImageKey: [UIImage imageNamed:@"ktv.png"], kSidebarCellTextKey: NSLocalizedString(@"附近综合", @"")}
                               ],
                           @[
                               @{kSidebarCellImageKey: [UIImage imageNamed:@"mynews.png"], kSidebarCellTextKey: NSLocalizedString(@"新闻", @"")},
                               @{kSidebarCellImageKey: [UIImage imageNamed:@"ktv.png"], kSidebarCellTextKey: NSLocalizedString(@"体育", @"")},
                               @{kSidebarCellImageKey: [UIImage imageNamed:@"ktv.png"], kSidebarCellTextKey: NSLocalizedString(@"美食", @"")},
                               @{kSidebarCellImageKey: [UIImage imageNamed:@"ktv.png"], kSidebarCellTextKey: NSLocalizedString(@"健身", @"")},
                               @{kSidebarCellImageKey: [UIImage imageNamed:@"ktv.png"], kSidebarCellTextKey: NSLocalizedString(@"活动", @"")},
                               @{kSidebarCellImageKey: [UIImage imageNamed:@"ktv.png"], kSidebarCellTextKey: NSLocalizedString(@"KTV", @"")},
                               @{kSidebarCellImageKey: [UIImage imageNamed:@"ktv.png"], kSidebarCellTextKey: NSLocalizedString(@"地图", @"")},
                               ]
                           ];
    
    
    //3.
    self.menuController = [[GPRevealMenuViewController alloc] initWithSidebarViewController:self. revealController withSearchBar:nil withHeaders:headers withControllers:controllers withCellInfos:cellInfos];
    
    return self.revealController;
}


@end
