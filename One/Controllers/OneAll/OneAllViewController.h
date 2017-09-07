//
//  OneReadViewController.h
//  One
//
//  Created by hanyutong on 2017/6/30.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneSearchController.h"


@interface OneAllViewController : UIViewController

@property (nonatomic, strong) NSMutableArray * bannerList3;//广告
@property (nonatomic, strong) NSMutableArray * bannerList4;//专题
@property (nonatomic, strong) NSMutableArray * bannerList5;//所有人问所有人
@property (nonatomic, strong) NSMutableArray * authorHotData;//所有人问所有人

@property (nonatomic, weak) UITableView * tableView;

@end
