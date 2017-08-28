//
//  OneListModel.m
//  One
//
//  Created by hanyutong on 2017/7/6.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneListModel.h"

@implementation OneShareLink


@end

@implementation OneShareList

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"qq"          : @"OneShareLink",
             @"wx"          : @"OneShareLink",
             @"wx_timeline" : @"OneShareLink",
             @"weibo"       : @"OneShareLink"
            };
}


@end

@implementation OneShareInfo


@end

@implementation OneAuthor



@end

@implementation OneTagList



@end

@implementation OneContentList

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"share_list"          : @"OneShareList",
             @"share_info"          : @"OneShareInfo",
             @"author"              : @"OneAuthor",
             @"tag_list"            : [OneTagList class]
             };
}

@end

@implementation OneWeather

@end

@implementation OneListModel

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"content_list"          : [OneContentList class],
             @"weather"               : @"OneWeather"
             };
}

@end
