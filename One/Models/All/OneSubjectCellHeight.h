//
//  OneSubjectCellHeight.h
//  One
//
//  Created by hanyutong on 2017/9/5.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OneBannerListData.h"

@interface OneSubjectCellHeight : NSObject

@property (nonatomic, assign) NSInteger cellHeight;
@property (nonatomic, strong) OneBannerListData * bannerData;


@property (nonatomic, assign) CGRect iconImageVFrame;
@property (nonatomic, assign) CGRect contentLFrame;



@end
