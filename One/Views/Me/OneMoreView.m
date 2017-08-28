//
//  OneMoreView.m
//  One
//
//  Created by hanyutong on 2017/8/21.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneMoreView.h"

@implementation OneMoreView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    int i = rect.size.width;
    int j = rect.size.height;
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(i*150, 75)
                                                         radius:j*75
                                                     startAngle:M_PI/2
                                                       endAngle:-M_PI/2
                                                      clockwise:YES];
    
    /*
     绍一下这个方法中的参数：
     
     /
     
     ArcCenter: 原点
     
     radius: 半径
     
     startAngle: 开始角度
     
     endAngle: 结束角度
     
     /
     */
    aPath.lineWidth = 1.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound; //终点处理
    
    
    
    [aPath stroke];
    
    
}


@end
