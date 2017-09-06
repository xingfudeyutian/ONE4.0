//
//  OneHomeViewController+Action.m
//  One
//
//  Created by hanyutong on 2017/7/6.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneHomeViewController+Action.h"

@implementation OneHomeViewController (Action)

- (void)navigationAction:(UIButton*)sender
{
    
    OneSearchController * searchVC = [[OneSearchController alloc] init];
    searchVC.hidesBottomBarWhenPushed = YES;
    [searchVC setModalPresentationStyle:UIModalPresentationFullScreen];
    [searchVC setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    UINavigationController * searchNav = [[UINavigationController alloc] initWithRootViewController:searchVC];
    [self presentViewController:searchNav animated:YES completion:nil];
}

@end
