//
//  HomeViewController.m
//  One
//
//  Created by hanyutong on 2017/6/30.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneHomeViewController.h"
#import "OneHomeViewController+NetWork.h"
@interface OneHomeViewController ()

@end

@implementation OneHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //当天
    [self requestHomeDataWithDate:@"0"];
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
    
    
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    
    [dateFormat setDateFormat:@"yyyy-MM-dd"];//设定时间格式,这里可以设置成自己需要的格式
    
//    NSString *currentDateStr = [dateFormat stringFromDate:[NSDate date]];
#warning ---- 暂时
    
    NSDate * date = [NSDate date];
    NSInteger currentday = date.day - page;
    NSInteger currentMonth = date.month;
   
    if (currentday==0 ||currentday<0 )
    {
        currentMonth = date.month -1;
        NSArray * monthAry = @[@"1",@"3",@"5",@"7",@"8",@"10",@"12"];
        BOOL isExist = [monthAry containsObject:[NSString stringWithFormat:@"%ld",currentMonth]];
        
        //替换成上个月末
         currentday = isExist?31+currentday:30+currentday;
    }
 
    [self requestHomeDataWithDate:[NSString stringWithFormat:@"%ld-%ld-%ld",(long)date.year,(long)currentMonth,(long)currentday]];
    

    //    [self.tableView reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
