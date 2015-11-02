//
//  GPBaseActivityModel.m
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPBaseActivityModel.h"
#import "GPBaseMediasModel.h"
#import "GPBaseContectsModel.h"

@implementation GPBaseActivityModel

+ (id)activityModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        //1.转化medias模型
        NSMutableArray *tmpArray1 = [NSMutableArray array];
        for (NSDictionary *dic in self.medias) {
            GPBaseMediasModel *mediasModel = [GPBaseMediasModel mediasModelWithDict:dic];
            [tmpArray1 addObject:mediasModel];
        }
        self.mediasModels = tmpArray1;
        
        //2.转化contects模型
        NSMutableArray *tmpArray2 = [NSMutableArray array];
        for (NSDictionary *dic in self.contacts) {
            GPBaseContectsModel *contactModel = [GPBaseContectsModel contectsModelWithDict:dic];
            [tmpArray2 addObject:contactModel];
        }
        self.contectsModels = tmpArray2;
        
    }
    return self;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
