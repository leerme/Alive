//
//  GPBaseActivityModel.h
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPBaseActivityModel : NSObject

@property (nonatomic, copy)NSString *pk;
@property (nonatomic, copy)NSString *redis_score;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *tag;
@property (nonatomic, copy)NSArray  *contacts;   //!!!!
@property (nonatomic, copy)NSString *cate_id;
@property (nonatomic, copy)NSString *category_name;
@property (nonatomic, copy)NSString *start_time;
@property (nonatomic, copy)NSString *end_time;
@property (nonatomic, copy)NSArray  *medias;    //!!!!
@property (nonatomic, copy)NSString *city_name;
@property (nonatomic, copy)NSString *author;
@property (nonatomic, copy)NSString *list_title;
@property (nonatomic, copy)NSString *list_type;
@property (nonatomic, copy)NSString *address;
@property (nonatomic, copy)NSString *pos_str;
@property (nonatomic, copy)NSString *latitude;
@property (nonatomic, copy)NSString *longitude;
@property (nonatomic, copy)NSString *time_str_color;
@property (nonatomic, copy)NSString *time_str;
@property (nonatomic, copy)NSString *time_detail_str;
@property (nonatomic, copy)NSString *price;
@property (nonatomic, copy)NSString *content;
@property (nonatomic, copy)NSString *share_content;

@property (nonatomic, copy)NSString *web_url;
@property (nonatomic, copy)NSString *share_url;
@property (nonatomic, copy)NSString *full_url;
@property (nonatomic, copy)NSArray  *time_details;  //!!!!
@property (nonatomic, copy)NSArray  *explain_details;   //!!!
@property (nonatomic, copy)NSString *order_text;
@property (nonatomic, copy)NSString *order_url;
@property (nonatomic, copy)NSString *tpl_cell_style;


@property (nonatomic, copy)NSString *distance;
@property (nonatomic, copy)NSString *traffic;
@property (nonatomic, copy)NSString *second_title;
@property (nonatomic, copy)NSString *notice;
@property (nonatomic, copy)NSString *is_movie;
@property (nonatomic, copy)NSDictionary *open_info;   //电影专用

@property (nonatomic, copy)NSArray *mediasModels;
@property (nonatomic, copy)NSArray *contectsModels;
@property (nonatomic, copy)NSArray *timeDetailModels;

+ (id)activityModelWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;


@end
