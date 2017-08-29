//
//  OneMovieContentCellHeight.h
//  One
//
//  Created by hanyutong on 2017/8/29.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OneListModel.h"

@interface OneMovieContentCellHeight : NSObject

@property (nonatomic, assign) NSInteger cellHeight;
@property (nonatomic, strong) OneContentList *contentModel;

@property (nonatomic, assign) CGRect sourceTypeLFrame;

@property (nonatomic, assign) CGRect titleLFrame;
@property (nonatomic, assign) CGRect authorLFrame;
@property (nonatomic, assign) CGRect bgImageVFrame;

@property (nonatomic, assign) CGRect nameLFrame;



@property (nonatomic, assign) CGRect  pictureImageVFrame;
@property (nonatomic, assign) CGRect  contentLFrame;

@property (nonatomic, assign) CGRect contentVFrame;
@property (nonatomic, assign) CGRect menuVFrame;
@property (nonatomic, assign) CGRect seperateVFrame;

@end
