//
//  OneTopCell.h
//  One
//
//  Created by hanyutong on 2017/8/23.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneListCellHeight.h"

@interface OneTopCell : UITableViewCell

+ (OneTopCell *)cellWithTableView:(UITableView*)tableView;

@property (nonatomic, strong) OneListCellHeight * cellHeight;


@end
