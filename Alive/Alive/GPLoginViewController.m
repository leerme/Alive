//
//  GPLoginViewController.m
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPLoginViewController.h"
#import "GPRegisterViewController.h"
#import "GPForgetPasswdViewController.h"

@interface GPLoginViewController ()

@end

@implementation GPLoginViewController

- (void)awakeFromNib
{
    self.view.frame = CGRectMake(0, 0, GPScreenWidth, GPSearchheight);
}


- (IBAction)loginTouch:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"非常抱歉" message:@"暂时不支持登录,敬请期待" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)registerTouch:(id)sender
{
    GPRegisterViewController *registerVc = [[GPRegisterViewController alloc]init];
    registerVc.title = @"注册账号";
    registerVc.view.backgroundColor = GPColor(102, 165, 206);
    [self.navigationController pushViewController:registerVc animated:YES];
}

- (IBAction)forgetPassTouch:(id)sender
{
    GPForgetPasswdViewController *passwdVc = [[GPForgetPasswdViewController alloc]init];
    passwdVc.title = @"重置密码";
    passwdVc.view.backgroundColor = GPColor(102, 165, 206);
    [self.navigationController pushViewController:passwdVc animated:YES];
}

@end
