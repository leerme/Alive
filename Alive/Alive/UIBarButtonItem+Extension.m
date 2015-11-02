//
//  UIBarButtonItem+Extension.m
//  新浪微博
//
//  Created by qianfeng on 15-5-16.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (id)itemWithImage:(NSString *)image andHighImage:(NSString *)highImage andTarget:(id)target andAction:(SEL)action
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置图片
    [backBtn setImage:[UIImage imageNamed:image] forState: UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    //设置点击事件
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置frame才能显示, navigationItem,只能设置它的size,位置不能变
    backBtn.size = backBtn.currentImage.size;
    
    return [[UIBarButtonItem alloc]initWithCustomView:backBtn];
}

@end
