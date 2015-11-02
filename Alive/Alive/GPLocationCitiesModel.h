//
//  GPLocationCitiesModel.h
//  Alive
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPLocationCitiesModel : NSObject

@property (nonatomic, copy)NSString *province_code;
@property (nonatomic, copy)NSString *city_code;
@property (nonatomic, copy)NSString *city_name;
@property (nonatomic, copy)NSString *letter;

+ (id)citiesModelWith:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
