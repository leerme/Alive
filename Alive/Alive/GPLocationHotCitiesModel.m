//
//  GPLocationHotCitiesModel.m
//  Alive
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPLocationHotCitiesModel.h"

@implementation GPLocationHotCitiesModel

+ (id)hotCitiesModelWith:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
