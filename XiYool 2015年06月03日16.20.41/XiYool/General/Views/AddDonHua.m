//
//  AddDonHua.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/12.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "AddDonHua.h"

@implementation UIView(AddDonHua)
-(void)addDHfangkuangFrame:(CGRect)frame lineWidth:(int)linewidth Color:(UIColor *)color
{
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:2];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = color.CGColor;
        layer.lineWidth = linewidth;
    layer.path = path.CGPath;
    [self.layer addSublayer:layer];
}
-(void)addDHxiahuaxieSize:(int)size LineWidth:(int)linewidth Color:(UIColor *)color
{
    UIBezierPath *path=[UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0,self.frame.size.height-size )];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
    
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    
    [path addLineToPoint:CGPointMake(self.frame.size.width,self.frame.size.height-size )];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = color.CGColor;
    layer.lineWidth = linewidth;
    layer.path = path.CGPath;
    [self.layer addSublayer:layer];
}
@end
