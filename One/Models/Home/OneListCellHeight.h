//
//  OneListCellHeight.h
//  One
//
//  Created by hanyutong on 2017/7/6.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OneListModel.h"

@interface OneListCellHeight : NSObject

@property (nonatomic, assign) NSInteger cellHeight;
@property (nonatomic, strong) OneContentList *contentModel;

@property (nonatomic, assign) CGRect imageFrame;
@property (nonatomic, assign) CGRect authorFrame;
@property (nonatomic, assign) CGRect contentFrame;
@property (nonatomic, assign) CGRect titleFrame;
@property (nonatomic, assign) CGRect menuFrame;
@property (nonatomic, assign) CGRect seperateFrame;




@end
