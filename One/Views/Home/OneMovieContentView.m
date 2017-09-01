//
//  OneMovieContentView.m
//  One
//
//  Created by hanyutong on 2017/8/29.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMovieContentView.h"

@interface OneMovieContentView ()

@property (nonatomic, weak) UILabel * titleL;
@property (nonatomic, weak) UILabel * authorL;
@property (nonatomic, weak) UIImageView * bgImageV;
@property (nonatomic, weak) UIImageView * pictureImageV;
@property (nonatomic, weak) UILabel * nameL;
@property (nonatomic, weak) UILabel * contentL;


@end

@implementation OneMovieContentView

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
    
    UIImageView * bgImageV = [[UIImageView alloc] init];
    self.bgImageV = bgImageV;
    bgImageV.image = [UIImage imageNamed:@"filmBackgroundIcon"];
    [self addSubview:bgImageV];
    
 
    
    UIImageView * pictureImageV = [[UIImageView alloc] init];
    self.pictureImageV = pictureImageV;
    pictureImageV.clipsToBounds = YES;
    
    pictureImageV.contentMode = UIViewContentModeScaleAspectFill;
//    pictureImageV.backgroundColor = [UIColor purpleColor];
    [self addSubview:pictureImageV];
    
   
    UILabel * contentL = [[UILabel alloc] init];
    self.contentL = contentL;
    contentL.text = @"null";
    contentL.numberOfLines = 0;
    contentL.font = [UIFont systemFontOfSize:12];
    contentL.textColor = [UIColor lightGrayColor];
    
    [contentL sizeToFit];
    [self addSubview:contentL];
    
    
    UILabel * nameL = [[UILabel alloc] init];
    self.nameL = nameL;
    nameL.text = @"--《vvv》";
    nameL.font = [UIFont systemFontOfSize:12];
    nameL.textColor = [UIColor lightGrayColor];
    nameL.textAlignment = NSTextAlignmentRight;
    [self addSubview:nameL];
    
}


-(void)setCellHeight:(OneMovieContentCellHeight *)cellHeight
{
    _cellHeight = cellHeight;
    
    self.titleL.frame = cellHeight.titleLFrame;
    self.authorL.frame = cellHeight.authorLFrame;
    self.bgImageV.frame = cellHeight.bgImageVFrame;
    self.pictureImageV.frame = cellHeight.pictureImageVFrame;
   
    self.nameL.frame = cellHeight.nameLFrame;
    self.contentL.frame = cellHeight.contentLFrame;
    self.titleL.text = cellHeight.contentModel.title;
    self.authorL.text = [NSString stringWithFormat:@"文／%@",cellHeight.contentModel.author.user_name];
    [self.pictureImageV setImageWithURL:[NSURL URLWithString:cellHeight.contentModel.img_url] placeholder:nil];
    
    self.nameL.text = [NSString stringWithFormat:@"——《%@》",cellHeight.contentModel.subtitle];
    self.contentL.text = cellHeight.contentModel.forward;
    
    
}
@end
