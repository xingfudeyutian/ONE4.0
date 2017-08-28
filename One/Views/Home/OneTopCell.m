//
//  OneTopCell.m
//  One
//
//  Created by hanyutong on 2017/8/23.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneTopCell.h"
#import "OneMenuView.h"

@interface OneTopCell ()

@property (nonatomic, strong) UIImageView * imageV;
@property (nonatomic, strong) UILabel * authorL;
@property (nonatomic, strong) UILabel * contentL;
@property (nonatomic, strong) UILabel * titleL;
@property (nonatomic, strong) OneMenuView * menuV;
@property (nonatomic, strong) UIView * seperateV;


@end


@implementation OneTopCell

+(OneTopCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString * cellID = @"OneTopCell";
    OneTopCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[OneTopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    self.imageV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageV];
    
    self.authorL = [[UILabel alloc] init];
    self.authorL.numberOfLines = 0;
    self.authorL.textAlignment = NSTextAlignmentCenter;
    self.authorL.font = [UIFont systemFontOfSize:14];
    self.authorL.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.authorL];
    
    self.contentL = [[UILabel alloc] init];
    self.contentL.numberOfLines = 0;
    self.contentL.font = [UIFont systemFontOfSize:14];
    self.contentL.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.contentL];
    
    self.titleL = [[UILabel alloc] init];
    self.titleL.numberOfLines = 0;
    self.titleL.textAlignment = NSTextAlignmentCenter;
    self.titleL.font = [UIFont systemFontOfSize:14];
    self.titleL.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.titleL];
    
    self.menuV = [[OneMenuView alloc] init];
    [self.contentView addSubview:self.menuV];
    
    self.seperateV = [[UIView alloc] init];
    self.seperateV.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    [self.contentView addSubview:self.seperateV];
}

-(void)setCellHeight:(OneListCellHeight *)cellHeight
{
    _cellHeight = cellHeight;
    self.imageV.frame = cellHeight.imageFrame;
    self.authorL.frame = cellHeight.authorFrame;
    self.contentL.frame = cellHeight.contentFrame;
    self.titleL.frame = cellHeight.titleFrame;
    self.menuV.frame = cellHeight.menuFrame;
    self.seperateV.frame = cellHeight.seperateFrame;
    
    
    [self.imageV setImageWithURL:[NSURL URLWithString:cellHeight.contentModel.img_url] placeholder:nil];
    self.authorL.text = [NSString stringWithFormat:@"%@|%@",cellHeight.contentModel.title,cellHeight.contentModel.pic_info];
    self.contentL.text = cellHeight.contentModel.forward;
    self.titleL.text = cellHeight.contentModel.words_info;
}



@end
