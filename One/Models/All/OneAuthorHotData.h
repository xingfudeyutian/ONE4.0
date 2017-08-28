//
//  OneAuthorHotData.h
//  One
//
//  Created by hanyutong on 2017/8/18.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneAuthorHotData : NSObject

/*
 "user_id": "4813382",
 "user_name": "\u5f20\u6653\u6657",
 "desc": "\u4f5c\u5bb6\u3001\u7f16\u5267\u3001\u94f6\u6cb3\u7cfb\u5c11\u5148\u961f\u5927\u961f\u957f\u3002\u5df2\u51fa\u7248\u300a\u5973\u738b\u4e54\u5b89\u300b\u3001\u300a\u5c11\u5e74\u535a\u7269\u9986\u300b\u7b49\u3002@\u5f20\u6653\u6657Oliver\uff0cID\uff1a\u94f6\u6cb3\u7cfb\u4f1a\u73a9\u3002",
 "wb_name": "@\u5f20\u6653\u6657Oliver",
 "is_settled": "0",
 "settled_type": "0",
 "summary": "\u4f5c\u5bb6\u3001\u7f16\u5267\u3001\u94f6\u6cb3\u7cfb\u5c11\u5148\u961f\u5927\u961f\u957f\u3002",
 "fans_total": "14832",
 "web_url": "http:\/\/image.wufazhuce.com\/FpKk2mb_wawSFx-qMyvollJW4PdX"
 
 */


@property (nonatomic, copy) NSString * user_id;
@property (nonatomic, copy) NSString * user_name;
@property (nonatomic, copy) NSString * desc;
@property (nonatomic, copy) NSString * wb_name;
@property (nonatomic, copy) NSString * is_settled;
@property (nonatomic, copy) NSString * settled_type;
@property (nonatomic, copy) NSString * summary;
@property (nonatomic, copy) NSString * fans_total;
@property (nonatomic, copy) NSString * web_url;


@end
