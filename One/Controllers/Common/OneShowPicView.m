//
//  OneShowPicView.m
//  One
//
//  Created by hanyutong on 2017/9/7.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneShowPicView.h"


@interface OneShowPicView ()

@property (nonatomic, weak) UILabel * volLabel;
@property (nonatomic, weak) UIImageView * iconImageV;
@property (nonatomic, weak) UILabel * authorLabel;
@property (nonatomic, weak) UIButton * bgBtn;

@end

@implementation OneShowPicView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupSubViews];
    }
    return self;
}


- (void)setupSubViews
{
    
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.9];
    
    
    UIButton * bgBtn = [[UIButton alloc] init];
    self.bgBtn = bgBtn;
    [bgBtn addTarget:self action:@selector(hiddenView) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bgBtn];
    
    
    UILabel * volLabel = [[UILabel alloc] init];
    self.volLabel = volLabel;
    volLabel.font = [UIFont systemFontOfSize:12];
    volLabel.textColor = [UIColor whiteColor];
    [self addSubview:volLabel];
    
    UIImageView * iconImageV = [[UIImageView alloc] init];
    self.iconImageV = iconImageV;
    [self addSubview:iconImageV];
    
    UILabel * authorLabel = [[UILabel alloc] init];
    self.authorLabel = authorLabel;
    authorLabel.font = [UIFont systemFontOfSize:12];
    authorLabel.textColor = [UIColor whiteColor];
    [self addSubview:authorLabel];
}

-(void)setContentData:(OneContentList *)contentData
{
    _contentData = contentData;
    
    self.bgBtn.frame = self.frame;
    self.volLabel.frame = CGRectMake(OneMergin, 5*OneMergin, MAINSCREEN_WIDTH-OneMergin, OneMergin);
    CGFloat imageX;
    CGFloat imageW;
    CGFloat imageH;
    if((contentData.img_Height > MAINSCREEN_WIDTH) ||(contentData.img_Height == MAINSCREEN_WIDTH))
    {
        imageX = 3*OneMergin;
    }
    else
    {
        imageX = OneMergin;
    }
    imageW = MAINSCREEN_WIDTH - 2*imageX;
    imageH = (contentData.img_Height * imageW)/MAINSCREEN_WIDTH;
    
    
    self.iconImageV.frame = CGRectMake(OneMergin, CGRectGetMaxY(self.volLabel.frame)+OneMergin, imageW, imageH);
    self.iconImageV.centerX = self.centerX;
    self.authorLabel.frame = CGRectMake(OneMergin, CGRectGetMaxY(self.iconImageV.frame)+OneMergin, MAINSCREEN_WIDTH-OneMergin, OneMergin);
    
    self.volLabel.text = contentData.volume;
    [self.iconImageV setImageWithURL:[NSURL URLWithString:contentData.img_url] placeholder:nil];
    self.authorLabel.text = [NSString stringWithFormat:@"%@|%@",contentData.title,contentData.pic_info];
}
-(void)hiddenView
{
    [self removeFromSuperview];
}

@end
