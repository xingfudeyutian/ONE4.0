//
//  HomeViewController.m
//  One
//
//  Created by hanyutong on 2017/6/30.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneHomeViewController.h"
#import "OneHomeViewController+NetWork.h"

#import "OneContentViewController.h"

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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return;
    }
    
    
    OneContentList * contentModel = [self.listCellHeightArray[indexPath.row] contentModel];
    
//    2 连载
//    3 问答
//    4 音乐
//    5 影视
//    8 电台
    
    
    NSString * path = @"essay";
    switch (contentModel.category.integerValue)
    {
        case 2:
            path = @"serialcontent";
            break;
        case 3:
            path = @"question";
            break;
        case 4:
            path = @"music";
            break;
        case 5:
            path = @"movie";
            break;
        case 8:
            path = @"radio";
            break;
        default:
            break;
    }

    NSString * loadUrl = [NSString stringWithFormat:@"http://v3.wufazhuce.com:8000/api/%@/htmlcontent/%@?platform=ios&sign=0db7a982c84f9ef991503877d9279aec&source=summary&source_id=%@&user_id=&uuid=48EB5D8A-5557-470B-8810-2CD3188E4D38&version=v4.3.2",path,contentModel.content_id,contentModel.contentId];
    
    OneContentViewController * contentVC = [[OneContentViewController alloc] init];
    contentVC.loadUrl = loadUrl;
    contentVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:contentVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
