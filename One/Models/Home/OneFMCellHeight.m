//
//  OneFMCellHeight.m
//  One
//
//  Created by hanyutong on 2017/8/31.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneFMCellHeight.h"
#import <ImageIO/ImageIO.h>

@implementation OneFMCellHeight

-(void)setContentModel:(OneContentList *)contentModel
{
    _contentModel = contentModel;
    
    [self downloadPngImage:contentModel];
    
    _cellHeight = _contentModel.img_Height;
    
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
