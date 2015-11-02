//
//  GPDataModel.m
//  Alive
//
//  Created by qianfeng on 15-5-22.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPDataModel.h"
#import "GPListModel.h"

@implementation GPDataModel

+ (id)dataModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (NSDictionary *dic in self.list) {
            GPListModel *listModel = [GPListModel listModelWithDict:dic];
            [tmpArray addObject:listModel];
        }
        self.listModels = tmpArray;
    }
    return self;
}

@end
