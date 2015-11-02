//
//  GPBaseSubViewController.h
//  Alive
//
//  Created by qianfeng on 15-5-29.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPBaseActivityModel;
@interface GPBaseSubViewController : UIViewController

+ (id)baseSubviewWithActivityModel:(GPBaseActivityModel *)activityModel andIndexPath:(NSIndexPath *)indexPath;

- (id)initWithActivityModel:(GPBaseActivityModel *)activityModel andIndexPath:(NSIndexPath *)indexPath;

@end
