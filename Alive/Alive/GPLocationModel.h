//
//  GPLocationModel.h
//  Alive
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GPLocationDataModel;
@interface GPLocationModel : NSObject

@property (nonatomic, copy)NSString *stat;
@property (nonatomic, copy)NSString *msg;
@property (nonatomic, copy)NSDictionary *data;

@property (nonatomic, strong)GPLocationDataModel *dataModel;

+ (id)locationModelWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
