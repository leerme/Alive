//
//  GPLocationModel.m
//  Alive
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPLocationModel.h"
#import "GPLocationDataModel.h"

@implementation GPLocationModel

+ (id)locationModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        GPLocationDataModel *dataModel = [GPLocationDataModel locationDataModelWith:self.data];
        self.dataModel = dataModel;
    }
    return self;
}


@end
