//
//  GPBaseDataModel.m
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPBaseDataModel.h"
#import "GPBaseInfoModel.h"
#import "GPBaseActivityModel.h"

@implementation GPBaseDataModel

+ (id)dataModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        //1.转化info
        GPBaseInfoModel *infoModel = [GPBaseInfoModel infoModelWithDict:self.info];
        self.infoModel = infoModel;
        
        //2.转化activity
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (NSDictionary *dic in self.activities) {
            GPBaseActivityModel *activityModel = [GPBaseActivityModel activityModelWithDict:dic];
            [tmpArray addObject:activityModel];
        }
        self.activities = tmpArray;   //直接存回原来的数组中,节省内存
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
