//
//  OneUserCenterHeaderCell.h
//  One
//
//  Created by hanyutong on 2017/8/16.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneUserCenterHeaderCell : UITableViewCell

@property (nonatomic, strong) NSArray * cellDataArray;

+ (OneUserCenterHeaderCell *)cellWithTableView:(UITableView *)tableView;


@end
