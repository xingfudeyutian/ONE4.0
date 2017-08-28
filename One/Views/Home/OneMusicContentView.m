//
//  OneMusicContentView.m
//  One
//
//  Created by hanyutong on 2017/8/24.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMusicContentView.h"

@interface OneMusicContentView ()

@property (nonatomic, weak) UILabel * titleL;
@property (nonatomic, weak) UILabel * authorL;
@property (nonatomic, weak) UIImageView * bgImageV;
@property (nonatomic, weak) UIImageView * LogoImageV;
@property (nonatomic, weak) UIButton * menuBtn;
@property (nonatomic, weak) UIImageView * pictureImageV;
@property (nonatomic, weak) UILabel * descL;
@property (nonatomic, weak) UILabel * musicL;
@property (nonatomic, weak) UILabel * contentL;

@end


@implementation OneMusicContentView

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
    bgImageV.image = [UIImage imageNamed:@"musicAlbumBackgroundImage"];
    [self addSubview:bgImageV];
    
    UIImageView * LogoImageV = [[UIImageView alloc] init];
    self.LogoImageV = LogoImageV;
    LogoImageV.image = [UIImage imageNamed:@"ONEXiamiMusicCopyright"];
    [self addSubview:LogoImageV];
    
    
    
    UILabel * musicL = [[UILabel alloc] init];
    self.musicL = musicL;
    musicL.textColor = [UIColor colorWithHexString:@"c8d3e7"];
    musicL.font = [UIFont systemFontOfSize:20];
    musicL.textAlignment = NSTextAlignmentCenter;
    musicL.transform = CGAffineTransformMakeRotation(M_PI/2);
    musicL.text = @"STORIES OF MUSIC";
    
    
    
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"STORIES OF MUSIC"];
    
    [str addAttribute:NSForegroundColorAttributeName
                value:[UIColor colorWithHexString:@"c8d3e7"]
                range:NSMakeRange(0,str.length)];
    [str addAttribute:NSFontAttributeName
                value:[UIFont fontWithName:@"TimesNewRomanPSMT" size:24.0]
                range:NSMakeRange(0, str.length)];
    
 
    musicL.attributedText = str;
    musicL.numberOfLines = 0;
    [self addSubview:musicL];
    
    UILabel * descL = [[UILabel alloc] init];
    self.descL = descL;
    descL.text = @"STORIES OF MUSIC";
    [self addSubview:descL];
    
    
    UIImageView * pictureImageV = [[UIImageView alloc] init];
    self.pictureImageV = pictureImageV;
    pictureImageV.clipsToBounds = YES;
    
    pictureImageV.contentMode = UIViewContentModeScaleAspectFill;
    pictureImageV.backgroundColor = [UIColor purpleColor];
    [self addSubview:pictureImageV];
    
    UIButton * menuBtn = [[UIButton alloc] init];
    self.menuBtn = menuBtn;
//    menuBtn.imageView.contentMode = UIViewContentModeCenter;
    [menuBtn setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.5]];
    [menuBtn setImage:[UIImage imageNamed:@"audioPlayIcon"] forState:UIControlStateNormal];
    [self addSubview:menuBtn];
    
    UILabel * contentL = [[UILabel alloc] init];
    self.contentL = contentL;
    contentL.text = @"null";
    contentL.numberOfLines = 0;
    contentL.font = [UIFont systemFontOfSize:12];
    contentL.textColor = [UIColor lightGrayColor];
    
    [contentL sizeToFit];
    [self addSubview:contentL];
}


-(void)setCellHeight:(OneMusicContentCellHeight *)cellHeight
{
    _cellHeight = cellHeight;
    
    self.titleL.frame = cellHeight.titleLFrame;
    self.authorL.frame = cellHeight.authorLFrame;
    self.bgImageV.frame = cellHeight.bgImageVFrame;
    self.LogoImageV.frame = cellHeight.LogoImageVFrame;
    self.pictureImageV.frame = cellHeight.pictureImageVFrame;
    self.menuBtn.frame = cellHeight.menuBtnFrame;
    self.menuBtn.center = self.pictureImageV.center;
    self.menuBtn.layer.cornerRadius = cellHeight.menuBtnFrame.size.width/2;
    self.musicL.frame = cellHeight.musicLFrame;
    self.descL.frame = cellHeight.descLFrame;
    self.contentL.frame = cellHeight.contentLFrame;
    self.pictureImageV.layer.cornerRadius = self.pictureImageV.frame.size.width/2;
    self.titleL.text = cellHeight.contentModel.title;
    self.authorL.text = [NSString stringWithFormat:@"文／%@",cellHeight.contentModel.author.user_name];
    [self.pictureImageV setImageWithURL:[NSURL URLWithString:cellHeight.contentModel.img_url] placeholder:nil];
    self.pictureImageV.centerX = self.centerX;
    
    self.descL.text = [NSString stringWithFormat:@"%@ ･ %@|%@",cellHeight.contentModel.music_name,cellHeight.contentModel.audio_author,cellHeight.contentModel.audio_album];
    self.contentL.text = cellHeight.contentModel.forward;
  
    
}

@end
