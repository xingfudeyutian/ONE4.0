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
    toolView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:toolView];
    
    
    UIView * titleView = [[UIView alloc] init];
    self.titleView = titleView;
    [self.toolView addSubview:titleView];
    
    
    UILabel * timeL = [[UILabel alloc] init];
    self.timeL = timeL;
    timeL.font = [UIFont systemFontOfSize:12];
    timeL.textColor = [UIColor whiteColor];
    self.timeL.textAlignment = NSTextAlignmentCenter;
    [self.toolView addSubview:timeL];
    
    
    
    UIView * lineV = [[UIView alloc] init];
    self.lineV = lineV;
    lineV.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineV];
    
    UIButton * onBtn = [[UIButton alloc] init];
    self.onBtn = onBtn;
    [onBtn setImage:[UIImage imageNamed:@"voice_gray"] forState:UIControlStateNormal];
    [self.contentView addSubview:onBtn];
    
    UIButton * likeBtn = [[UIButton alloc] init];
    self.likeBtn = likeBtn;
    [self.contentView addSubview:likeBtn];
    
    
    UIButton * shareBtn = [[UIButton alloc] init];
    self.shareBtn = shareBtn;
    [self.contentView addSubview:shareBtn];
    
    
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bgImageView.frame = self.contentView.frame;
    
    [self.toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(self.bgImageView.height/2);
    }];
    
    [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(OneMergin);
        make.bottom.equalTo(self.lineV.mas_top).offset(-OneMergin);
    }];
    
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.onBtn.mas_top);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.onBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImageView.mas_left).offset(OneMergin);
        make.height.width.mas_equalTo(2*OneMergin);
        make.bottom.equalTo(self.contentView);
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
    
    self.timeL.text = cellHeight.contentModel.title;
    [self.bgImageView setImageWithURL:[NSURL URLWithString:cellHeight.contentModel.img_url] placeholder:nil];
    
    
}

@end
