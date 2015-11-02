//
//  GPBaseModel.h
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GPBaseDataModel;
@interface GPBaseModel : NSObject

@property (nonatomic, copy)NSString *stat;
@property (nonatomic, copy)NSString *msg;
@property (nonatomic, copy)NSDictionary *data;

@property (nonatomic, strong)GPBaseDataModel *dataModel;

+ (id)baseModelWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
