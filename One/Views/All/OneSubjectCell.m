//
//  OneSubjectCell.m
//  One
//
//  Created by hanyutong on 2017/8/15.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneSubjectCell.h"

@interface OneSubjectCell ()

@property (nonatomic, weak) UIImageView * iconImageV;
@property (nonatomic, weak) UILabel * contentL;

@property (nonatomic, weak) UIView * subView;
@property (nonatomic, weak) UILabel * subLabel;

@end

@implementation OneSubjectCell

+ (OneSubjectCell *)cellWithTableView:(UITableView *)tableView
{
   static NSString * cellID = @"OneSubjectCell";
    OneSubjectCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[OneSubjectCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
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
//    iconImageV.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:iconImageV];
    
    UILabel * contentL = [[UILabel alloc] init];
    self.contentL = contentL;
    contentL.backgroundColor =  [UIColor clearColor];
    contentL.textColor = [UIColor lightGrayColor];
    contentL.numberOfLines = 0;
    contentL.font = [UIFont systemFontOfSize:14];
//    contentL.text = @"哈哈哈及可是你看到女啊空间哦就哦就哦积极的咖啡啦科技发达了卡解放了空间啊舒服哈哈哈及可是你看到女啊空间哦就哦就哦积极的咖啡啦科技发达了卡解放了空间啊舒服哈哈哈及可是你看到女啊空间哦就哦就哦积极的咖啡啦科技发达了卡解放了空间啊舒服";
    [self.contentView addSubview:contentL];
    
    UIView * subView = [[UIView alloc] init];
    self.subView = subView;
    self.subView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];
    [self.iconImageV addSubview:subView];
    
    UILabel * subLabel = [[UILabel alloc] init];
    self.subLabel = subLabel;
    subLabel.text = @"专题";
    subLabel.textAlignment = NSTextAlignmentCenter;
    subLabel.font = [UIFont systemFontOfSize:14];
    subLabel.backgroundColor = [UIColor clearColor];
    subLabel.textColor = [UIColor whiteColor];
    [subView addSubview:subLabel];
    
    self.subView.frame = CGRectMake(-50, -50, 100, 100);
    self.subView.transform = CGAffineTransformMakeRotation(-M_PI/4);
    self.subLabel.frame = CGRectMake(0, 70, 100, 30);
   
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(OneMergin);
        make.right.equalTo(self.contentView).offset(-OneMergin);
        make.height.equalTo(@220);
    }];
    
    [self.contentL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.iconImageV);
        make.top.equalTo(self.iconImageV.mas_bottom).offset(OneMergin/2);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-OneMergin);
    }];
}

-(void)setBannerData:(OneBannerListData *)bannerData
{
    _bannerData = bannerData;
    [self.iconImageV setImageWithURL:[NSURL URLWithString:bannerData.cover] placeholder:[UIImage imageNamed:@"ReadingPlaceHolder1"]];
    self.contentL.text = bannerData.title;
    
}




@end
