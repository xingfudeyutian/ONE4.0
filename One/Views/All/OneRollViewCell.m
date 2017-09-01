//
//  OneRollViewCell.m
//  One
//
//  Created by hanyutong on 2017/8/15.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneRollViewCell.h"
#import "OneBannerListData.h"


@interface OneRollViewCell ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView * scrollView;
@property (nonatomic, weak) UIPageControl * pageControl;
//@property (nonatomic, weak) UIImageView * currentImageV;

@end

@implementation OneRollViewCell

+(OneRollViewCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString * cellID = @"OneRollViewCell";
    OneRollViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[OneRollViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupSubviews];
    }
    return self;
}

-(void)setupSubviews
{
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    scrollView.delegate = self;
//    scrollView.backgroundColor = [UIColor blackColor];
    scrollView.pagingEnabled = YES;
    [self.contentView addSubview:scrollView];
    
    UIPageControl * pageControl = [[UIPageControl alloc] init];
    self.pageControl = pageControl;
    pageControl.currentPage = 0;
    [self addSubview:pageControl];
  
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = CGRectMake(0, 0, MAINSCREEN_WIDTH, self.height);
    
    self.pageControl.frame = CGRectMake(self.scrollView.width/2, 0, self.scrollView.width/2, 30);
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
}


-(void)setCellDataArray:(NSArray *)cellDataArray
{
    _cellDataArray = cellDataArray;
    
    self.pageControl.numberOfPages = cellDataArray.count;
    self.scrollView.contentSize = CGSizeMake(cellDataArray.count*MAINSCREEN_WIDTH, self.contentView.height);
    [self.scrollView removeAllSubviews];
    for (int i = 0; i < cellDataArray.count; i++)
    {
        OneBannerListData * bannerData = self.cellDataArray[i];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*MAINSCREEN_WIDTH, 0, MAINSCREEN_WIDTH, 270)];
        imageView.tag = i;
        [imageView setImageWithURL:[NSURL URLWithString:bannerData.cover] placeholder:[UIImage imageNamed:@"ReadingPlaceHolder1"]];
        
        imageView.userInteractionEnabled = YES;
        imageView.backgroundColor = i%2 == 0?[UIColor yellowColor]:[UIColor redColor];
        [self.scrollView addSubview:imageView];
    }
}






@end
