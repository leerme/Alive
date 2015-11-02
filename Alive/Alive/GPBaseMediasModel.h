//
//  GPBaseMediasModel.h
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPBaseMediasModel : NSObject

@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *ID;    //id修改为了ID
@property (nonatomic, copy)NSString *url;
@property (nonatomic, copy)NSString *m_url;
@property (nonatomic, copy)NSString *w;
@property (nonatomic, copy)NSString *h;

+ (id)mediasModelWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
