//
//  GPBaseViewController.h
//  Alive
//
//  Created by qianfeng on 15-5-26.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

#include "MJRefresh.h"
#include "GPRefresh.h"

#import "UIBarButtonItem+Extension.h"
#import "AFHTTPRequestOperationManager.h"
#import "MMProgressHUD.h"

#import "GPBaseModel.h"
#import "GPBaseDataModel.h"
#import "GPBaseActivityModel.h"
#import "GPBaseInfoModel.h"
#import "GPBaseSecondViewCell.h"
#import "GPBaseViewCell.h"

#import "GPLocationViewController.h"
#import "GPLocationCitiesModel.h"

#import "GPBaseSubViewController.h"


@interface GPBaseViewController : UICollectionViewController
{
    BOOL _isShowHUD;
}

@property (nonatomic, copy)NSString *currentUrl;  //自定义的,用于存储url
@property (nonatomic, strong)GPBaseModel *baseModel;
@property (nonatomic, strong)GPRefresh *refresh;

@property (nonatomic, copy)NSString *category;


-(void)startDownloadDataWithEnumStatus:(GPRefreshStatus)refreshStatus andUrlString:(NSString *)string;

@end
