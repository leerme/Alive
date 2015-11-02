//
//  GPListModel.m
//  Alive
//
//  Created by qianfeng on 15-5-22.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPListModel.h"

@implementation GPListModel

+ (id)listModelWithDict:(NSDictionary *)dict
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

- (NSString *)description
{
    return [NSString stringWithFormat:@"pk=%@, category=%@, icon=%@, api_url=%@", _pk, _category, _icon, _api_url];
}

@end
