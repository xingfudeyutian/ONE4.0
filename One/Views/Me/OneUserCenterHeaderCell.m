//
//  OneUserCenterHeaderCell.m
//  One
//
//  Created by hanyutong on 2017/8/16.
//  Copyright © 2017年 hanyutong. All rights reserved.
//



#import "OneUserCenterHeaderCell.h"
#import "OneDiaryModel.h"
#import "OneMoreView.h"


@interface OneUserCenterHeaderCell () <UIScrollViewDelegate>

@property (nonatomic, weak) UIImageView * personalBackgroundImageView;
@property (nonatomic, weak) UIScrollView * scrollView;
@property (nonatomic, weak) UIImageView * headerImageV;
@property (nonatomic, weak) UILabel * nickL;


@property (nonatomic, weak) OneMoreView * moreView;


@end


@implementation OneUserCenterHeaderCell

 + (OneUserCenterHeaderCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString * cellID = @"OneUserCenterHeaderCell";
    OneUserCenterHeaderCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[OneUserCenterHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    UIImageView * personalBackgroundImageView = [[UIImageView alloc] init];
    self.personalBackgroundImageView = personalBackgroundImageView;
    personalBackgroundImageView.image = [UIImage imageNamed:@"personalBackgroundImage"];
    [self.contentView addSubview:personalBackgroundImageView];
    
    UIImageView * headerImageV = [[UIImageView alloc] init];
    self.headerImageV = headerImageV;
    headerImageV.layer.cornerRadius = 30;
    headerImageV.clipsToBounds = YES;
    headerImageV.image = [UIImage imageNamed:@"userDefault"];
    [self.contentView addSubview:headerImageV];
    
    UILabel * nickL = [[UILabel alloc] init];
    self.nickL = nickL;
    nickL.text = @"韩江河";
    [nickL sizeToFit];
    nickL.textColor = [UIColor whiteColor];
    nickL.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:nickL];
    
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    scrollView.delegate = self;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:scrollView];
  
    
    
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.personalBackgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [self.headerImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@60);
        make.centerX.equalTo(self.contentView.mas_centerX);
        
    }];
    
    [self.nickL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerImageV.mas_centerX);
        make.bottom.equalTo(self.scrollView.mas_top).offset(-50);
        make.top.equalTo(self.headerImageV.mas_bottom).offset(OneMergin/2);
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-OneMergin);
        make.left.right.equalTo(self.contentView);
        make.height.equalTo(@150);
    }];

}


-(void)setCellDataArray:(NSArray *)cellDataArray
{
    _cellDataArray = cellDataArray;
    
    [self.scrollView removeAllSubviews];
    
    NSInteger count = cellDataArray.count > 6? 6: cellDataArray.count;
    CGFloat width = (OneMergin+150) * count + OneMergin >MAINSCREEN_WIDTH?(OneMergin+150) * count + OneMergin:MAINSCREEN_WIDTH;
    
    self.scrollView.bounces = width > MAINSCREEN_WIDTH ? YES : NO;
    
    self.scrollView.contentSize = CGSizeMake( width, 150);
    
    
        for (int i = 0; i< count; i++)
        {
            if (i == 6)  return;
            OneDiaryModel * diaryModel = cellDataArray[i];
            
            
            UIView * bgView = [[UIView alloc] init];
            bgView.backgroundColor = [UIColor whiteColor];
            bgView.layer.cornerRadius = 2;
            [self.scrollView addSubview:bgView];
            
            UIImageView * iconImageV = [[UIImageView alloc] init];
//            iconImageV.backgroundColor = [UIColor redColor];
            [iconImageV setImageWithURL:[NSURL URLWithString:diaryModel.cropped_picture] placeholder:nil];
            [bgView addSubview:iconImageV];
            
            UIImageView * addImageV = [[UIImageView alloc] init];
            addImageV.image = [UIImage imageNamed:@"diary_list_add"];
            [iconImageV addSubview:addImageV];
            
            UILabel * descL = [[UILabel alloc] init];
//            descL.text = @"我们生而破碎，用活着...";
            descL.text = diaryModel.content;
            descL.font = [UIFont systemFontOfSize:14];
            descL.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"diary_text_bg"]];
            [bgView addSubview:descL];
            
            
            bgView.frame = CGRectMake(i*150 + (i+1)*OneMergin, 0, 150, 150);
            if (count == 1)
            {
                bgView.centerX = MAINSCREEN_WIDTH/2;
                addImageV.hidden = NO;
            }
            else
            {
                addImageV.hidden = i == 0?NO:YES;
            }
            iconImageV.frame = CGRectMake(2, 2, bgView.width-4, 113);
            addImageV.frame = CGRectMake(0, 0, 113, 31);
            addImageV.center = iconImageV.center;
            descL.frame = CGRectMake(2, 117, iconImageV.width, bgView.height-6-iconImageV.height);

        }
  
 
}





@end
