//
//  OneContentViewController+NetWork.m
//  One
//
//  Created by hanyutong on 2017/9/5.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneContentViewController+NetWork.h"

@implementation OneContentViewController (NetWork)

- (void)requestContentWithUrl
{
    [self setGIFLoading];
    [OneHttpManager get:self.loadUrl params:nil success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        [self hideLoading];
        [self.webView loadHTMLString:responseObject[@"data"][@"html_content"] baseURL:nil];
        
    } failure:^(NSError *error) {
         [self hideLoading];
    }];
}

@end
