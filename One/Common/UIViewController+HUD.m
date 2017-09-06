//
//  UIViewController+HUD.m
//  One
//
//  Created by hanyutong on 2017/9/6.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "UIViewController+HUD.h"
#import <SDWebImage/UIImage+GIF.h>


@implementation UIViewController (HUD)


// 普通加载
- (void)showLoading
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //    hud.mode = MBProgressHUDModeAnnularDeterminate;
    //    hud.label.text = @"Loading...";
}

// 下载加载带进度
- (void)showDownLoading
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = @"Loading...";
}

- (void)setDownLoadingProgress:(NSProgress *)progress
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    hud.progressObject = progress;
}


//gif
- (void)setGIFLoading
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"loading_book@3x" ofType:@"gif"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImage *image = [UIImage sd_animatedGIFWithData:data];
    UIImageView *imgV = [[UIImageView alloc] initWithImage:image];
    hud.customView = imgV;
    hud.square = YES;
}


// 隐藏加载
- (void)hideLoading
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)hideAllLoading
{
    NSEnumerator *subviewsEnum = [self.view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum)
    {
        if ([subview isKindOfClass:[MBProgressHUD class]])
        {
            [subview removeFromSuperview];
        }
    }
}

@end
