//
//  OneDiaryModel.h
//  One
//
//  Created by hanyutong on 2017/8/21.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneDiaryModel : NSObject

@property (nonatomic, copy) NSString * content;
@property (nonatomic, copy) NSString * diaryId;
@property (nonatomic, copy) NSArray  * feeds_data;
@property (nonatomic, copy) NSString * picture;
@property (nonatomic, copy) NSString * weather;
@property (nonatomic, copy) NSString * input_date;
@property (nonatomic, copy) NSString * cropped_picture;


@end
