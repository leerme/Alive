//
//  GPMainTabbarController.m
//  新浪微博
//
//  Created by qianfeng on 15-5-15.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPMainTabbarController.h"

#import "GPSelectViewController.h"
#import "GPShowViewController.h"
#import "GPActivityViewController.h"
#import "GPMovieViewController.h"
#import "GPVocationViewController.h"
#import "GPNavigationController.h"
#import "UIKit+AFNetworking.h"
#import "AFHTTPRequestOperationManager.h"

#import "GPCategoryModel.h"
#import "GPDataModel.h"
#import "GPListModel.h"

#import "GPBaseViewController.h"

@interface GPMainTabbarController ()

@end


@implementation GPMainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //第一次加载网络数据!!!
    [self startDownloadData];
    
    //安装子控制器
    [self installChildController];
    
}

#pragma mark - 加载网络数据
-(void)startDownloadData
{
    
    NSLog(@"第一次加载网络中......");
    NSString *homeUrlString = GPCategoryUrl;
    
#warning 第一次网络请求必须是同步的请求,异步请求的话会先安装控制器后网络访问,导致api_url传不过去
    //2.发送网络请求,发送一个同步网络请求
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:homeUrlString]];
    NSURLResponse *resqonse = [[NSURLResponse alloc]init];
    NSError *error;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&resqonse error:&error ];
    
#warning 可以返回 NSJSONSerialization或NSDictionary等其他类型,因为返回为id
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    GPCategoryModel *categoryModel = [GPCategoryModel categoryModelWithDict:jsonDict];
    self.categoryModel = categoryModel;
    NSLog(@"加载完成!");
}

#pragma mark - 加载子控制器
- (void)installChildController
{
    //创建子控制器加入到tabbar控制器中

#warning 初始化UICollectionController的时候必须要用layout,此处用了用一个layout,不知道有问题否???
#warning 有问题,应该单独设置一个layout,否则改不了collectionView的布局
    
     GPListModel *listModel = [[GPListModel alloc]init];
    
    //1.创建"精选"控制器
    UICollectionViewFlowLayout *layOut1 = [[UICollectionViewFlowLayout alloc]init];
    GPSelectViewController *selectVc = [[GPSelectViewController alloc]initWithCollectionViewLayout:layOut1];
    listModel = self.categoryModel.dataModel.listModels[0];
    selectVc.currentUrl = listModel.api_url;
    selectVc.category = listModel.category;
    [self addWithChildVc:selectVc andTitle:@"精选" andImage:@"select"];

    
    //2.创建"演艺"控制器
    UICollectionViewFlowLayout *layOut2 = [[UICollectionViewFlowLayout alloc]init];
    //    layOut2.scrollDirection = UICollectionViewScrollDirectionHorizontal; //水平滚动
    GPShowViewController *showVc = [[GPShowViewController alloc]initWithCollectionViewLayout:layOut2];
    //    showVc.collectionView.pagingEnabled = YES;
    listModel = self.categoryModel.dataModel.listModels[1];
    showVc.currentUrl = listModel.api_url;
    showVc.category = listModel.category;
    [self addWithChildVc:showVc andTitle:@"演艺" andImage:@"show"];
    
    
    //3.创建"度假"控制器
    UICollectionViewFlowLayout *layOut3 = [[UICollectionViewFlowLayout alloc]init];
    GPVocationViewController *vocationVc = [[GPVocationViewController alloc]initWithCollectionViewLayout:layOut3];
    listModel = self.categoryModel.dataModel.listModels[2];
    vocationVc.currentUrl = listModel.api_url;
    vocationVc.category = listModel.category;
    [self addWithChildVc:vocationVc andTitle:@"度假" andImage:@"vocation"];
    
    //4.创建"电影"控制器
    UICollectionViewFlowLayout *layOut4 = [[UICollectionViewFlowLayout alloc]init];
    GPMovieViewController *movieVc = [[GPMovieViewController alloc]initWithCollectionViewLayout:layOut4];
    listModel = self.categoryModel.dataModel.listModels[3];
    movieVc.currentUrl = listModel.api_url;
    movieVc.category = listModel.category;
    [self addWithChildVc:movieVc andTitle:@"电影" andImage:@"movie2"];
    
    //5.创建"活动"控制器
    UICollectionViewFlowLayout *layOut5 = [[UICollectionViewFlowLayout alloc]init];
    GPActivityViewController *activityVc = [[GPActivityViewController alloc]initWithCollectionViewLayout:layOut5];
    listModel = self.categoryModel.dataModel.listModels[4];
    activityVc.currentUrl = listModel.api_url;
    activityVc.category = listModel.category;
    [self addWithChildVc:activityVc andTitle:@"活动" andImage:@"activity"];
    
    
}



- (void)addWithChildVc:(UICollectionViewController *)childVc andTitle:(NSString *)title andImage:(NSString *)imageName
{
    
    //1.设置子控制器文字,把tabBarItem和navigationItem的文字设置为一样的
    childVc.title = title;
    
    //2.设置子控制器的图片
    childVc.collectionView.backgroundColor = GPColor(230, 230, 230);
    childVc.tabBarItem.Image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    //3.设置字体样式
    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [childVc.tabBarItem setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    
    NSMutableDictionary *selectAttr = [NSMutableDictionary dictionary];
    selectAttr[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    selectAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectAttr forState:UIControlStateSelected];
    
    //4.根据传入的控制器,创建导航栏控制器,自定义的导航栏控制器
    GPNavigationController *navVc = [[GPNavigationController alloc]initWithRootViewController:childVc];  //其实这里就调用了push方法
    [self addChildViewController:navVc];
}


@end
