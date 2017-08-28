//
//  OneMusicContentCell.m
//  One
//
//  Created by hanyutong on 2017/8/25.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMusicContentCell.h"
#import "OneMusicContentView.h"
#import "OneMenuView.h"

@interface OneMusicContentCell ()

@property (nonatomic, weak) UILabel * sourceTypeL;
@property (nonatomic, weak) OneMusicContentView * contentV;
@property (nonatomic, weak) OneMenuView * menuV;
@property (nonatomic, weak) UIView * seperateV;


@end


@implementation OneMusicContentCell

+(OneMusicContentCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"OneMusicContentCell";
    OneMusicContentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[OneMusicContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    UILabel * sourceTypeL = [[UILabel alloc] init];
    self.sourceTypeL = sourceTypeL;
    sourceTypeL.text = @"- null -";
    sourceTypeL.font = [UIFont systemFontOfSize:10];
    sourceTypeL.textColor = [UIColor lightGrayColor];
    sourceTypeL.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:sourceTypeL];
    
    OneMusicContentView * contentV = [[OneMusicContentView alloc] init];
    self.contentV = contentV;
    contentV.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:contentV];
    
    OneMenuView * menuV = [[OneMenuView alloc] init];
    self.menuV = menuV;
    menuV.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:menuV];
    
    
    UIView * seperateV = [[UIView alloc] init];
    self.seperateV = seperateV;
    seperateV.backgroundColor = [UIColor colorWithHexString:@"#ededed"];
    [self.contentView addSubview:seperateV];
    
    
}

-(void)setMusicCellHeight:(OneMusicContentCellHeight *)musicCellHeight
{
    _musicCellHeight = musicCellHeight;
    self.sourceTypeL.frame = musicCellHeight.sourceTypeLFrame;
    self.contentV.frame = musicCellHeight.contentVFrame;
    self.menuV.frame = musicCellHeight.menuVFrame;
    self.seperateV.frame = musicCellHeight.seperateVFrame;
    self.sourceTypeL.text = [NSString stringWithFormat:@"- 音乐 -"];
    self.contentV.cellHeight = musicCellHeight;
    self.seperateV.frame = musicCellHeight.seperateVFrame;
}

@end
