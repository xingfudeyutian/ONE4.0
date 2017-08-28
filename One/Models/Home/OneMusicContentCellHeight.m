//
//  OneMusicContentCellHeight.m
//  One
//
//  Created by hanyutong on 2017/8/24.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMusicContentCellHeight.h"

@implementation OneMusicContentCellHeight




-(void)setContentModel:(OneContentList *)contentModel
{
    _contentModel = contentModel;
    
    _sourceTypeLFrame = CGRectMake(OneMergin, OneMergin/2, MAINSCREEN_WIDTH-2*OneMergin, OneMergin);
    
    CGFloat titleHeight = [contentModel.title heightForFont:[UIFont systemFontOfSize:16] width:_sourceTypeLFrame.size.width];
    _titleLFrame = CGRectMake(0, 0, MAINSCREEN_WIDTH-2*OneMergin, titleHeight);
    _authorLFrame = CGRectMake(_titleLFrame.origin.x, CGRectGetMaxY(_titleLFrame)+OneMergin, _titleLFrame.size.width, OneMergin);
    
    CGFloat bgImageVWidth = MAINSCREEN_WIDTH*3/4;
    
    _bgImageVFrame = CGRectMake(-OneMergin, CGRectGetMaxY(_authorLFrame)+OneMergin/2, bgImageVWidth, 223);
    _musicLFrame = CGRectMake(MAINSCREEN_WIDTH-OneMergin*3, _bgImageVFrame.origin.y, OneMergin, _bgImageVFrame.size.height);
    _LogoImageVFrame = CGRectMake(0, _bgImageVFrame.origin.y+_bgImageVFrame.size.height-2*OneMergin, OneMergin, OneMergin);
    _menuBtnFrame = CGRectMake(0, 0, OneMergin*2, OneMergin*2);
    
    _pictureImageVFrame = CGRectMake(_bgImageVFrame.size.width-_bgImageVFrame.size.height, _bgImageVFrame.origin.y, _bgImageVFrame.size.height, _bgImageVFrame.size.height);
    
    _descLFrame = CGRectMake(_authorLFrame.origin.x, CGRectGetMaxY(_bgImageVFrame)+OneMergin/2, _authorLFrame.size.width, OneMergin);
    
    CGFloat contentLHeight = [contentModel.forward heightForFont:[UIFont systemFontOfSize:14] width:_sourceTypeLFrame.size.width];
    _contentLFrame = CGRectMake(_titleLFrame.origin.x, CGRectGetMaxY(_descLFrame)+OneMergin/2, _titleLFrame.size.width, contentLHeight);
    
    CGFloat contentVHeight = _contentLFrame.origin.y + _contentLFrame.size.height;
    
    _contentVFrame = CGRectMake(_sourceTypeLFrame.origin.x, CGRectGetMaxY(_sourceTypeLFrame)+OneMergin, _sourceTypeLFrame.size.width, contentVHeight);
    
    _menuVFrame = CGRectMake(OneMergin, CGRectGetMaxY(_contentVFrame)+OneMergin*2, MAINSCREEN_WIDTH-2*OneMergin, OneMergin);
    _seperateVFrame = CGRectMake(0, CGRectGetMaxY(_menuVFrame)+OneMergin/2, MAINSCREEN_WIDTH, OneMergin/2);
    _cellHeight = _seperateVFrame.origin.y+ _seperateVFrame.size.height ;
    
}


@end
