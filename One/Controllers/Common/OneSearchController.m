//
//  OneSearchController.m
//  One
//
//  Created by hanyutong on 2017/9/6.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneSearchController.h"

@interface OneSearchController ()<UISearchBarDelegate>

@property (nonatomic, weak) UITableView * tableView;
@property (nonatomic, strong) NSArray * itemArray;

@end

@implementation OneSearchController

-(void)viewDidLoad
{
    [super viewDidLoad];
   
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

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}







@end
