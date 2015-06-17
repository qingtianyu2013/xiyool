//
//  Photochoose.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/27.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "Photochoose.h"
#import "ImageChange.h"
#import "View.h"
@implementation Photochoose
{
    CGPoint startmouse,startcenter;
    CGPoint startsize;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self . view   sendSubviewToBack:_imge];
    UIImage *pic=[View sharedController].photopic;
    double x,y;
    x=_imge.frame.origin.x;
    y=_imge.frame.origin.y;
    _imge.hidden=YES;
    _imge=nil;
    _imge= [[UIImageView alloc]initWithFrame: CGRectMake(x,y,pic.size.width , pic.size.height) ];
    _imge.image=pic;
    UIPanGestureRecognizer *imgepan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(imagepan:)];
    [_imge addGestureRecognizer:imgepan];
    [_imge setUserInteractionEnabled:YES];
    
    UIPinchGestureRecognizer *pinch=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(imageChangesize:)];
    [_imge addGestureRecognizer:pinch];
    
    
    [self.view addSubview:_imge];
    [self.view sendSubviewToBack:_imge];
    
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)choose:(id)sender {
   // UIImageWriteToSavedPhotosAlbum(_imge.image, self, nil, nil);
    [self.navigationController popViewControllerAnimated:YES];
    NSNotification *notification =[NSNotification notificationWithName:@"PicChoose" object:nil userInfo:nil];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
 
//    Image.layer.comerRedius = Image.bounds.size.width/2;
//    
//    Image.layer.masksToBounds = YES;
}

-(void)imagepan:(UIPanGestureRecognizer *)pan
{
CGPoint Point=[pan locationInView:_imge];
    if(pan.state==UIGestureRecognizerStateBegan)
    {
        startmouse=Point;
        startcenter =_imge.center;
    }
 
    Point.x=startcenter.x+(Point.x-startmouse.x);
    Point.y=startcenter.y+(Point.y-startmouse.y);
    startcenter=Point;
    _imge.center=Point;
if(pan.state==UIGestureRecognizerStateEnded)
{
    if (_imge.frame.origin.x+_imge.frame.size.width<[UIScreen mainScreen].applicationFrame.size.width-3) {
         _imge.frame=CGRectMake([UIScreen mainScreen].applicationFrame.size.width-_imge.frame.size.width-3,_imge.frame.origin.y , _imge.frame.size.width, _imge.frame.size.height);
    }
    if (_imge.frame.origin.y+_imge.frame.size.height<[UIScreen mainScreen].applicationFrame.size.height-43) {
        _imge.frame=CGRectMake(_imge.frame.origin.x,[UIScreen mainScreen].applicationFrame.size.height-_imge.frame.size.height-43, _imge.frame.size.width, _imge.frame.size.height);
    }
    if (_imge.frame.origin.x>3) {
        _imge.frame=CGRectMake(3, _imge.frame.origin.y, _imge.frame.size.width, _imge.frame.size.height);
    }
    if (_imge.frame.origin.y>60) {
        _imge.frame=CGRectMake(_imge.frame.origin.x,60 , _imge.frame.size.width, _imge.frame.size.height);
    }
}
}
-(void)imageChangesize:(UIPinchGestureRecognizer *)pinch
{
    if(pinch.state==UIGestureRecognizerStateBegan)
    {
        startsize.x=_imge.frame.size.width;
        startsize.y=_imge.frame.size.height;
    }
    _imge.frame=CGRectMake(_imge.frame.origin.x, _imge.frame.origin.y, startsize.x*pinch.scale, startsize.y*pinch.scale) ;
    
    if(pinch.state==UIGestureRecognizerStateEnded)
    {
        if (_imge.frame.size.width<200) {
             _imge.frame=CGRectMake(_imge.frame.origin.x, _imge.frame.origin.y, 200, _imge.frame.size.height) ;
        }
        if (_imge.frame.size.height<200) {
             _imge.frame=CGRectMake(_imge.frame.origin.x, _imge.frame.origin.y, _imge.frame.size.width,200) ;
        }
    }
}
@end
