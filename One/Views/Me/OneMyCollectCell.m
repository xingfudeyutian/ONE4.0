//
//  OneMyCollectCell.m
//  One
//
//  Created by hanyutong on 2017/8/16.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMyCollectCell.h"


@interface OneMyCollectCell ()

@property (nonatomic, weak) UILabel  * titleL;
@property (nonatomic, weak) UIButton * imageTextBtn;
@property (nonatomic, weak) UIButton * readBtn;
@property (nonatomic, weak) UIButton * musicBtn;
@property (nonatomic, weak) UIButton * filmBtn;
@property (nonatomic, weak) UIButton * FMBtn;

@end

@implementation OneMyCollectCell

+ (OneMyCollectCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString * cellID = @"OneMyCollectCell";
    OneMyCollectCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[OneMyCollectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    UILabel * titleL = [[UILabel alloc] init];
    self.titleL = titleL;
    titleL.text = @"我的收藏";
    titleL.font = [UIFont systemFontOfSize:14];
    titleL.textColor = [UIColor lightGrayColor];
    [titleL sizeToFit];
    [self.contentView addSubview:titleL];
    
    UIButton * imageTextBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    self.imageTextBtn = imageTextBtn;
    imageTextBtn.backgroundColor = [UIColor clearColor];
    imageTextBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [imageTextBtn setImage:[UIImage imageNamed:@"user_center_imagetext"] forState:UIControlStateNormal];
    [imageTextBtn setTitle:@"图文" forState:UIControlStateNormal];
    [imageTextBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    imageTextBtn.titleEdgeInsets = UIEdgeInsetsMake(imageTextBtn.imageView.frame.size.height, -imageTextBtn.imageView.frame.size.width, 0, 0);
    imageTextBtn.imageEdgeInsets = UIEdgeInsetsMake(-imageTextBtn.titleLabel.bounds.size.height-5, 0, 0, -imageTextBtn.titleLabel.bounds.size.width);
    
    [self.contentView addSubview:imageTextBtn];
   
    UIButton * readBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    self.readBtn = readBtn;
    readBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    readBtn.titleEdgeInsets = imageTextBtn.titleEdgeInsets;
    readBtn.imageEdgeInsets = imageTextBtn.imageEdgeInsets;
    [readBtn setImage:[UIImage imageNamed:@"user_center_read"] forState:UIControlStateNormal];
    [readBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [readBtn setTitle:@"文章" forState:UIControlStateNormal];
    [self.contentView addSubview:readBtn];

    UIButton * musicBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    self.musicBtn = musicBtn;
    musicBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    musicBtn.titleEdgeInsets = imageTextBtn.titleEdgeInsets;
    musicBtn.imageEdgeInsets = imageTextBtn.imageEdgeInsets;
    [musicBtn setImage:[UIImage imageNamed:@"user_center_music"] forState:UIControlStateNormal];
    [musicBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [musicBtn setTitle:@"音乐" forState:UIControlStateNormal];
    [self.contentView addSubview:musicBtn];

    UIButton * filmBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    self.filmBtn = filmBtn;
    filmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    filmBtn.titleEdgeInsets = imageTextBtn.titleEdgeInsets;
    filmBtn.imageEdgeInsets = imageTextBtn.imageEdgeInsets;
    [filmBtn setImage:[UIImage imageNamed:@"user_center_film"] forState:UIControlStateNormal];
    [filmBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [filmBtn setTitle:@"影视" forState:UIControlStateNormal];
    [self.contentView addSubview:filmBtn];

    UIButton * FMBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 50)];
    self.FMBtn = FMBtn;
    FMBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    FMBtn.titleEdgeInsets = imageTextBtn.titleEdgeInsets;
    FMBtn.imageEdgeInsets = imageTextBtn.imageEdgeInsets;
    [FMBtn setImage:[UIImage imageNamed:@"user_center_FM"] forState:UIControlStateNormal];
    [FMBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [FMBtn setTitle:@"电台" forState:UIControlStateNormal];
    [self.contentView addSubview:FMBtn];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(OneMergin/2);
        make.left.equalTo(self.contentView.mas_left).offset(OneMergin);
    }];
    
    int mergin = (MAINSCREEN_WIDTH - 5*30)/6;
    
    [self.imageTextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(mergin);
        make.top.equalTo(self.titleL.mas_bottom).offset(mergin);
        make.width.equalTo(@30);
        make.height.equalTo(@50);
    }];
    
    [self.readBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageTextBtn.mas_top);
        make.left.equalTo(self.imageTextBtn.mas_right).offset(mergin);
        make.width.equalTo(self.imageTextBtn);
        make.height.equalTo(self.imageTextBtn);
    }];
    
    [self.musicBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.readBtn.mas_top);
        make.left.equalTo(self.readBtn.mas_right).offset(mergin);
        make.width.equalTo(self.imageTextBtn);
        make.height.equalTo(self.imageTextBtn);
    }];
    
    [self.filmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.musicBtn.mas_top);
        make.left.equalTo(self.musicBtn.mas_right).offset(mergin);
        make.width.equalTo(self.imageTextBtn);
        make.height.equalTo(self.imageTextBtn);
    }];
    
    [self.FMBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.filmBtn.mas_top);
        make.left.equalTo(self.filmBtn.mas_right).offset(mergin);
        make.width.equalTo(self.imageTextBtn);
        make.height.equalTo(self.imageTextBtn);
    }];
}

@end
