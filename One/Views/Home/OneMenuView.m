//
//  OneMenuView.m
//  One
//
//  Created by hanyutong on 2017/7/4.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMenuView.h"

@interface OneMenuView ()

@property (nonatomic, weak) UILabel  * timeL;
@property (nonatomic, weak) UILabel  * likeCountL;
@property (nonatomic, weak) UIButton * likeButton;
@property (nonatomic, weak) UIButton * shareButton;

@end


@implementation OneMenuView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupSubViews];
        [self setMasnory];
    }
    return self;
}

- (void)setupSubViews
{
    UILabel * timeL = [[UILabel alloc] init];
    self.timeL = timeL;
    timeL.text = @"10小时前";
    timeL.font = [UIFont systemFontOfSize:10];
    timeL.textColor = [UIColor lightGrayColor];
    [self.timeL sizeToFit];
    [self addSubview:timeL];
    
    UILabel * likeCountL = [[UILabel alloc] init];
    self.likeCountL = likeCountL;
    likeCountL.text = @"21313";
    likeCountL.textColor = [UIColor lightGrayColor];
    likeCountL.font = [UIFont systemFontOfSize:10];
    [likeCountL sizeToFit];
    [self addSubview:likeCountL];
    
    UIButton * likeButton = [[UIButton alloc] init];
    self.likeButton = likeButton;
    [likeButton setImage:[UIImage imageNamed:@"like_gray"] forState:UIControlStateNormal];
    [likeButton setImage:[UIImage imageNamed:@"like_selected"] forState:UIControlStateSelected];
    [self addSubview:likeButton];
    
    UIButton * shareButton = [[UIButton alloc] init];
    self.shareButton = shareButton;
    [shareButton setImage:[UIImage imageNamed:@"share_gray"] forState:UIControlStateNormal];
    [self addSubview:shareButton];
}

-(void)setMasnory
{
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.height.equalTo(self);
    }];
    
    [self.likeCountL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.right.equalTo(self.likeButton.mas_left).offset(-6);
    }];
    
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.right.equalTo(self.shareButton.mas_left).offset(-20);
        make.width.equalTo(self.likeButton.mas_height);
    }];
    
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.width.equalTo(self.shareButton.mas_height);
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
@end
