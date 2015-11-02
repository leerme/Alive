//
//  UIView+Extension.h
//  新浪微博
//
//  Created by qianfeng on 15-5-16.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  category不会生成成员变量, _xxxx, 只会声明方法
 */

@interface UIView (Extension)

@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGSize  size;
@property (nonatomic, assign)CGPoint origin;


@end
