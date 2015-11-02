//
//  GPBaseInfoModel.m
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPBaseInfoModel.h"

@implementation GPBaseInfoModel

+ (id)infoModelWithDict:(NSDictionary *)dict
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