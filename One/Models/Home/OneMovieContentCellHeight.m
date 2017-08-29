//
//  OneMovieContentCellHeight.m
//  One
//
//  Created by hanyutong on 2017/8/29.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMovieContentCellHeight.h"

@implementation OneMovieContentCellHeight

-(void)setContentModel:(OneContentList *)contentModel
{
    _contentModel = contentModel;
    
    _sourceTypeLFrame = CGRectMake(OneMergin, OneMergin/2, MAINSCREEN_WIDTH-2*OneMergin, OneMergin);
    
    CGFloat titleHeight = [contentModel.title heightForFont:[UIFont systemFontOfSize:16] width:_sourceTypeLFrame.size.width];
    _titleLFrame = CGRectMake(0, 0, MAINSCREEN_WIDTH-2*OneMergin, titleHeight);
    _authorLFrame = CGRectMake(_titleLFrame.origin.x, CGRectGetMaxY(_titleLFrame)+OneMergin, _titleLFrame.size.width, OneMergin);
    
    _bgImageVFrame = CGRectMake(_titleLFrame.origin.x, CGRectGetMaxY(_authorLFrame)+OneMergin/2, _titleLFrame.size.width, 223);
    
    _pictureImageVFrame = CGRectMake(_bgImageVFrame.origin.x, _bgImageVFrame.origin.y+OneMergin, _bgImageVFrame.size.width, _bgImageVFrame.size.height-2*OneMergin);
    
    
    
    CGFloat contentLHeight = [contentModel.forward heightForFont:[UIFont systemFontOfSize:14] width:_sourceTypeLFrame.size.width];
    _contentLFrame = CGRectMake(_titleLFrame.origin.x, CGRectGetMaxY(_bgImageVFrame)+OneMergin/2, _titleLFrame.size.width, contentLHeight);
    
    _nameLFrame = CGRectMake(_bgImageVFrame.origin.x, CGRectGetMaxY(_contentLFrame)+OneMergin/2, _bgImageVFrame.size.width, OneMergin);
    CGFloat contentVHeight = _nameLFrame.origin.y + _nameLFrame.size.height;
    
    _contentVFrame = CGRectMake(_sourceTypeLFrame.origin.x, CGRectGetMaxY(_sourceTypeLFrame)+OneMergin, _sourceTypeLFrame.size.width, contentVHeight);
    
    _menuVFrame = CGRectMake(OneMergin, CGRectGetMaxY(_contentVFrame)+OneMergin*2, MAINSCREEN_WIDTH-2*OneMergin, OneMergin);
    _seperateVFrame = CGRectMake(0, CGRectGetMaxY(_menuVFrame)+OneMergin/2, MAINSCREEN_WIDTH, OneMergin/2);
    _cellHeight = _seperateVFrame.origin.y+ _seperateVFrame.size.height ;
    
}


@end
