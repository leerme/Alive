//
//  GPCategoryModel.m
//  Alive
//
//  Created by qianfeng on 15-5-22.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPCategoryModel.h"
#import "GPDataModel.h"

@implementation GPCategoryModel

+ (id)categoryModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        GPDataModel *dataModel = [GPDataModel dataModelWithDict:self.data];
        self.dataModel = dataModel;
    }
    return self;
}

@end
