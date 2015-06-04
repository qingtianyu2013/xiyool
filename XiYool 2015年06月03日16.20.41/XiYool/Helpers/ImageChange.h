//
//  ImageChange.h
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/27.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(ImageChange)
+ (instancetype)circleImageWithImage:(UIImage *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
-(UIImage *)imageAtRect:(CGRect)rect;
@end
