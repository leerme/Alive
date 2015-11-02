//
//  GPMenuBaseViewController.h
//  Alive
//
//  Created by qianfeng on 15-5-24.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NSObject+Subscripts.h"
#import "GHRevealViewController.h"

typedef void (^RevealBlock)();

@interface GPMenuBaseViewController : UIViewController
{
@private
    RevealBlock _revealBlock;
}

- (void)revealSidebar;

- (id)initWithTitle:(NSString *)title withRevealBlock:(RevealBlock)revealBlock withRevealVc:(GHRevealViewController *)revealVc;

@end
