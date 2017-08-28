//
//  OneHotAuthorCell.m
//  One
//
//  Created by hanyutong on 2017/8/15.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneHotAuthorCell.h"

@interface OneHotAuthorCell ()

@property (nonatomic, weak) UIImageView * iconImageV;
@property (nonatomic, weak) UILabel  * nameL;
@property (nonatomic, weak) UILabel  * descL;
@property (nonatomic, weak) UIButton * followBtn;

@end

@implementation OneHotAuthorCell


+(OneHotAuthorCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString * cellID = @"OneHotAuthorCell";
    OneHotAuthorCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        cell = [[OneHotAuthorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    UIImageView * iconImageV = [[UIImageView alloc] init];
    self.iconImageV = iconImageV;
    iconImageV.clipsToBounds = YES;
    iconImageV.layer.cornerRadius = OneMergin;
    iconImageV.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:iconImageV];
    
    UILabel * nameL = [[UILabel alloc] init];
    self.nameL = nameL;
    nameL.backgroundColor = [UIColor clearColor];
    nameL.text = @"张晓晗";
    nameL.textColor = [UIColor lightGrayColor];
    nameL.font = [UIFont systemFontOfSize:14];
    [nameL sizeToFit];
    [self.contentView addSubview:nameL];
    
    UILabel * descL = [[UILabel alloc] init];
    self.descL = descL;
    descL.font = [UIFont systemFontOfSize:14];
    descL.text = @"作家、编剧、银河少先队大队长。已出版哈哈哈哈哈";
    descL.textColor = [UIColor lightGrayColor];
    [descL sizeToFit];
    [self.contentView addSubview:descL];
    
    UIButton * followBtn = [[UIButton alloc] init];
    self.followBtn = followBtn;
    followBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [followBtn setTitle:@"关注" forState:UIControlStateNormal];
    [followBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    followBtn.layer.borderWidth = 0.5;
    followBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.contentView addSubview:followBtn];
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(OneMergin);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-OneMergin);
        make.width.height.equalTo(@40);
    }];
    
    [self.nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageV.mas_top);
        make.left.equalTo(self.iconImageV.mas_right).offset(OneMergin/2);
        make.height.equalTo(@20);
    }];
    
    [self.descL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameL.mas_bottom);
        make.left.equalTo(self.nameL.mas_left);
        make.height.equalTo(self.nameL.mas_height);
        make.right.equalTo(self.followBtn.mas_left).offset(-OneMergin/2);
    }];
    
    
    [self.followBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@50);
        make.right.equalTo(self.contentView.mas_right).offset(-OneMergin);
        make.height.equalTo(@30);
        make.centerY.equalTo(self.iconImageV.mas_centerY);
    }];
    
    
}

- (void)setAuthorHotData:(OneAuthorHotData *)authorHotData
{
    _authorHotData = authorHotData;
    
    [self.iconImageV setImageWithURL:[NSURL URLWithString:authorHotData.web_url] placeholder:[UIImage imageNamed:@"userDefault"]];
    self.nameL.text = authorHotData.wb_name;
    self.descL.text = authorHotData.desc;
    
    
}
 
@end
