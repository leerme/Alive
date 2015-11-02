//
//  GPRegisterViewController.m
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPRegisterViewController.h"

@interface GPRegisterViewController ()

@end

@implementation GPRegisterViewController


- (void)awakeFromNib
{
    self.view.frame = CGRectMake(0, 0, GPSearchWidth, GPSearchheight);
}

- (IBAction)sureRegister:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"注册失败" message:@"请重新注册" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)protocolTouch:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"方圆协议" message:@"没事儿随便用" delegate:self cancelButtonTitle:@"GO" otherButtonTitles:nil];
    [alertView show];
}


@end
