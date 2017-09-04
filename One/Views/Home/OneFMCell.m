//
//  OneFMCell.m
//  One
//
//  Created by hanyutong on 2017/8/31.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneFMCell.h"

@interface OneFMCell ()

@property (nonatomic, weak) UIImageView * bgImageView;
@property (nonatomic, weak) UIView * toolView;
@property (nonatomic, weak) UIImageView * iconImageView;
@property (nonatomic, weak) UIView *  titleView;

@property (nonatomic, weak) UIButton * beginBtn;
@property (nonatomic, weak) UILabel  * descL;
@property (nonatomic, weak) UILabel  * titleL;


@property (nonatomic, weak) UILabel * timeL;

@property (nonatomic, weak) UIView * lineV;

@property (nonatomic, weak) UIButton * onBtn;

@property (nonatomic, weak) UIButton * likeBtn;
@property (nonatomic, weak) UIButton * shareBtn;

@end

@implementation OneFMCell

+(OneFMCell* )cellWithTableView:(UITableView*)tableView
{
    static NSString * cellID = @"OneFMCell";
    OneFMCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[OneFMCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupSubViews];
    }
    return self;
}

-(void)setupSubViews
{
    UIImageView * bgImageView = [[UIImageView alloc] init];
    self.bgImageView = bgImageView;
    [self.contentView addSubview:bgImageView];
    
    UIView * toolView = [[UIView alloc] init];
    self.toolView = toolView;
    toolView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    [self.contentView addSubview:toolView];
    
    UIImageView * iconImageView = [[UIImageView alloc] init];
    self.iconImageView = iconImageView;
    iconImageView.image = [UIImage imageNamed:@"logo_FM_white"];
    [self.toolView addSubview:iconImageView];
    
    UIView * titleView = [[UIView alloc] init];
    self.titleView = titleView;
//    titleView.backgroundColor = [UIColor blackColor];
    [self.toolView addSubview:titleView];
    
    
    UILabel * timeL = [[UILabel alloc] init];
    self.timeL = timeL;
    timeL.font = [UIFont systemFontOfSize:12];
    timeL.textColor = [UIColor whiteColor];
    self.timeL.textAlignment = NSTextAlignmentCenter;
    [self.toolView addSubview:timeL];
    
    
    UIButton * beginBtn = [[UIButton alloc] init];
    self.beginBtn = beginBtn;
    [beginBtn setImage:[UIImage imageNamed:@"music_list_play"] forState:UIControlStateNormal];
    [self.titleView addSubview:beginBtn];
    
    UILabel * descL = [[UILabel alloc] init];
    self.descL = descL;
    descL.textColor = [UIColor whiteColor];
    descL.font = [UIFont systemFontOfSize:12];
    [self.titleView addSubview:descL];
    
    UILabel * titleL = [[UILabel alloc] init];
    self.titleL = titleL;
    titleL.textColor = [UIColor whiteColor];
    titleL.font = [UIFont systemFontOfSize:20];
    [self.titleView addSubview:titleL];
    
    UIView * lineV = [[UIView alloc] init];
    self.lineV = lineV;
    lineV.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineV];
    
    UIButton * onBtn = [[UIButton alloc] init];
    self.onBtn = onBtn;
    onBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:onBtn];
    
    UIButton * likeBtn = [[UIButton alloc] init];
    self.likeBtn = likeBtn;
    [likeBtn setImage:[UIImage imageNamed:@"like_gray"] forState:UIControlStateNormal];
    [likeBtn setImage:[UIImage imageNamed:@"like_selected"] forState:UIControlStateSelected];
    [self.contentView addSubview:likeBtn];
    
    
    UIButton * shareBtn = [[UIButton alloc] init];
    self.shareBtn = shareBtn;
    [shareBtn setImage:[UIImage imageNamed:@"share_gray"] forState:UIControlStateNormal];
    [self.contentView addSubview:shareBtn];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bgImageView.frame = self.contentView.frame;
    
    [self.toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(self.contentView);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(OneMergin);
        make.width.height.mas_equalTo(2*OneMergin);
    }];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.toolView);
        make.bottom.equalTo(self.lineV.mas_top).offset(-OneMergin/2);
        make.height.mas_equalTo(2*OneMergin);
    }];
    
    
    [self.beginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleView.mas_left).offset(OneMergin);
        make.centerY.equalTo(self.titleView.mas_centerY);
        make.width.height.mas_equalTo(self.titleView.mas_height);
    }];
    
    [self.descL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.beginBtn.mas_right).offset(OneMergin/2);
        make.top.equalTo(self.titleView.mas_top);
        make.right.equalTo(self.titleView.mas_right).offset(-OneMergin);
        make.height.mas_equalTo(OneMergin);
    }];
    
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.beginBtn.mas_right).offset(OneMergin/2);
        make.right.equalTo(self.titleView.mas_right).offset(-OneMergin);
        make.bottom.equalTo(self.titleView.mas_bottom);
        make.height.mas_equalTo(OneMergin);
    }];
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(OneMergin);
        make.bottom.equalTo(self.lineV.mas_top).offset(-OneMergin/2);
    }];
    
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.onBtn.mas_top).offset(-OneMergin/2);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.onBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImageView.mas_left).offset(OneMergin);
        make.width.mas_equalTo(4*OneMergin);
        make.bottom.equalTo(self.contentView).offset(-OneMergin/2);
    }];
    
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.shareBtn.mas_left).offset(-OneMergin);
        make.top.bottom.equalTo(self.onBtn);
        make.width.mas_equalTo(2*OneMergin);
    }];
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-OneMergin);
        make.top.bottom.width.height.equalTo(self.onBtn);
    }];
    
}


-(void)setCellHeight:(OneFMCellHeight *)cellHeight
{
    _cellHeight = cellHeight;
    
    
    NSDate * date = [NSDate dateWithString:cellHeight.contentModel.post_date format:@"yyyy-MM-dd HH:mm:ss"];
    
    if (date.isToday&&date.hour<10.5)
    {
        //当天10：30以前
        self.titleView.hidden = YES;
        self.timeL.hidden = NO;
        self.iconImageView.hidden = YES;
        [self.onBtn setImage:[UIImage imageNamed:@"voice_gray"] forState:UIControlStateNormal];

    }
    else
    {
        self.iconImageView.hidden = NO;
        self.titleView.hidden = NO;
        self.timeL.hidden = YES;
        [self.onBtn setTitle:cellHeight.contentModel.author.user_name forState:UIControlStateNormal];
    }
    
    
    self.timeL.text = cellHeight.contentModel.title;
    [self.bgImageView setImageWithURL:[NSURL URLWithString:cellHeight.contentModel.img_url] placeholder:nil];
    [self.onBtn.imageView setImageWithURL:[NSURL URLWithString:cellHeight.contentModel.author.web_url] placeholder:[UIImage imageNamed:@"authorDefault"]];
    
    
    
    
    self.descL.text = cellHeight.contentModel.volume;
    self.titleL.text = cellHeight.contentModel.title;
    
}

@end
