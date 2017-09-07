//
//  OneSearchController.m
//  One
//
//  Created by hanyutong on 2017/9/6.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneSearchController.h"

@interface OneSearchController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSArray * itemArray;

@end

@implementation OneSearchController

-(void)viewDidLoad
{
    [super viewDidLoad];
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView = tableView;
    tableView.bounces = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    
    UISearchBar * searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 20, MAINSCREEN_WIDTH, 44)];
    searchBar.delegate = self;
    searchBar.showsCancelButton = YES;
    searchBar.placeholder = @"在这里写下你想寻找的";
    searchBar.tintColor = [UIColor lightGrayColor];
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    searchBar.backgroundColor = [UIColor clearColor];
    UITextField *textField = [searchBar valueForKey:@"_searchField"];
    textField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    self.navigationItem.titleView = searchBar;
    
    [textField becomeFirstResponder];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 4*OneMergin;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 4*OneMergin;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (MAINSCREEN_HEIGHT - 64 - 8*OneMergin)/self.itemArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    UILabel * itemL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MAINSCREEN_WIDTH, (MAINSCREEN_HEIGHT - 64 - 8*OneMergin)/self.itemArray.count)];
    itemL.textAlignment = NSTextAlignmentCenter;
    itemL.text = self.itemArray[indexPath.row];
    itemL.font = [UIFont systemFontOfSize:15];
    itemL.textColor = [UIColor lightGrayColor];
    [cell addSubview:itemL];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}


-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
-(NSArray *)itemArray
{
    if (_itemArray == nil)
    {
        _itemArray = @[@"图文",@"问答",@"阅读",@"连载",@"影视",@"音乐",@"电台"];
    }
    return _itemArray;
}




@end
