//
//  OneMenuView.h
//  One
//
//  Created by hanyutong on 2017/7/4.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneListModel.h"

@interface OneMenuView : UIView

@property (nonatomic , strong) OneContentList * contentModel;
@property (nonatomic, weak) UILabel  * timeL;
@property (nonatomic, weak) UILabel  * likeCountL;
@property (nonatomic, weak) UIButton * likeButton;
@property (nonatomic, weak) UIButton * shareButton;
- (void)setupSubViews;
- (void)setMasnory;
@end
