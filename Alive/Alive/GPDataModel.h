//
//  GPDataModel.h
//  Alive
//
//  Created by qianfeng on 15-5-22.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GPListModel;

@interface GPDataModel : NSObject

@property (nonatomic, copy)NSArray *list;

@property (nonatomic, strong)NSArray *listModels;

+ (id)dataModelWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
