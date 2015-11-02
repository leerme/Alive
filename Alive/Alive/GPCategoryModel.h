//
//  GPCategoryModel.h
//  Alive
//
//  Created by qianfeng on 15-5-22.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GPDataModel;

@interface GPCategoryModel : NSObject

@property (nonatomic, copy)NSString *stat;
@property (nonatomic, copy)NSString *msg;
@property (nonatomic, copy)NSDictionary *data;

@property (nonatomic, strong)GPDataModel *dataModel;

+ (id)categoryModelWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
