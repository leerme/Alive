//
//  GPBaseDataModel.h
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GPBaseInfoModel;
@interface GPBaseDataModel : NSObject

@property (nonatomic, copy)NSDictionary *info;
@property (nonatomic, copy)NSArray *activities;

@property (nonatomic, strong)GPBaseInfoModel *infoModel;

+ (id)dataModelWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
