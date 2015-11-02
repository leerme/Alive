//
//  GPBaseContectsModel.h
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPBaseContectsModel : NSObject

@property (nonatomic, copy)NSString *tel_text;

+ (id)contectsModelWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;


@end
