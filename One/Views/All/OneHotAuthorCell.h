//
//  OneHotAuthorCell.h
//  One
//
//  Created by hanyutong on 2017/8/15.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneAuthorHotData.h"

@interface OneHotAuthorCell : UITableViewCell

@property (nonatomic , strong) OneAuthorHotData * authorHotData;

+ (OneHotAuthorCell *)cellWithTableView:(UITableView *)tableView;

@end
