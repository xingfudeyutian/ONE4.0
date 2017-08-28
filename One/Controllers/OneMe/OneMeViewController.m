//
//  OneMusicViewController.m
//  One
//
//  Created by hanyutong on 2017/6/30.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMeViewController.h"
#import "OneMeViewController+NetWork.h"
#import "OneUserCenterHeaderCell.h"
#import "OneMyCollectCell.h"
#import "OneMyFollowCell.h"


@interface OneMeViewController () <UITableViewDelegate, UITableViewDataSource>


@end

@implementation OneMeViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -64, MAINSCREEN_WIDTH, MAINSCREEN_HEIGHT+20)];
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];

    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    UIButton * leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftButton setImage:[UIImage imageNamed:@"user_center_setting"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];

    UIButton * rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];

    [rightButton setImage:[UIImage imageNamed:@"user_message_white"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];

    self.navigationController.navigationBar.clipsToBounds = YES;
    // 导航栏背景透明度设置
    UIView *barBackgroundView = [[self.navigationController.navigationBar subviews] objectAtIndex:0];// _UIBarBackground
    UIImageView *backgroundImageView = [[barBackgroundView subviews] objectAtIndex:0];// UIImageView
    if (self.navigationController.navigationBar.isTranslucent) {
        if (backgroundImageView != nil && backgroundImageView.image != nil) {
            barBackgroundView.alpha = 0;
        } else {
            UIView *backgroundEffectView = [[barBackgroundView subviews] objectAtIndex:1];// UIVisualEffectView
            if (backgroundEffectView != nil) {
                backgroundEffectView.alpha = 0;
            }
        }
    } else {
        barBackgroundView.alpha = 0;
    }
   
    [self getPersonalDiary];
}


#pragma mark - UITableViewDelegate, UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return 400;
            break;
        case 1:
            return 140;
            break;
        case 2:
            return 50;
            break;
        case 3:
            return 50;
            break;
        default:
            break;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return section == 0?0:OneMergin/2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section)
    {
        case 0:
        {
            OneUserCenterHeaderCell * cell = [OneUserCenterHeaderCell cellWithTableView:tableView];
            cell.cellDataArray = self.diaryList;//@[@"1",@"1",@"1",@"1",@"1"];
            return cell;
        }
            break;
        case 1:
        {
            OneMyCollectCell * cell = [OneMyCollectCell cellWithTableView:tableView];
            return cell;
        }
            break;
        case 2:
        {
            OneMyFollowCell * cell = [OneMyFollowCell cellWithTableView:tableView];
            cell.textLabel.text = @"我的关注";
            cell.imageView.image = [UIImage imageNamed:@"user_center_following"];
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.textLabel.textColor = [UIColor lightGrayColor];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
            break;
        case 3:
        {
            OneMyFollowCell * cell = [OneMyFollowCell cellWithTableView:tableView];
            cell.textLabel.text = @"歌单";
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            cell.imageView.image = [UIImage imageNamed:@"music_list"];
            cell.textLabel.textColor = [UIColor lightGrayColor];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
            break;
        default:
            break;
    }
    
    return nil;
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    
}



@end
