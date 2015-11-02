//
//  GPBaseViewController.m
//  Alive
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPBaseViewController.h"


@interface GPBaseViewController ()<MJRefreshBaseViewDelegate, GPRefreshDelegate,locationViewControllerDelegate>

@end

@implementation GPBaseViewController

- (void)viewDidLoad
{
    //1.加载网络数据
    [self startDownloadDataWithEnumStatus:GPRefreshStatusHeaderView andUrlString:self.currentUrl];
    //2.创建刷新列表
    [self createRefresh];
}


/**
 *  创建刷新加载功能
 */
- (void)createRefresh
{
    GPRefresh *refresh = [GPRefresh refreshWithView:self.collectionView];
    refresh.delegate = self;
    self.refresh = refresh;
}

/*
 *  刷新的时候调用代理方法
 *
 *  @param refresh       刷新对象本身
 *  @param refreshStatus 刷新的类型,上拉或者下拉
 */
- (void)refreshView:(GPRefresh *)refresh andEnumStatus:(GPRefreshStatus)refreshStatus
{
    //next_url始终是当前页面的下一级页面,加载此url能够获取新的数据
    //由于电影的next_url为空,需要特殊判断
    if ([self.baseModel.dataModel.infoModel.next_url isEqualToString:@""]) {
        NSString *urlString = self.currentUrl;
        [self startDownloadDataWithEnumStatus:refreshStatus andUrlString:urlString];

    }else {
        NSString *urlString = self.baseModel.dataModel.infoModel.next_url;
        [self startDownloadDataWithEnumStatus:refreshStatus andUrlString:urlString];
    }
}


/**
 *  加载网络数据
 *
 *  @param refreshStatus 刷新手势
 *  @param string        加载新数据url string
 */
-(void)startDownloadDataWithEnumStatus:(GPRefreshStatus)refreshStatus andUrlString:(NSString *)string
{
    
    //注意: 程序刚开始的时候不需要显示, 显示则显示位置有问题
    if(_isShowHUD == NO)
    {
        _isShowHUD = YES;
    }else{
        // 显示一个HUB进度表 显示....
        [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleFade];
        [MMProgressHUD showWithTitle:nil status:@"玩命加载中..." image:[UIImage imageNamed:@"face"]];
    }
    self.currentUrl = string;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:self.currentUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //转换模型数据
        GPBaseModel *baseModel = [GPBaseModel baseModelWithDict:responseObject];
        //判断是上拉还是下拉
        if (refreshStatus == GPRefreshStatusHeaderView) {
            self.baseModel = baseModel;
        }else {
            //注意:存放模型数据的时候不能把之前的数据覆盖了,需要在后面继续存放,否则会只显示一页的数据
            //此时的self.selectModel仍然是未加载新数据的模型
            NSMutableArray *newDataArray = [NSMutableArray arrayWithArray:self.baseModel.dataModel.activities];
            [newDataArray addObjectsFromArray:baseModel.dataModel.activities];
            self.baseModel = baseModel; //更新self.select,此时是新加载的模型数据
            self.baseModel.dataModel.activities = newDataArray;//把上一次的模型数据写入本次
        }
#warning mark - 网络加载完成之后,必须要roload一次,因为创建cell要比网络加载(异步的)更快
        [self.collectionView reloadData];
        [MMProgressHUD dismissWithSuccess:@"下载成功"];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    //加载完成刷新后就不显示刷新
    [self.refresh.refreshFooterView endRefreshing];
    [self.refresh.refreshHeaderView endRefreshing];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.baseModel.dataModel.activities.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GPBaseActivityModel *activityModel = self.baseModel.dataModel.activities[indexPath.row];
    
    //演艺(cate_id=1)和电影(cate_id=7)的cell创建
    if ([self.category isEqualToString:@"演艺"] || [self.category isEqualToString:@"电影"]) {
        static NSString *identifier = @"baseSecondCell";
        GPBaseSecondViewCell *cell = [GPBaseSecondViewCell baseSecondViewCellWithCollectionView:collectionView andIndexPath:indexPath andIdentifier:identifier];
        cell.activityModel = activityModel;
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    
    //精选,度假,活动的cell创建
    else {
        static NSString *identifier = @"baseCell";
        GPBaseViewCell *cell = [GPBaseViewCell baseViewCellWithCollectionView:collectionView andIndexPath:indexPath andIdentifier:identifier];
        cell.activityModel = activityModel;
        return cell;
    }
    
    return nil;
}


#pragma mark - 点击了cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GPBaseActivityModel *activityModel = self.baseModel.dataModel.activities[indexPath.row];
    GPBaseSubViewController *subVc = [GPBaseSubViewController baseSubviewWithActivityModel:activityModel andIndexPath:indexPath];
    subVc.view.backgroundColor = GPColor(230, 230, 230);
    subVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:subVc animated:YES];
}

#pragma mark - item的一些布局
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(375, 400);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
{
    return 5;
}


/**
 * 跳转到城市选择页面
 */
- (void)locationTouch
{
    NSLog(@"点击了cell");
    
    GPLocationViewController *locationVc = [GPLocationViewController locationViewController];
    locationVc.hidesBottomBarWhenPushed = YES;
    locationVc.navigationItem.title = @"选择城市";
    locationVc.delegate = self;
    [self.navigationController pushViewController:locationVc animated:YES];
    locationVc.navigationItem.rightBarButtonItem = nil;  //把rightItem取消
    
}


/**
 *根据城市列表中的选择的城市修改城市
 */
