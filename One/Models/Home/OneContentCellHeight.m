//
//  OneContentCellHeight.m
//  One
//
//  Created by hanyutong on 2017/8/24.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneContentCellHeight.h"
#import <ImageIO/ImageIO.h>

@implementation OneContentCellHeight


-(void)setContentModel:(OneContentList *)contentModel
{
    _contentModel = contentModel;
    
    _sourceTypeLFrame = CGRectMake(OneMergin, OneMergin/2, MAINSCREEN_WIDTH-2*OneMergin, OneMergin);
    
    CGFloat titleHeight = [contentModel.title heightForFont:[UIFont systemFontOfSize:16] width:_sourceTypeLFrame.size.width];
    _titleLFrame = CGRectMake(0, 0, MAINSCREEN_WIDTH-2*OneMergin, titleHeight);
    _authorLFrame = CGRectMake(_titleLFrame.origin.x, CGRectGetMaxY(_titleLFrame)+OneMergin, _titleLFrame.size.width, OneMergin);
    [self downloadPngImage:contentModel];
    
    _pictureImageVFrame = CGRectMake(_titleLFrame.origin.x, CGRectGetMaxY(_authorLFrame)+OneMergin/3, _titleLFrame.size.width, contentModel.img_Height>223?223:contentModel.img_Height);
    CGFloat contentLHeight = [contentModel.forward heightForFont:[UIFont systemFontOfSize:14] width:_sourceTypeLFrame.size.width];
    _contentLFrame = CGRectMake(_titleLFrame.origin.x, CGRectGetMaxY(_pictureImageVFrame)+OneMergin/2, _titleLFrame.size.width, contentLHeight);
    
    CGFloat contentVHeight = _contentLFrame.origin.y + _contentLFrame.size.height;
    
    _contentVFrame = CGRectMake(_sourceTypeLFrame.origin.x, CGRectGetMaxY(_sourceTypeLFrame)+OneMergin, _sourceTypeLFrame.size.width, contentVHeight);
    
    
    _menuVFrame = CGRectMake(OneMergin, CGRectGetMaxY(_contentVFrame)+OneMergin*2, MAINSCREEN_WIDTH-2*OneMergin, OneMergin);
    _seperateVFrame = CGRectMake(0, CGRectGetMaxY(_menuVFrame)+OneMergin/2, MAINSCREEN_WIDTH, OneMergin/2);
    _cellHeight = _seperateVFrame.origin.y+ _seperateVFrame.size.height ;
}

-(void)downloadPngImage:(OneContentList *)contentModel
{
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)[NSURL URLWithString:contentModel.img_url], NULL);
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
        contentModel.img_Height = height/width*(MAINSCREEN_WIDTH - OneMergin*2);
    }
    else
    {
        
    }
}


@end
