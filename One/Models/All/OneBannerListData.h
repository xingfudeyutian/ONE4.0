//
//  OneBannerListData.h
//  One
//
//  Created by hanyutong on 2017/8/18.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneBannerListData : NSObject

/*
 "id": 16,
 "cover": "http:\/\/image.wufazhuce.com\/FqU6PQhREPn2nTrzCKf2s1R3tQXF?bid=16",
 "title": "\u7537\u5973\u642d\u914d\uff0c\u771f\u7684\u5f88\u7d2f",
 "category": 11,
 "content_id": "18",
 "is_stick": false,
 "serial_list": [],
 "link_url": ""
 */
@property (nonatomic, copy) NSString * bannerId;
@property (nonatomic, copy) NSString * cover;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * category;
@property (nonatomic, copy) NSString * content_id;
@property (nonatomic, copy) NSString * is_stick;
@property (nonatomic, copy) NSString * serial_list;
@property (nonatomic, copy) NSString * link_url;

@end
