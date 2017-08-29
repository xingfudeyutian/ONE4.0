//
//  OneMovieCell.h
//  One
//
//  Created by hanyutong on 2017/8/29.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneMovieContentCellHeight.h"


@interface OneMovieCell : UITableViewCell

+ (OneMovieCell *)cellWithTableView: (UITableView *)tableView;

@property (nonatomic, strong)OneMovieContentCellHeight * movieCellHeight;

@end
