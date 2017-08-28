//
//  OneBaseViewController.h
//  One
//
//  Created by hanyutong on 2017/7/4.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneListModel.h"
#import "OneListCellHeight.h"
#import "OneContentCellHeight.h"
#import "OneMusicContentCellHeight.h"

@interface OneBaseViewController : UIViewController

@property (nonatomic, weak) UIScrollView * scrollView;
@property (nonatomic, weak) UIPageControl * pageControl;
@property (nonatomic, strong)UITableView * tableView;
@property (nonatomic, strong) OneListModel * listModel;
@property (nonatomic, strong) NSMutableArray * listCellHeightArray;

@end
