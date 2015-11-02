//
//  GPMenuBaseViewController.m
//  Alive
//
//  Created by qianfeng on 15-5-24.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPMenuBaseViewController.h"
#import "UIBarButtonItem+Extension.h"

@interface GPMenuBaseViewController ()


@property (nonatomic, strong)GHRevealViewController *revealVc;

@end

@implementation GPMenuBaseViewController

#pragma mark Memory Management
- (id)initWithTitle:(NSString *)title withRevealBlock:(RevealBlock)revealBlock withRevealVc:(GHRevealViewController *)revealVc
{
    if (self = [super initWithNibName:nil bundle:nil])
    {
        self.title = title;
        _revealBlock = [revealBlock copy];
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_more" andHighImage:@"navigationbar_more_highlighted" andTarget:self andAction:@selector(revealSidebar)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
        
        self.revealVc = revealVc;
    }
    return self;
}

#warning 自己添加的方法,为了能够从侧边栏菜单跳转到"活动"界面,pop出去一定要把导航栏控制器给显示出来,因为跳转进来的时候把导航栏给隐藏了,现在必须要恢复回去!!!!
- (void)backBtn
{
    [self.revealVc.navigationController popViewControllerAnimated:YES];
    [self.revealVc.navigationController setNavigationBarHidden:NO];
}


#pragma mark UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自适应高度和宽度
    self.view.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    self.view.backgroundColor = GPColor(230, 230, 230);
}

#pragma mark Private Methods


- (void)revealSidebar {
    _revealBlock();
}

@end
