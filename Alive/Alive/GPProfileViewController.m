//
//  GPProfileViewController.m
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPProfileViewController.h"
#import "GPHeaderView.h"
#import "GPLoginViewController.h"
#import "UMSocial.h"

@interface GPProfileViewController ()

@property (nonatomic, copy)NSArray *nameArray;
@property (nonatomic, strong)GPHeaderView *headerView;

@end

@implementation GPProfileViewController

/**
 *  个人中心构造方法
 *
 *  @return self
 */
+ (id)profileViewController
{
    return [[self alloc]init];
}


/**
 *  重写父类的init方法,用于创建个人中心的各个子控件
 *
 *  @return self
 */
- (id)init
{
    if (self = [super init]) {
        //1.创建数组,给cell赋值
        NSArray *nameArray = @[@"个人收藏",@"通知中心",@"我的订单",@"推荐app给好友",@"收货地址",@"关于我们"];
        self.nameArray = nameArray;
        
        //2.添加headerView
        [self addTableHeaderView];
    }
    return self;
}


/**
 *  添加tableView的headerView
 */
- (void)addTableHeaderView
{
    /**
     *  创建headerView,headerView从xib中加载,不能直接添加到tableView得header上
     *  需要先添加一个view,把view加载到tableView得header上,headerView添加到view上,否则headerView
     *  会覆盖一点cell的内容
     */
    //view,用于承载headerView
    UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, GPScreenWidth, 216)];
    [self.view addSubview: myView];
    myView.backgroundColor = GPColor(230, 230, 230);
    
    //真正的headerView
    GPHeaderView *headerView = [GPHeaderView headViewWithTableView:self.tableView];
    headerView.frame = CGRectMake(0, 0, 375, 245);
    headerView.backgroundColor = GPColor(102, 165, 206);
    [myView addSubview:headerView];
    
    //添加到tableView的headerView上
    self.tableView.tableHeaderView = myView;
    self.headerView = headerView;
    
    //给headerView添加一个点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHeaderView)];
    [headerView addGestureRecognizer:tap];
}


/**
 *  headerView的点击手势事件,跳转到登录页面
 */
- (void)tapHeaderView
{
    GPLoginViewController *loginVc = [[GPLoginViewController alloc]init];
    loginVc.view.backgroundColor = GPColor(102, 165, 206);
    loginVc.title = @"登录";
    [self.navigationController pushViewController:loginVc animated:YES];
}


/**
 *  把当前VC pop出去,由于用的是modal的方式,所以用dismiss
 */
- (void)modalBack
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"profileCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [self.nameArray objectAtIndex:indexPath.row]; //从0开始的
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.f;
}
- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"touch cell");
    
    //分享app
    if (indexPath.row == 3) {
        [self shareApp];
    }
    //关于偶们
    else if (indexPath.row == 5) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"关于偶们" message:@"与品质的不期而遇,探索属于你的精彩生活.方圆是一款生活休闲指南应用,为年轻人提供一流品质生活精选.精彩电影,音乐,演出,周边游,活动,提供一站式预定购票服务,打造属于你的快乐周末,方圆与你同在" delegate:self cancelButtonTitle:@"Got it" otherButtonTitles:nil];
        [alertView show];
    }
    //其他cell均跳转到登录界面
    else {
        [self tapHeaderView];
    }
    
}


/**
 *  点击分享按钮,执行分享操作
 */
- (void)shareApp
{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5563454767e58e85f6003623"
                                      shareText:@"方圆,你的周末"
                                     shareImage:[UIImage imageNamed:@"AppIcon60x60"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,UMShareToRenren,UMShareToDouban,UMShareToEmail,UMShareToSms,UMShareToFacebook,nil]
                                       delegate:nil];
}


@end
