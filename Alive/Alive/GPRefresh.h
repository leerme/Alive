//
//  GPRefresh.h
//  Alive
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "MJRefresh.h"
#import "GPRefresh.h"


/**
 *  本类主要用于管理刷新加载数据相关操作
 */


/**
 枚举类型,用于手势的判断
 */
typedef enum GPRefreshStatus {
    GPRefreshStatusHeaderView = 0,  //下拉刷新
    GPRefreshStatusFooterView   //上拉刷新
}GPRefreshStatus;



/**
 *  自定义代理方法,触发刷新时代理调用该方法
 */
@class GPRefresh;
@protocol GPRefreshDelegate <NSObject>

/**
 *  需要刷新加载数据的时候调用该方法
 *
 *  @param refresh       本身
 *  @param refreshStatus 上下拉
 */
- (void)refreshView:(GPRefresh *)refresh  andEnumStatus:(GPRefreshStatus)refreshStatus;

@end


@interface GPRefresh : NSObject

/**放在这里是为了继承于它的页面可以自由的去掉不想要的控件,比如搜索框*/
@property (nonatomic, weak)MJRefreshHeaderView *refreshHeaderView;
@property (nonatomic, weak)MJRefreshFooterView *refreshFooterView;

@property (nonatomic, strong)id<GPRefreshDelegate> delegate;

+ (id)refreshWithView:(id)view;
- (id)initWithView:(id)view;

@end
