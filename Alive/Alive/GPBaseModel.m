//
//  GPBaseModel.m
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPBaseModel.h"
#import "GPBaseDataModel.h"

@implementation GPBaseModel

+ (id)baseModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        GPBaseDataModel *dataModel = [GPBaseDataModel dataModelWithDict:self.data];
        self.dataModel = dataModel;
    }
    return self;
}


@end
