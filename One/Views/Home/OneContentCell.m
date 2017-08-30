//
//  OneContentCell.m
//  One
//
//  Created by hanyutong on 2017/7/4.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneContentCell.h"
#import "OneContentView.h"
#import "OneMenuView.h"

@interface OneContentCell ()

@property (nonatomic, weak) UILabel * sourceTypeL;
@property (nonatomic, weak) OneContentView * contentV;
@property (nonatomic, weak) OneMenuView * menuV;
@property (nonatomic, weak) UIView * seperateV;

@end

@implementation OneContentCell

+(OneContentCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"oneContentCell";
    OneContentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[OneContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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
    
    OneContentView * contentV = [[OneContentView alloc] init];
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

-(void)setCellHeight:(OneContentCellHeight *)cellHeight
{
    _cellHeight = cellHeight;
    
    self.sourceTypeL.frame = cellHeight.sourceTypeLFrame;
    self.contentV.frame = cellHeight.contentVFrame;
    self.menuV.frame = cellHeight.menuVFrame;
    self.menuV.contentModel = cellHeight.contentModel;
    self.seperateV.frame = cellHeight.seperateVFrame;
    NSString * sourceType = nil;
    switch (cellHeight.contentModel.category.integerValue)
    {
        case 1:
            sourceType = cellHeight.contentModel.tag_list.count>0?[cellHeight.contentModel.tag_list[0] title] : @"阅读";
            break;
        case 2:
            sourceType = @"连载";
            break;
        case 3:
            sourceType = @"问答";
            break;
        case 4:
            sourceType = @"音乐";
            break;
        case 5:
            sourceType = @"影视";
            break;
        case 8:
            sourceType = @"电台";
            break;
        default:
            break;
    }
    
    self.sourceTypeL.text = [NSString stringWithFormat:@"- %@ -",sourceType];
    self.contentV.cellHeight = cellHeight;
    
}



@end
