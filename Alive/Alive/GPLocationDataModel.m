//
//  GPLocationDataModel.m
//  Alive
//
//  Created by qianfeng on 15-5-27.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPLocationDataModel.h"
#import "GPLocationCitiesModel.h"
#import "GPLocationHotCitiesModel.h"
#import "GPLocationLbsCityModel.h"

@implementation GPLocationDataModel

+ (id)locationDataModelWith:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        //cities
        NSMutableArray *tmpArray = [NSMutableArray array];
        for (NSDictionary *dic in self.cities) {
            GPLocationCitiesModel *citiesModel = [GPLocationCitiesModel citiesModelWith:dic];
            [tmpArray addObject:citiesModel];
        }
        self.cities = tmpArray;  //直接存回数组中,覆盖之前的数据
    
        //hot_cities
        NSMutableArray *tmpArray2 = [NSMutableArray array];
        for (NSDictionary *dic in self.hot_cities) {
            GPLocationHotCitiesModel *hotCitiesModel = [GPLocationHotCitiesModel hotCitiesModelWith:dic];
            [tmpArray2 addObject:hotCitiesModel];
        }
        self.hot_cities = tmpArray2;
        
        //lbs_city
        GPLocationLbsCityModel *lbsCityModel = [GPLocationLbsCityModel lbsCityModelWith:self.lbs_city];
        self.lbsCityModel= lbsCityModel;
    }
    return self;
}

@end
