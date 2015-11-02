//
//  UIBarButtonItem+Extension.h
//  新浪微博
//
//  Created by qianfeng on 15-5-16.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (id)itemWithImage:(NSString *)image andHighImage:(NSString *)highImage andTarget:(id)target andAction:(SEL)action;

@end
