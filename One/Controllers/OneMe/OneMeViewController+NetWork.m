//
//  OneMeViewController+NetWork.m
//  One
//
//  Created by hanyutong on 2017/8/21.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMeViewController+NetWork.h"

#import "OneListModel.h"
#import "OneDiaryModel.h"


@implementation OneMeViewController (NetWork)

- (void)getPersonalDiary
{
    NSString * api = [OneHttpManager urlWithApi:PersonalDiary];
    [OneHttpManager get:[NSString stringWithFormat:@"%@?%@",api,@"jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE1MDMyODU4NzIsInVzZXJpZCI6IjU5MTk2NjQifQ.xxpNqIX_F8_dkjLrN1v6lPxe-qqlUCcIAfWhtjK5nYM&platform=ios&sign=db5886efe311ef572e86d1d359855503&user_id=5919664&uuid=48EB5D8A-5557-470B-8810-2CD3188E4D38&version=v4.3.2"] params:nil success:^(id responseObject) {
        if ([responseObject[@"res"] integerValue] == 0)
        {
             self.diaryList = (NSMutableArray *) [NSArray modelArrayWithClass:[OneDiaryModel class] json:responseObject[@"data"]] ;
            [self.tableView reloadSection:0 withRowAnimation:UITableViewRowAnimationNone];
        }
    } failure:^(NSError *error) {
        
    }];
    
    
}
@end
