//
//  OneAskCell.h
//  One
//
//  Created by hanyutong on 2017/8/18.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneBannerListData.h"

@interface OneAskCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray * cellDataArray;

+(OneAskCell *)cellWithTableView:(UITableView *)tableView;

@end
