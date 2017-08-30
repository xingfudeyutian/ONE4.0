//
//  OneMovieCell.m
//  One
//
//  Created by hanyutong on 2017/8/29.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMovieCell.h"
#import "OneMovieContentView.h"
#import "OneMenuView.h"

@interface OneMovieCell ()


@property (nonatomic, weak) UILabel * sourceTypeL;
@property (nonatomic, weak) OneMovieContentView * contentV;
@property (nonatomic, weak) OneMenuView * menuV;
@property (nonatomic, weak) UIView * seperateV;


@end


@implementation OneMovieCell

+(OneMovieCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"OneMovieCell";
    OneMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[OneMovieCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    
    OneMovieContentView * contentV = [[OneMovieContentView alloc] init];
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


-(void)setMovieCellHeight:(OneMovieContentCellHeight *)movieCellHeight
{
    _movieCellHeight = movieCellHeight;
    
    self.sourceTypeL.frame = movieCellHeight.sourceTypeLFrame;
    self.contentV.frame = movieCellHeight.contentVFrame;
    self.menuV.frame = movieCellHeight.menuVFrame;
    self.menuV.contentModel = movieCellHeight.contentModel;
    self.seperateV.frame = movieCellHeight.seperateVFrame;
    self.sourceTypeL.text = [NSString stringWithFormat:@"- 影视 -"];
    self.contentV.cellHeight = movieCellHeight;
    self.seperateV.frame = movieCellHeight.seperateVFrame;


}

@end
