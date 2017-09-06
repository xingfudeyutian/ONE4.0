//
//  UIViewController+HUD.h
//  One
//
//  Created by hanyutong on 2017/9/6.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)


/**
 普通加载
 */
- (void)showLoading;

/**
 下载加载带进度
 */
- (void)showDownLoading;
- (void)setDownLoadingProgress:(NSProgress *)progress;
//gif
- (void)setGIFLoading;
/**
 隐藏加载
 */
- (void)hideLoading;

- (void)hideAllLoading;


@end