- (void)changeNavigationItem:(GPLocationViewController *)locationViewController andCitiesModel:(GPLocationCitiesModel *)citiesModel
{
    UIButton *locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    locationBtn.frame = CGRectMake(0, 0, 40, 40);
    [locationBtn setTitle:citiesModel.city_name forState:UIControlStateNormal];
    [locationBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [locationBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    
    
    UIButton *locationIcon = [UIButton buttonWithType:UIButtonTypeCustom];
    locationIcon.frame = CGRectMake(0, 0, 40, 40);
    [locationIcon setImage:[UIImage imageNamed:@"location"] forState:UIControlStateNormal];
    [locationIcon setImage:[UIImage imageNamed:@"location_selected"] forState:UIControlStateHighlighted];
    
    [locationIcon addTarget:self action:@selector(locationTouch) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc]initWithCustomView:locationBtn];
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc]initWithCustomView:locationIcon];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:btn2, btn1, nil];
    
    
#warning 这里根据传出的citiesModel来获取新的url,重新加载网络(url加密无法搞!!!)
    //成都的url:http://act.myzaker.com/?c=category_list&city=%E6%88%90%E9%83%BD&lat=40.037086&lng=116.369677
    
    NSString *urlString = nil;
    if ([citiesModel.city_name isEqualToString:@"北京"]) {
        urlString = @"http://act.myzaker.com/?_appid=AndroidPhone&_bsize=720_1280&_city=beijing&_dev=15&_mac=4c%3A21%3Ad0%3A15%3Af8%3A7a&_os=4.3_M36h&_os_name=M36h&_udid=356603050966788&_v=1.0&_version=1.0&c=activity_list&category=10000&city=%E5%8C%97%E4%BA%AC&lat=40.036988&lng=116.369673&p=0&size=10";
    }else if ([citiesModel.city_name isEqualToString:@"成都"]){
        
        urlString = @"http://act.myzaker.com/?_appid=AndroidPhone&_bsize=720_1280&_city=chengdu&_dev=15&_mac=4c%3A21%3Ad0%3A15%3Af8%3A7a&_os=4.3_M36h&_os_name=M36h&_udid=356603050966788&_v=1.0&_version=1.0&c=activity_list&category=1&city=%E6%88%90%E9%83%BD&lat=40.037086&lng=116.369677&p=0&size=10";
    }else if ([citiesModel.city_name isEqualToString:@"上海"]){
        urlString = @"http://act.myzaker.com/?_appid=AndroidPhone&_bsize=720_1280&_city=shanghai&_dev=15&_mac=4c%3A21%3Ad0%3A15%3Af8%3A7a&_os=4.3_M36h&_os_name=M36h&_udid=356603050966788&_v=1.0&_version=1.0&c=activity_list&category=10000&city=%E4%B8%8A%E6%B5%B7&lat=40.036988&lng=116.369673&p=0&size=10";
    }else if ([citiesModel.city_name isEqualToString:@"广州"]){
        urlString = @"http://act.myzaker.com/?_appid=AndroidPhone&_bsize=720_1280&_city=guangzhou&_dev=15&_mac=4c%3A21%3Ad0%3A15%3Af8%3A7a&_os=4.3_M36h&_os_name=M36h&_udid=356603050966788&_v=1.0&_version=1.0&c=activity_list&category=10000&city=%E5%B9%BF%E5%B7%9E&lat=40.036988&lng=116.369673&p=0&size=10";
    }else if ([citiesModel.city_name isEqualToString:@"深圳"]){
        urlString = @"http://act.myzaker.com/?_appid=AndroidPhone&_bsize=720_1280&_city=shenzhen&_dev=15&_mac=4c%3A21%3Ad0%3A15%3Af8%3A7a&_os=4.3_M36h&_os_name=M36h&_udid=356603050966788&_v=1.0&_version=1.0&c=activity_list&category=10000&city=%E6%B7%B1%E5%9C%B3&lat=40.036988&lng=116.369673&p=0&size=10";
    }else if ([citiesModel.city_name isEqualToString:@"重庆"]){
        urlString = @"http://act.myzaker.com/?_appid=AndroidPhone&_bsize=720_1280&_city=chongqing&_dev=15&_mac=4c%3A21%3Ad0%3A15%3Af8%3A7a&_os=4.3_M36h&_os_name=M36h&_udid=356603050966788&_v=1.0&_version=1.0&c=activity_list&category=10000&city=%E9%87%8D%E5%BA%86&lat=40.036988&lng=116.369673&p=0&size=10";
    }else if ([citiesModel.city_name isEqualToString:@"杭州"]){
        urlString = @"http://act.myzaker.com/?_appid=AndroidPhone&_bsize=720_1280&_city=hangzhou&_dev=15&_mac=4c%3A21%3Ad0%3A15%3Af8%3A7a&_os=4.3_M36h&_os_name=M36h&_udid=356603050966788&_v=1.0&_version=1.0&c=activity_list&category=1&city=%E6%9D%AD%E5%B7%9E&lat=40.036988&lng=116.369673&p=0&size=10";
    }else {
        urlString = @"http://act.myzaker.com/?_appid=AndroidPhone&_bsize=720_1280&_city=wuhan&_dev=15&_mac=4c%3A21%3Ad0%3A15%3Af8%3A7a&_os=4.3_M36h&_os_name=M36h&_udid=356603050966788&_v=1.0&_version=1.0&c=activity_list&category=10000&city=%E6%AD%A6%E6%B1%89&lat=40.036988&lng=116.369673&p=0&size=10";
    }
    
    [self startDownloadDataWithEnumStatus:GPRefreshStatusHeaderView andUrlString:urlString];
}



@end
