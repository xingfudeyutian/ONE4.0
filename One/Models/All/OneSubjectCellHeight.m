//
//  OneSubjectCellHeight.m
//  One
//
//  Created by hanyutong on 2017/9/5.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneSubjectCellHeight.h"
#import <ImageIO/ImageIO.h>

@implementation OneSubjectCellHeight

- (void)setBannerData:(OneBannerListData *)bannerData
{
    _bannerData = bannerData;
    
    [self downloadPngImage:bannerData];
    
    _iconImageVFrame = CGRectMake(OneMergin, OneMergin, MAINSCREEN_WIDTH-2*OneMergin, bannerData.cover_height);
    CGFloat contentLHeight = [bannerData.title heightForFont:[UIFont systemFontOfSize:14] width:_iconImageVFrame.size.width];

    _contentLFrame = CGRectMake(_iconImageVFrame.origin.x, CGRectGetMaxY(_iconImageVFrame)+OneMergin, _iconImageVFrame.size.width, contentLHeight);
    
    _cellHeight = _contentLFrame.origin.y + _contentLFrame.size.height+OneMergin;
}

-(void)downloadPngImage:(OneBannerListData *)bannerData
{
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)[NSURL URLWithString:bannerData.cover], NULL);
    CGFloat width = 0, height = 0;
    
    if (imageSource)
    {
        CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, NULL);
        
        if (imageProperties != NULL)
        {
            CFNumberRef widthNum  = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
            if (widthNum != NULL) {
                CFNumberGetValue(widthNum, kCFNumberFloat64Type, &width);
            }
            
            CFNumberRef heightNum = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            if (heightNum != NULL) {
                CFNumberGetValue(heightNum, kCFNumberFloat64Type, &height);
            }
            
            CFRelease(imageProperties);
        }
        CFRelease(imageSource);
        //        NSLog(@"Image dimensions: %f x %f", width, height);
        bannerData.cover_height = height/width*(MAINSCREEN_WIDTH - OneMergin*2);
    }
    else
    {
        
    }
}

@end
