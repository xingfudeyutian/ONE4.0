//
//  OneContentViewController.m
//  One
//
//  Created by hanyutong on 2017/9/5.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneContentViewController.h"
#import "OneContentViewController+NetWork.h"


@interface OneContentViewController ()<UIWebViewDelegate>

@end

@implementation OneContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    [self requestContentWithUrl];

    
    UIButton * leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 30)];
    leftBtn.tag = 0;
    [leftBtn setImage:[UIImage imageNamed:@"back_default"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(navigationAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
//
    
    
    UIButton * rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 30)];
    rightBtn.tag = 1;
    [rightBtn setImage:[UIImage imageNamed:@"collect_gray"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(navigationAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    
    
}

- (void)navigationAction:(UIButton*)sender
{
    if (sender.tag == 0)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        
    }
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
