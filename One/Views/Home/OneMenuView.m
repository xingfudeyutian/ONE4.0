//
//  OneMenuView.m
//  One
//
//  Created by hanyutong on 2017/7/4.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMenuView.h"

@interface OneMenuView ()


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
//    timeL.text = @"10小时前";
    timeL.font = [UIFont systemFontOfSize:10];
    timeL.textColor = [UIColor lightGrayColor];
    [self.timeL sizeToFit];
    [self addSubview:timeL];
    
    UILabel * likeCountL = [[UILabel alloc] init];
    self.likeCountL = likeCountL;
//    likeCountL.text = @"21313";
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
    
    
    [self.likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.right.equalTo(self.likeCountL.mas_left);
        make.width.equalTo(self.likeButton.mas_height);
    }];
    
    [self.likeCountL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(-OneMergin/4);
        make.height.mas_equalTo(OneMergin/2);
        make.right.equalTo(self.shareButton.mas_left).offset(-OneMergin);
    }];

    [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self);
        make.width.equalTo(self.shareButton.mas_height);
    }];
    
}

- (void)setContentModel:(OneContentList *)contentModel
{
    _contentModel = contentModel;
    self.timeL.text = contentModel.post_date;
    self.likeCountL.text = contentModel.like_count;

}


@end
