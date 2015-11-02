//
//  GPBaseInfoModel.h
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPBaseInfoModel : NSObject

@property (nonatomic, strong)NSString *favor_add;
@property (nonatomic, strong)NSString *favor_remove;
@property (nonatomic, strong)NSString *next_url;
@property (nonatomic, strong)NSString *tips;

+ (id)infoModelWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
