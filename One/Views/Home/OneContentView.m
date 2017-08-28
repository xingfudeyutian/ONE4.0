//
//  OneContentView.m
//  One
//
//  Created by hanyutong on 2017/7/4.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneContentView.h"

@interface OneContentView ()

@property (nonatomic, weak) UILabel * titleL;
@property (nonatomic, weak) UILabel * authorL;
@property (nonatomic, weak) UIImageView * pictureImageV;
@property (nonatomic, weak) UILabel * contentL;

@end

@implementation OneContentView

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
    UILabel * titleL = [[UILabel alloc] init];
    self.titleL = titleL;
    titleL.numberOfLines = 0;
    titleL.text = @"null";
    titleL.font = [UIFont systemFontOfSize:16];
    [self addSubview:titleL];
    
    UILabel * authorL = [[UILabel alloc] init];
    self.authorL = authorL;
    authorL.text = @"文／";
    authorL.textColor = [UIColor lightGrayColor];
    authorL.font = [UIFont systemFontOfSize:11];
    [self addSubview:authorL];
    
    UIImageView * pictureImageV = [[UIImageView alloc] init];
    self.pictureImageV = pictureImageV;
    pictureImageV.clipsToBounds = YES;
    pictureImageV.contentMode = UIViewContentModeScaleAspectFill;
    pictureImageV.backgroundColor = [UIColor purpleColor];
    [self addSubview:pictureImageV];
    
    UILabel * contentL = [[UILabel alloc] init];
    self.contentL = contentL;
    contentL.text = @"null";
    contentL.numberOfLines = 0;
    contentL.font = [UIFont systemFontOfSize:12];
    contentL.textColor = [UIColor lightGrayColor];
    
    [contentL sizeToFit];
    [self addSubview:contentL];
}


-(void)setCellHeight:(OneContentCellHeight *)cellHeight
{
    _cellHeight = cellHeight;
    
    self.titleL.frame = cellHeight.titleLFrame;
    self.authorL.frame = cellHeight.authorLFrame;
    self.pictureImageV.frame = cellHeight.pictureImageVFrame;
    self.contentL.frame = cellHeight.contentLFrame;
    
    self.titleL.text = cellHeight.contentModel.title;
    self.authorL.text = [NSString stringWithFormat:@"文／%@",cellHeight.contentModel.author.user_name];
    [self.pictureImageV setImageWithURL:[NSURL URLWithString:cellHeight.contentModel.img_url] placeholder:nil];
    self.contentL.text = cellHeight.contentModel.forward;
    
}


@end
