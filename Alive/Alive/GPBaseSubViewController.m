//
//  GPBaseSubViewController.m
//  Alive
//
//  Created by qianfeng on 15-5-29.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPBaseSubViewController.h"

#import "UIKit+AFNetworking.h"
#import "UMSocial.h"
#import "GPBaseActivityModel.h"
#import "GPBaseMediasModel.h"

@interface GPBaseSubViewController () <UIWebViewDelegate>

@property (nonatomic, strong)UIActivityIndicatorView *activityIndicatorView ;
@property (nonatomic, strong)GPBaseActivityModel *activityModel;
@property (nonatomic, assign)NSIndexPath *indexPath;

@end

@implementation GPBaseSubViewController

+ (id)baseSubviewWithActivityModel:(GPBaseActivityModel *)activityModel andIndexPath:(NSIndexPath *)indexPath
{
    return [[self alloc]initWithActivityModel:activityModel andIndexPath:indexPath];
}

- (id)initWithActivityModel:(GPBaseActivityModel *)activityModel andIndexPath:(NSIndexPath *)indexPath
{
    if (self = [super init]) {
        
        //0.保存传入的数据
        self.activityModel = activityModel;
        self.indexPath = indexPath;
        
        
        //1.创建webView,用于显示web内容视图
        UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, GPScreenWidth, GPScreenHeight)];
        webView.delegate = self;
        [self.view addSubview:webView];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:activityModel.web_url]];
        [webView loadRequest:request];
        webView.scalesPageToFit = YES;
        
        //2.创建一个指示器,用于指示webView加载
        self.activityIndicatorView = [[UIActivityIndicatorView alloc]
                                      initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] ;
        [self.activityIndicatorView setCenter: self.view.center] ;
        [self.activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleGray];
        [self.view addSubview : self.activityIndicatorView] ;
        
    }
    return self;
}

#pragma mark - webView的代理方法
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicatorView startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicatorView stopAnimating];
}



/**
 *  分享操作
 */
- (void)shareInformation
{
    NSLog(@"分享...");
    //注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
#warning 分享的图片先"异步"下载到imageView中,然后利用imageView.image上传图片,有点麻烦,不应该先下载下来又上传上去,暂时没有想到好的办法,不能用data加载方式来设置,同步线程,UI比较慢!
    //mediasModels数组中只有一个元素
    GPBaseMediasModel *mediasModel = [self.activityModel.mediasModels lastObject];
    UIImageView *imageView = [[UIImageView alloc]init];
    [imageView setImageWithURL:[NSURL URLWithString:mediasModel.m_url]];
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5563454767e58e85f6003623"
                                      shareText:[NSString stringWithFormat:@"测试分享:%@", self.activityModel.share_url]
                                     shareImage:imageView.image
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,UMShareToRenren,UMShareToDouban,UMShareToEmail,UMShareToSms,UMShareToFacebook,nil]
                                       delegate:nil];
}

@end
