//
//  GPLocationViewController.h
//  Alive
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPLocationViewController;
@class GPLocationHotCitiesModel;

@protocol locationViewControllerDelegate <NSObject>

- (void)changeNavigationItem:(GPLocationViewController *)locationViewController andCitiesModel:(GPLocationHotCitiesModel *)citiesModel;

@end


@interface GPLocationViewController : UIViewController

@property (nonatomic, strong)id<locationViewControllerDelegate> delegate;  //不能使用copy

+ (id)locationViewController;
- (id)init;

@end
