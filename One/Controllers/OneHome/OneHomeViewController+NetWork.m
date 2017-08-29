//
//  OneHomeViewController+NetWork.m
//  One
//
//  Created by hanyutong on 2017/7/6.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneHomeViewController+NetWork.h"


@implementation OneHomeViewController (NetWork)

 
- (void)requestHomeDataWithId
{
    //首页文章
    NSString * api =[NSString stringWithFormat:@"%@/2017-08-28/北京市",Channel];
    api = [api stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [OneHttpManager get:[OneHttpManager urlWithApi:api] params:@"platform=ios&sign=78153e725b54f19bb57778fb3af765a0&user_id=&uuid=48EB5D8A-5557-470B-8810-2CD3188E4D38&version=" success:^(id responseObject) {
        if ([responseObject[@"res"] integerValue] == 0)
        {
           
            self.listModel = [OneListModel modelWithDictionary:responseObject[@"data"]];
            for (OneContentList * model in self.listModel.content_list) {
                
                switch (model.category.integerValue)
                {
                    case 0:
                    {
                        OneListCellHeight * cellHeight = [[OneListCellHeight alloc] init];
                        cellHeight.contentModel = model;
                        [self.listCellHeightArray addObject:cellHeight];
                    }
                        break;
                    case 1:
                    {
                        OneContentCellHeight * cellHeight = [[OneContentCellHeight alloc] init];
                        cellHeight.contentModel = model;
                        [self.listCellHeightArray addObject:cellHeight];
                        
                    }
                        break;
                    case 2:
                    {
                        OneContentCellHeight * cellHeight = [[OneContentCellHeight alloc] init];
                        cellHeight.contentModel = model;
                        [self.listCellHeightArray addObject:cellHeight];
                        
                    }
                        break;
                    case 3:
                    {
                        OneContentCellHeight * cellHeight = [[OneContentCellHeight alloc] init];
                        cellHeight.contentModel = model;
                        [self.listCellHeightArray addObject:cellHeight];

                    }
                        break;
                    case 4://音乐
                    {
                        OneMusicContentCellHeight * cellHeight = [[OneMusicContentCellHeight alloc] init];
                        cellHeight.contentModel = model;
                        [self.listCellHeightArray addObject:cellHeight];
                    }
                        break;
                    case 5://影视
                    {
                        OneMovieContentCellHeight * cellHeight = [[OneMovieContentCellHeight alloc] init];
                        cellHeight.contentModel = model;
                        [self.listCellHeightArray addObject:cellHeight];
                    }
                        break;
                    default:
                    {
                        OneContentCellHeight * cellHeight = [[OneContentCellHeight alloc] init];
                        cellHeight.contentModel = model;
                        [self.listCellHeightArray addObject:cellHeight];

                    }
                        break;
                }
            }

            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}





@end
