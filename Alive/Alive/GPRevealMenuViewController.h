//
//  GPRevealMenuViewController.h
//  Alive
//
//  Created by qianfeng on 15-5-24.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "NSObject+Subscripts.h"

@class GHRevealViewController;

@interface GPRevealMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
@private
    GHRevealViewController *_sidebarVC;
    UISearchBar *_searchBar;
    UITableView *_menuTableView;
    NSArray *_headers;
    NSArray *_controllers;
    NSArray *_cellInfos;
}


- (id)initWithSidebarViewController:(GHRevealViewController *)sidebarVC
                      withSearchBar:(UISearchBar *)searchBar
                        withHeaders:(NSArray *)headers
                    withControllers:(NSArray *)controllers
                      withCellInfos:(NSArray *)cellInfos;

- (void)selectRowAtIndexPath:(NSIndexPath *)indexPath
                    animated:(BOOL)animated
              scrollPosition:(UITableViewScrollPosition)scrollPosition;



@end
