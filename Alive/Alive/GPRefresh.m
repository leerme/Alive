//
//  GPRefresh.m
//  Alive
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPRefresh.h"

@interface GPRefresh() <MJRefreshBaseViewDelegate>

@end

@implementation GPRefresh

+ (id)refreshWithView:(id)view
{
    return [[self alloc]initWithView:view];
}

- (id)initWithView:(id)view
{
    if (self = [super init]) {
        
        //创建刷新header和footer
        [self installRefreshListWithView:view];
    }
    return self;
}


/**
 *  创建刷新的header和footer,即下拉刷新和上拉刷新
 */
- (void)installRefreshListWithView:(id)view
{
    //添加下拉刷新
    MJRefreshHeaderView *refreshHeaderView = [MJRefreshHeaderView header];
    self.refreshHeaderView = refreshHeaderView;
    refreshHeaderView.scrollView = view;  //监听view的变化,触发刷新
    refreshHeaderView.delegate = self;
    
    //添加上拉刷新
    MJRefreshFooterView *refreshFooterView = [MJRefreshFooterView footer];
    self.refreshFooterView = refreshFooterView;
    refreshFooterView.scrollView = view;
    refreshFooterView.delegate = self;
}

/**
 *  <MJRefreshBaseViewDelegate>
 *  refresh代理方法
 */
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    /**下拉刷新*/
    if ([refreshView isKindOfClass:[MJRefreshHeaderView class]]) {
        [_delegate refreshView:self andEnumStatus:GPRefreshStatusHeaderView];
        
    }else {
        [_delegate refreshView:self andEnumStatus:GPRefreshStatusFooterView];
    }
}

@end
