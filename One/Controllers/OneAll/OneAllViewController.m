//
//  OneReadViewController.m
//  One
//
//  Created by hanyutong on 2017/6/30.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneAllViewController.h"
#import "OneAllViewController+NetWork.h"
#import "OneAllViewController+Actions.h"

#import "OneRollViewCell.h"
#import "OneClassifyCell.h"
#import "OneSubjectCell.h"
#import "OneHotAuthorCell.h"
#import "OneAskCell.h"



@interface OneAllViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation OneAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.titleView.backgroundColor = [UIColor greenColor];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"all_title_view"]];
    
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    [self getBannerList3];//广告
    [self getBannerList4];//专题
    [self getBannerList5];//所有人问所有人
    [self getAuthorHot]; //近期热门作者
}






#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==6)
    {
        return 3;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger count = self.bannerList4.count > 8 ?self.bannerList4.count:9;
    return 4 + count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0.01f;
    }
    else if (section == 6)
    {
        return 40.f;
    }
    else
    {
        return 10.0f;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 6)
    {
        return 60.f;
    }
    return 0.01f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView * bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    if (section == 6)
    {
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.frame = CGRectMake(0, 10, MAINSCREEN_WIDTH, 30);
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(OneMergin, 10, view.width, view.height)];
        label.text = @"近期热门作者";
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:14];
        [view addSubview:label];
        [bgView addSubview:view];
    }
    
    return bgView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 6)
    {
        UIView * view = [UIView new];
        view.frame = CGRectMake(0, 0, MAINSCREEN_WIDTH, 60);
        UIButton * changeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
        changeBtn.centerX = view.centerX;
        changeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [changeBtn setTitle:@"换一换" forState:UIControlStateNormal];
        [changeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        changeBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        changeBtn.layer.borderWidth = 1.0;
        [view addSubview:changeBtn];
        return view;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
       return 270;
    }else if(indexPath.section == 1)
    {
        return 80+5+((MAINSCREEN_WIDTH-40-15)/4)*2;
    }else if(indexPath.section == 6)
    {
        return 80;
    }else if (indexPath.section == 7)
    {
        return 200;
    }
    return 340;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        OneRollViewCell * cell = [OneRollViewCell cellWithTableView:tableView];
        cell.cellDataArray = self.bannerList3;
        return cell;
    }else if (indexPath.section == 1)
    {
        OneClassifyCell * cell = [OneClassifyCell cellWithTableView:tableView];
        return cell;
        
    }else if(indexPath.section > 1 && indexPath.section < 6)
    {
        OneSubjectCell * cell = [OneSubjectCell cellWithTableView:tableView];
        cell.bannerData = self.bannerList4[indexPath.section-2];
        return cell;
    }
    else if (indexPath.section == 6)
    {
        OneHotAuthorCell * cell = [OneHotAuthorCell cellWithTableView:tableView];
        cell.authorHotData = self.authorHotData[indexPath.row];
        return cell;
    }
    else if (indexPath.section == 7)
    {
        OneAskCell * cell = [OneAskCell cellWithTableView:tableView];
        cell.cellDataArray = self.bannerList5;
        return cell;
    }
    else
    {
        OneSubjectCell * cell = [OneSubjectCell cellWithTableView:tableView];
        cell.bannerData = self.bannerList4[indexPath.section-4];
        return cell;
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
