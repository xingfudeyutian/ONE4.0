//
//  OneContentCell.h
//  One
//
//  Created by hanyutong on 2017/7/4.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneContentCellHeight.h"

@interface OneContentCell : UITableViewCell

+ (OneContentCell *)cellWithTableView: (UITableView *)tableView;

@property (nonatomic, strong) OneContentCellHeight * cellHeight;

@end
