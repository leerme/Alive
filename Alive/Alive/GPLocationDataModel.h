//
//  GPLocationDataModel.h
//  Alive
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GPLocationLbsCityModel;
@interface GPLocationDataModel : NSObject

@property (nonatomic, copy)NSArray *cities;
@property (nonatomic, copy)NSArray *hot_cities;
@property (nonatomic, copy)NSDictionary *lbs_city;

@property (nonatomic, strong)GPLocationLbsCityModel *lbsCityModel;

+ (id)locationDataModelWith:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
