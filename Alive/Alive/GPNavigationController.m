//
//  GPNavigationController.m
//  新浪微博
//
//  Created by qianfeng on 15-5-16.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPNavigationController.h"
#import "UIView+Extension.h"
#import "UIBarButtonItem+Extension.h"
#import "UMSocial.h"

#import "GPLocationViewController.h"
#import "GPRefresh.h"

#import "GPLocationViewController.h"
#import "GPLocationCitiesModel.h"

#import "GPShowViewController.h"
#import "GPSelectViewController.h"
#import "GPMovieViewController.h"
#import "GPActivityViewController.h"
#import "GPVocationViewController.h"

#import "GPProfileViewController.h"

@interface GPNavigationController () <UMSocialUIDelegate>

@end

@implementation GPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

}


/**
 *  统一设置navigationItem的样式,如果有不同的,那么就在自己的控制器中重新设置即可
 *  调用 initialize 类方法,第一次加载NavigationController的时候就会调用此方法
 *
 */

+ (void)initialize
{
    //设置整个项目的item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置可用状态下的主题样式
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[NSFontAttributeName] = [UIFont systemFontOfSize:11.0];
    textAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    
    //设置不可用状态下的主题样式
    NSMutableDictionary *disableTextAttr = [NSMutableDictionary dictionary];
    disableTextAttr[NSFontAttributeName] = [UIFont systemFontOfSize:13.0];
    disableTextAttr[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    [item setTitleTextAttributes:disableTextAttr forState:UIControlStateDisabled];
    
}




/**
 *  重写父类的push方法,让push进去的控制器的导航栏都有相同的设置
 *  想要不同的设置,就需要在自己的控制器中修改导航栏即可
 *
 *  @param viewController 传入的控制器,利用它知道自己的导航栏
 *  @param animated
 *
 *  由此可以看出,在创建item的时候还是比较繁琐,比较啰嗦,有很多相同的东西,可以抽取出来
 *  那么也就要用到category,把这些相同的东西都封装到一个方法里,变化的东西作为参数传进去即可
 *  所以我们需要扩展一下 UIButtonTypeCustom 的方法,因为工程里面的文件都可能会用到.
 *
 *
 */

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //重写父类方法,必须要调用一次父类方法,这样才能push进去
    //子类的重写父类的方法,其实就是给父类方法增加一些功能而已,你看不见,但是你的用父类的方法!!!
    //这句话才是真正把 viewController 加入导航栏控制器中,只要加进去了,导航栏的viewControllers就会多一个元素
    //如果这句写在最下面,那么判断应该是 > 0才行
    
     [super pushViewController:viewController animated:YES];
    
    //必须要先判断一下,首页那些就不用加"返回","更多"按键
    if (viewController.navigationController.viewControllers.count > 1) {
        
        //创建 leftBarButtonItem
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_back" andHighImage:@"navigationbar_back_highlighted" andTarget:self andAction:@selector(back)];
        
        //创建 rightBarButtonItem
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"share" andHighImage:@"share_selected" andTarget:viewController andAction:@selector(shareInformation)];
    }
    
    //第一级菜单的导航栏设置
    else if (viewController.navigationController.viewControllers.count == 1) {
    
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"tabbar_profile" andHighImage:@"tabbar_profile_selected" andTarget:self andAction:@selector(profileCenter)];
        
        UIButton *locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        locationBtn.frame = CGRectMake(0, 0, 40, 40);
        [locationBtn setTitle:@"北京" forState:UIControlStateNormal];
        [locationBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [locationBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        UIButton *locationIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        locationIcon.frame = CGRectMake(0, 0, 40, 40);
        [locationIcon setImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
        [locationIcon setImage:[UIImage imageNamed:@"location_selected"] forState:UIControlStateHighlighted];
        
        [locationIcon addTarget:viewController action:@selector(locationTouch) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *btn1 = [[UIBarButtonItem alloc]initWithCustomView:locationBtn];
        UIBarButtonItem *btn2 = [[UIBarButtonItem alloc]initWithCustomView:locationIcon];
        
        viewController.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:btn2, btn1, nil];
     }
}


/**
 *  button点击事件也可以在自己的viewController中做,或者在其他controller中做
 *  只要你在那个controller中实现相应的方法即可,跟代理类似
 */
- (void)back
{
    NSLog(@"点击back");
    //由于是自定义的 navigationItem 所以需要给它一个点击事件,把当前控制器pop出去
    [self popViewControllerAnimated:YES];
}


/**
 *  跳转到个人中心设置
 */
- (void)profileCenter
{
    GPProfileViewController *profileVc = [GPProfileViewController profileViewController];
    profileVc.hidesBottomBarWhenPushed = YES;
    profileVc.title = @"个人中心";
    profileVc.tableView.bounces = NO;
    profileVc.tableView.showsVerticalScrollIndicator = NO;
    
    //采用modal的方式加载进导航栏
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:profileVc];
    nav.navigationBar.barTintColor = GPColor(230, 230, 230);
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    profileVc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationbar_back" andHighImage:@"navigationbar_back_highlighted" andTarget:profileVc andAction:@selector(modalBack)];
}


@end
