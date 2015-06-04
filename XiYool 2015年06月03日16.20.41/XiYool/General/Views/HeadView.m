//
//  HeadView.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/5.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "HeadView.h"
#import "All.h"
@implementation HeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    self.backgroundColor=[UIColor orangeColor];
    //创建打开菜单栏按钮
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *imge=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    imge.image=[UIImage imageNamed:@"ic_drawer"];
    [btn addTarget:[View sharedController] action:@selector(loadleftlist) forControlEvents:UIControlEventTouchUpInside];
    [btn addSubview:imge];
    [self addSubview:btn];
    return self;
}
@end
