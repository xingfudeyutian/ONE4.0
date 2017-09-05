//
//  OneAllViewController+NetWork.m
//  One
//
//  Created by hanyutong on 2017/8/18.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneAllViewController+NetWork.h"
#import "OneBannerListData.h"
#import "OneAuthorHotData.h"
#import "OneSubjectCellHeight.h"


@implementation OneAllViewController (NetWork)

//广告
- (void)getBannerList3
{
    NSString * api =[NSString stringWithFormat:@"%@/3",Banner];
    [OneHttpManager get:[OneHttpManager urlWithApi:api] params:@"last_id=0&platform=ios&sign=e944f8e379b286cf632f4271d16b970b&user_id=5919664&uuid=48EB5D8A-5557-470B-8810-2CD3188E4D38&version=v4.3.2" success:^(id responseObject) {
        if ([responseObject[@"res"] integerValue] == 0)
        {
            self.bannerList3 = (NSMutableArray *)[NSArray modelArrayWithClass:[OneBannerListData class] json:responseObject[@"data"]];
            [self.tableView reloadSection:0 withRowAnimation:UITableViewRowAnimationFade];
        }
    } failure:^(NSError *error) {
        
    }];
}
//专题
- (void)getBannerList4
{
    NSString * api =[NSString stringWithFormat:@"%@/4",Banner];
    [OneHttpManager get:[OneHttpManager urlWithApi:api] params:@"last_id=0&platform=ios&sign=e944f8e379b286cf632f4271d16b970b&user_id=5919664&uuid=48EB5D8A-5557-470B-8810-2CD3188E4D38&version=v4.3.1" success:^(id responseObject) {
        if ([responseObject[@"res"] integerValue] == 0)
        {
//            NSArray * bannerArray = [NSArray modelArrayWithClass:[OneBannerListData class] json:responseObject[@"data"]];

//            for (OneBannerListData * bannerData in bannerArray)
//            {
//                OneSubjectCellHeight * cellHeight = [[OneSubjectCellHeight alloc] init];
//                cellHeight.bannerData = bannerData;
//                [self.bannerList4 addObject:cellHeight];
//            }
            
            self.bannerList4 = (NSMutableArray *)[NSArray modelArrayWithClass:[OneBannerListData class] json:responseObject[@"data"]];

            
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
//所有人问所有人
- (void)getBannerList5
{
    NSString * api =[NSString stringWithFormat:@"%@/5",Banner];
    [OneHttpManager get:[OneHttpManager urlWithApi:api] params:@"last_id=0&platform=ios&sign=e944f8e379b286cf632f4271d16b970b&user_id=5919664&uuid=48EB5D8A-5557-470B-8810-2CD3188E4D38&version=v4.3.1" success:^(id responseObject) {
        if ([responseObject[@"res"] integerValue] == 0)
        {
            self.bannerList5 = (NSMutableArray *)[NSArray modelArrayWithClass:[OneBannerListData class] json:responseObject[@"data"]];
            [self.tableView reloadSection:7 withRowAnimation:UITableViewRowAnimationFade];
        }
    } failure:^(NSError *error) {
        
    }];
}
//近期热门作者
- (void)getAuthorHot
{
    NSString * api =[NSString stringWithFormat:@"%@",AuthorHot];
    [OneHttpManager get:[OneHttpManager urlWithApi:api] params:@"last_id=0&platform=ios&sign=e944f8e379b286cf632f4271d16b970b&user_id=5919664&uuid=48EB5D8A-5557-470B-8810-2CD3188E4D38&version=v4.3.1" success:^(id responseObject) {
        if ([responseObject[@"res"] integerValue] == 0)
        {
            self.authorHotData = (NSMutableArray *)[NSArray modelArrayWithClass:[OneAuthorHotData class] json:responseObject[@"data"]];
            [self.tableView reloadSection:6 withRowAnimation:UITableViewRowAnimationFade];
        }
    } failure:^(NSError *error) {
        
    }];

}


@end
