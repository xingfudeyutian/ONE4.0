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
