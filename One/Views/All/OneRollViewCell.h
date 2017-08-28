//
//  OneRollViewCell.h
//  One
//
//  Created by hanyutong on 2017/8/15.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneRollViewCell : UITableViewCell

@property (nonatomic, strong) NSArray * cellDataArray;
+(OneRollViewCell *)cellWithTableView:(UITableView *)tableView;
@end
