//
//  OneClassifyCell.m
//  One
//
//  Created by hanyutong on 2017/8/15.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneClassifyCell.h"

@interface OneClassifyCell ()

@property (nonatomic, weak) UILabel * titleL;
@property (nonatomic, weak) UIView * menuView;

@end

@implementation OneClassifyCell

+(OneClassifyCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString * cellID = @"OneClassifyCell";
    OneClassifyCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[OneClassifyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    titleL.text = @"分类导航";
    [self.contentView addSubview:titleL];
    
    UIView * menuView  = [[UIView alloc] init];
    self.menuView = menuView;
    menuView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:menuView];
    
    int tag = 0;
    int mergin = 5;
    int width = (MAINSCREEN_WIDTH-40-15)/4;
    
    for (int row = 0; row < 2; row++)
    {
        for (int col = 0; col < 4; col++)
        {
            if ((row == 0 )&&(col == 3))
            {
                continue;
            }
            
            UIButton * menuBtn = [[UIButton alloc] init];
            menuBtn.tag = tag;
//            menuBtn.backgroundColor = [UIColor redColor];
            menuBtn.frame = CGRectMake(col * (width + mergin), row * (width+mergin), width, width);
            [menuBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"menu_%d",tag]] forState:UIControlStateNormal];
            if ((row == 0 )&&(col == 2))
            {
                menuBtn.width = 2*width+mergin;
            }
            [self.menuView addSubview:menuBtn];
            tag ++ ;
        }
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(OneMergin);
        make.right.equalTo(self.contentView.mas_right).offset(-OneMergin);
        make.height.equalTo(@25);
        make.bottom.equalTo(self.menuView.mas_top).offset(-OneMergin/2);
    }];
    
    [self.menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleL.mas_left);
        make.right.equalTo(self.titleL.mas_right);
        make.height.equalTo(@(5+((MAINSCREEN_WIDTH-2*OneMergin-15)/4)*2));
        
    }];
}












@end
