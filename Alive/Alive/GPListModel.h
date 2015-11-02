//
//  GPListModel.h
//  Alive
//
//  Created by qianfeng on 15-5-22.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPListModel : NSObject

@property (nonatomic, copy)NSString *pk;
@property (nonatomic, copy)NSString *category;
@property (nonatomic, copy)NSString *icon;
@property (nonatomic, copy)NSString *api_url;

+ (id)listModelWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
