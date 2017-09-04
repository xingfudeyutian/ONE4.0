//
//  OneAskCell.m
//  One
//
//  Created by hanyutong on 2017/8/18.
//  Copyright © 2017年 hanyutong. All rights reserved.
//


#import "OneAskCell.h"

@interface OneAskCell ()

@property (nonatomic, weak) UILabel * titleL;
@property (nonatomic, weak) UIScrollView * scrollView;



@end

@implementation OneAskCell

+(OneAskCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString * cellID = @"OneAskCell";
    OneAskCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil)
    {
        cell = [[OneAskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    UILabel * titleL  = [[UILabel alloc] init];
    self.titleL  = titleL;
    titleL.text = @"所有人问所有人";
    titleL.textColor = [UIColor lightGrayColor];
    titleL.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:titleL];
    
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    [scrollView setBounces:NO];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.scrollView];
    
}
-(void)layoutSubviews
{
    self.titleL.frame = CGRectMake(OneMergin, OneMergin/2, MAINSCREEN_WIDTH - OneMergin, OneMergin);
    self.scrollView.frame = CGRectMake(0, 30, MAINSCREEN_WIDTH, self.height-30);
    
}

- (void)setCellDataArray:(NSMutableArray *)cellDataArray
{
    _cellDataArray = cellDataArray;
    
    self.scrollView.contentSize = CGSizeMake((200 * cellDataArray.count) + OneMergin *(cellDataArray.count+1), self.contentView.height);
    
    for (int i = 0; i< cellDataArray.count; i++)
    {
            OneBannerListData * bannerData = cellDataArray[i];
            UIImageView * iconImageV = [[UIImageView alloc] initWithFrame:CGRectMake((i+1) * OneMergin + i * 200, OneMergin, 200, 130)];
            iconImageV.clipsToBounds = YES;
            iconImageV.layer.cornerRadius = 2.0;
            [iconImageV setImageWithURL:[NSURL URLWithString:bannerData.cover] placeholder:[UIImage imageNamed:@"ReadingPlaceHolder1"]];
            iconImageV.backgroundColor = [UIColor orangeColor];
            [self.scrollView addSubview:iconImageV];
        
            UILabel * contentL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, iconImageV.width, iconImageV.height)];
            contentL.textAlignment = NSTextAlignmentCenter;
            contentL.backgroundColor =  [UIColor clearColor];
            contentL.textColor = [UIColor whiteColor];
//            contentL.numberOfLines = 0;
            contentL.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
            contentL.font = [UIFont systemFontOfSize:16];
            contentL.text =bannerData.title;
            [iconImageV addSubview:contentL];
        
            UIView * subView = [[UIView alloc] init];
            subView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.1];
            [iconImageV addSubview:subView];
        
            UILabel * subLabel = [[UILabel alloc] init];
            subLabel.text = @"专题";
            subLabel.textAlignment = NSTextAlignmentCenter;
            subLabel.font = [UIFont systemFontOfSize:14];
            subLabel.backgroundColor = [UIColor clearColor];
            subLabel.textColor = [UIColor whiteColor];
            [subView addSubview:subLabel];
        
            subView.frame = CGRectMake(-50, -50, 100, 100);
            subView.transform = CGAffineTransformMakeRotation(-M_PI/4);
            subLabel.frame = CGRectMake(0, 70, 100, 30);
    }
    
    
}















@end
