//
//  OneMusicContentCell.h
//  One
//
//  Created by hanyutong on 2017/8/25.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneContentCell.h"
#import "OneMusicContentCellHeight.h"

@interface OneMusicContentCell : UITableViewCell

+ (OneMusicContentCell *)cellWithTableView: (UITableView *)tableView;

@property (nonatomic, strong) OneMusicContentCellHeight * musicCellHeight;

@end
