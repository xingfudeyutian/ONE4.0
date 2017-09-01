//
//  OneFMCell.h
//  One
//
//  Created by hanyutong on 2017/8/31.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneFMCellHeight.h"

@interface OneFMCell : UITableViewCell

+(OneFMCell* )cellWithTableView:(UITableView*)tableView;

@property (nonatomic, strong) OneFMCellHeight * cellHeight;

@end
