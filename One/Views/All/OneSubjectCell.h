//
//  OneSubjectCell.h
//  One
//
//  Created by hanyutong on 2017/8/15.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneBannerListData.h"
//#import "OneSubjectCellHeight.h"

@interface OneSubjectCell : UITableViewCell

@property (nonatomic, strong) OneBannerListData * bannerData;

//@property (nonatomic, strong)OneSubjectCellHeight * cellHeight;

+ (OneSubjectCell *)cellWithTableView:(UITableView *)tableView;


@end
