//
//  OneListCellHeight.m
//  One
//
//  Created by hanyutong on 2017/7/6.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneListCellHeight.h"
#import <ImageIO/ImageIO.h>


@implementation OneListCellHeight

-(void)setContentModel:(OneContentList *)contentModel
{
    _contentModel = contentModel;
    [self downloadPngImage:contentModel];
    _imageFrame = CGRectMake(0, 0, MAINSCREEN_WIDTH, contentModel.img_Height);
    _authorFrame = CGRectMake(2*OneMergin, _imageFrame.size.height + OneMergin/2, MAINSCREEN_WIDTH-4*OneMergin, OneMergin/2);
    CGFloat contentHeight = [contentModel.forward heightForFont:[UIFont systemFontOfSize:14] width:_authorFrame.size.width];
    _contentFrame = CGRectMake(_authorFrame.origin.x, CGRectGetMaxY(_authorFrame)+OneMergin*2, _authorFrame.size.width, contentHeight);
    _titleFrame = CGRectMake(_authorFrame.origin.x, CGRectGetMaxY(_contentFrame)+OneMergin*2, _authorFrame.size.width, _authorFrame.size.height);
    _menuFrame = CGRectMake(OneMergin, CGRectGetMaxY(_titleFrame)+OneMergin*2, MAINSCREEN_WIDTH-2*OneMergin, OneMergin);
    _seperateFrame = CGRectMake(0, CGRectGetMaxY(_menuFrame)+OneMergin/2, MAINSCREEN_WIDTH, OneMergin/2);
    _cellHeight = _seperateFrame.origin.y+ _seperateFrame.size.height ;
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
        contentModel.img_Height = height/width*MAINSCREEN_WIDTH ;
    }
    else
    {
        
    }
}



@end
