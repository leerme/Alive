//
//  GPHeaderView.m
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPHeaderView.h"

@interface GPHeaderView()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation GPHeaderView

+ (id)headViewWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"header";
    UINib *nib = [UINib nibWithNibName:@"GPHeaderView" bundle:nil];
    [tableView registerNib:nib forHeaderFooterViewReuseIdentifier:identifier];
    return  [[nib instantiateWithOwner:nil options:nil] lastObject];
}


- (void)awakeFromNib
{
    self.imageView.image = [UIImage imageNamed:@"avatar_default_big"];
    self.imageView.layer.cornerRadius = 35;
    self.imageView.layer.masksToBounds = YES;
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 216);
}

@end
