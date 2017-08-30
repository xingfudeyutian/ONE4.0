//
//  OneTipsMenuView.m
//  One
//
//  Created by hanyutong on 2017/8/29.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneTipsMenuView.h"


@interface OneTipsMenuView ()

@property (nonatomic, weak) UIButton * tipsBtn;
@property (nonatomic, weak) UIButton * collectBtn;

@end


@implementation OneTipsMenuView

- (void)setupSubViews
{
    [super setupSubViews];
    
    self.timeL.hidden = YES;
    
    
    
    UIButton * tipsBtn = [[UIButton alloc] init];
    self.tipsBtn = tipsBtn;
    tipsBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [tipsBtn setImage:[UIImage imageNamed:@"note_gray_mini"] forState:UIControlStateNormal];
    [tipsBtn setTitle:@"小记" forState:UIControlStateNormal];
    [tipsBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self addSubview:tipsBtn];
    
    
    UIButton * collectBtn = [[UIButton alloc] init];
    self.collectBtn = collectBtn;
    [collectBtn setImage:[UIImage imageNamed:@"collect_gray_mini"] forState:UIControlStateNormal];
    [self addSubview:collectBtn];
    
    
}

-(void)setMasnory
{

    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.height.equalTo(self);
    }];
    
    
    [self.tipsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(3*OneMergin);
    }];
    
    
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.right.equalTo(self.likeCountL.mas_left);
        make.width.equalTo(self.likeButton.mas_height);
    }];
    
    [self.likeCountL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(-OneMergin/4);
        make.height.mas_equalTo(OneMergin/2);
        make.width.mas_equalTo(OneMergin*2);
        make.right.equalTo(self.collectBtn.mas_left);
    }];
    [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.bottom.right.equalTo(self);
       make.width.equalTo(self.collectBtn.mas_height);
       make.right.equalTo(self.shareButton.mas_left).offset(-OneMergin*2);
    }];
    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.width.equalTo(self.shareButton.mas_height);
    }];
    
}




@end
