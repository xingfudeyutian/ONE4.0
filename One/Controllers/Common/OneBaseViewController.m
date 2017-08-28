//
//  OneBaseViewController.m
//  One
//
//  Created by hanyutong on 2017/7/4.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneBaseViewController.h"
#import "OneContentCell.h"
#import "OneTopCell.h"
#import "OneMusicContentCell.h"

@interface OneBaseViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>


@end

@implementation OneBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
    
}

- (void)setupSubViews
{
    
     [self.tabBarController.tabBar setHidden:YES ];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView = scrollView;
    scrollView.delegate = self;
//    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.contentSize = CGSizeMake(10*[UIScreen mainScreen].applicationFrame.size.width, self.view.bounds.size.height-64);
    [scrollView setBounces:NO];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
  
    
    
    
    for (int i = 0; i<10 ;i++)
    {
        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(i*self.view.bounds.size.width, 0, self.view.bounds.size.width, scrollView.height)];
        tableView.tag = i;
//        tableView.backgroundColor = i%2 == 0?[UIColor redColor]:[UIColor greenColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.scrollView addSubview:tableView];
    }
    
    
    UIPageControl * pageControl =  [[UIPageControl alloc]initWithFrame:CGRectMake(0, 344, 320, 36)];
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
    //设置页码控制器的响应方法
    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    //设置总页数
    self.pageControl.numberOfPages = 10;
    //默认当前页为第一页
    self.pageControl.currentPage = 0;
    self.pageControl.hidden = YES;
    
    self.tableView = self.scrollView.subviews[self.pageControl.currentPage];
}

- (void)changePage:(id)sender
{
   
}
#pragma mark-----UIScrollViewDelegate---------
//实现协议UIScrollViewDelegate的方法，必须实现的
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取当前视图的宽度
    CGFloat pageWith = scrollView.frame.size.width;
    //根据scrolView的左右滑动,对pageCotrol的当前指示器进行切换(设置currentPage)
    int page = floor((scrollView.contentOffset.x - pageWith/2)/pageWith)+1;
    //切换改变页码，小圆点
    self.pageControl.currentPage = page;
    
    self.tableView = self.scrollView.subviews[self.pageControl.currentPage];
    [self.tableView reloadData];
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
 
    NSLog(@"%f" ,scrollView.contentOffset.y);
    if (scrollView.contentOffset.y <= 0) {
        //滑到顶部更新
        NSLog(@"滑到顶部更新");
        [self.tabBarController.tabBar setHidden:YES];
        self.scrollView.frame = self.view.bounds;
    }
    
    
    CGFloat height = scrollView.frame.size.height;
    CGFloat contentYoffset = scrollView.contentOffset.y;
    CGFloat distance = scrollView.contentSize.height - height;
    if (contentYoffset >= 30) {
        NSLog(@"您已经滑到底部了");
         [self.tabBarController.tabBar setHidden:NO];
        self.scrollView.frame = self.view.bounds;
    }
    
}
#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listCellHeightArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OneListCellHeight * listCellHeight = self.listCellHeightArray[indexPath.row];
    return listCellHeight.cellHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OneContentList * contentModel = [self.listCellHeightArray[indexPath.row] contentModel];
    
    switch (contentModel.category.integerValue)
    {
        case 0:
        {
            OneTopCell * topCell = [OneTopCell cellWithTableView:tableView];
            topCell.cellHeight = self.listCellHeightArray[indexPath.row];
            return topCell;
        }
            break;
         case 1:
        {
            OneContentCell * contentCell = [OneContentCell cellWithTableView:tableView];
            contentCell.cellHeight = self.listCellHeightArray[indexPath.row];
            return contentCell;
        }
            break;
         case 2:
        {
            OneContentCell * contentCell = [OneContentCell cellWithTableView:tableView];
            contentCell.cellHeight = self.listCellHeightArray[indexPath.row];
            return contentCell;
        }
            break;
         case 3:
        {
            OneContentCell * contentCell = [OneContentCell cellWithTableView:tableView];
            contentCell.cellHeight = self.listCellHeightArray[indexPath.row];
            return contentCell;
        }
            break;
         case 4:
        {
            OneMusicContentCell * musicContentCell = [OneMusicContentCell cellWithTableView:tableView];
            musicContentCell.musicCellHeight = self.listCellHeightArray[indexPath.row];
            return musicContentCell;
        }
            break;
        default:
        {
            OneContentCell * contentCell = [OneContentCell cellWithTableView:tableView];
            contentCell.cellHeight = self.listCellHeightArray[indexPath.row];
            return contentCell;
        }
            break;
    }
    return nil;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(NSMutableArray *)listCellHeightArray
{
    if (_listCellHeightArray == nil)
    {
        _listCellHeightArray = [NSMutableArray array];
    }
    return _listCellHeightArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
