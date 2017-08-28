//
//  OneMyFollowCell.m
//  One
//
//  Created by hanyutong on 2017/8/16.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMyFollowCell.h"


@interface OneMyFollowCell ()


@end

@implementation OneMyFollowCell

+ (OneMyFollowCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString * cellID = @"OneMyFollowCell";
    OneMyFollowCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[OneMyFollowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
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
    
}
@end
