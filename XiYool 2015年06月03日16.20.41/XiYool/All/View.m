//
//  View.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/4.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "View.h"
#import "HeadView.h"
#import "LoginView.h"
#import "registerViewController.h"
#import "WKAlertView.h"
@implementation View
static View *sharemode = nil;
+(View *)sharedController{
    @synchronized(self){
        if(sharemode == nil){
            sharemode = [[self alloc] init] ;
        }
    }
    return sharemode;
}
#pragma mark 加载左侧菜单列
-(void)loadleftlist
{
    if (_leftlist==nil) {
        [_mainview addSubview:[[Leftlistview alloc]init]];
    }
    int moveint;
    if (_leftlist.frame.origin.x>=0) {
        moveint=0-_leftlist.frame.size.width;
    }else
    {
        moveint=0;
    }
    [_mainview bringSubviewToFront:_leftlist];
//动画开始
    [UIView beginAnimations:nil context:nil];
//    动画时间
    [UIView setAnimationDuration:0.5f];

    CGRect frame=CGRectMake(moveint, _leftlist.frame.origin.y, _leftlist.frame.size.width, _leftlist.frame.size.height);
    _leftlist.frame=frame;
    
//    动画结束
    [UIView commitAnimations];
}
#pragma mark 加载显示头
-(void)loadHeadview
{
    if (_Headview==nil) {
        CGRect frame=[UIScreen mainScreen].applicationFrame;
        _Headview = [[HeadView alloc]initWithFrame:CGRectMake(0, 20,frame.size.width, 30)];
        [_mainview addSubview:_Headview];
    }
    [_mainview bringSubviewToFront:_Headview];
}
#pragma mark 加载登陆页
-(void)loadLoginviewcontroller
{
    if (_loginview == nil) {
        CGRect frame=[UIScreen mainScreen].applicationFrame;
        _loginview=[[LoginView alloc]initWithFrame:CGRectMake(0, 50, frame.size.width, frame.size.height)];
    
    }
    [_mainview  addSubview:_loginview];
    [_mainview bringSubviewToFront:_loginview];
}
#pragma mark 加载注册页
-(void)loadregisterview
{
    if(_registerview==nil)
    {
        @try {
            UIStoryboard *main=[UIStoryboard storyboardWithName:@"ragister" bundle:nil];
            RegisterViewController *viewcontroller=[main instantiateViewControllerWithIdentifier:@"registerview"];
            viewcontroller.view.frame=_frame;
            _registerview=viewcontroller;
        }
        @catch (NSException *exception) {
            NSLog(@"%@",exception);
            [WKAlertView showAlertViewWithStyle:WKAlertViewStyleFail title:@"页面加载失败" detail:exception.reason canleButtonTitle:nil okButtonTitle:@"取消" callBlock:^(MyWindowClick buttonIndex) {
                WKAlertView *alter=[WKAlertView shared];
                alter.hidden=YES;
                alter=nil;
            }];
        }
    }
    [_mainview addSubview:_registerview.view];
    [_mainview bringSubviewToFront:_registerview.view];
}
#pragma mark 加载注册页
-(void)LoadNewStore
{
    if(_registerview==nil)
    {
        @try {
            UIStoryboard *main=[UIStoryboard storyboardWithName:@"newstore" bundle:nil];
            UIViewController *viewcontroller=[main instantiateViewControllerWithIdentifier:@"NewStore"];
            viewcontroller.view.frame=_frame;
            _NewStoreViewController=viewcontroller;
        }
        @catch (NSException *exception) {
            NSLog(@"%@",exception);
        }
    }
    [_mainview addSubview:_NewStoreViewController.view];
    [_mainview bringSubviewToFront:_NewStoreViewController.view];
}
#pragma mark 加载我的商店
-(void)LoadMyStore
{
    _MyStoreViewController=nil;
    if(_MyStoreViewController==nil)
    {
        @try {
            UIStoryboard *main=[UIStoryboard storyboardWithName:@"MyStore" bundle:nil];
            UIViewController *viewcontroller=[main instantiateViewControllerWithIdentifier:@"MyStore"];
            viewcontroller.view.frame=_frame;
            _MyStoreViewController=viewcontroller;
        }
        @catch (NSException *exception) {
            NSLog(@"%@",exception);
        }
    }
    [_mainview addSubview:_MyStoreViewController.view];
    [_mainview bringSubviewToFront:_MyStoreViewController.view];
}
#pragma mark 加载我的商店
-(void)LoadMyStoreload
{

        @try {
            UIStoryboard *main=[UIStoryboard storyboardWithName:@"MyStore" bundle:nil];
            UIViewController *viewcontroller=[main instantiateViewControllerWithIdentifier:@"storeload"];
            CGRect frame=[UIScreen mainScreen].applicationFrame;
            frame.origin.y=50;
            frame.size.height=  frame.size.height-40;
            viewcontroller.view.frame =frame;
            [_mainview addSubview:viewcontroller.view];
            [_mainview bringSubviewToFront:viewcontroller.view];
        }
        @catch (NSException *exception) {
            NSLog(@"%@",exception);
        }

}
#pragma mark 加载创建活动实例
-(void)LoadNewActivity
{
    @try {
        UIStoryboard *main=[UIStoryboard storyboardWithName:@"NewActivity" bundle:nil];
        UIViewController *viewcontroller=[main instantiateViewControllerWithIdentifier:@"NewActivity"];
        CGRect frame=[UIScreen mainScreen].applicationFrame;
        frame.origin.y=50;
        frame.size.height=  frame.size.height-40;
        viewcontroller.view.frame =frame;
        [_mainview addSubview:viewcontroller.view];
        [_mainview bringSubviewToFront:viewcontroller.view];
        _NewActivity=viewcontroller;
       // [_maincontroller.navigationController pushViewController:viewcontroller animated:YES];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    
}
#pragma mark 加载图片剪辑
-(void)LoadPhotoChoose
{
            UIStoryboard *main=[UIStoryboard storyboardWithName:@"PhotoChoose" bundle:nil];
            UIViewController *photoview=[main instantiateViewControllerWithIdentifier:@"photochange"];
            _Photochoosecontroller=photoview;
            [_maincontroller.navigationController pushViewController:photoview animated:YES];
}
#pragma mark 相册功能
//打开相册
-(void)openPhotoLibrary
{
    UIImagePickerController *picker=[[UIImagePickerController alloc] init];
    picker.delegate=self;
    //前后摄像机
    //picker.cameraDevice=UIImagePickerControllerCameraDeviceFront;
    picker.allowsEditing=YES;
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    [_maincontroller presentViewController:picker animated:YES completion:nil];
}
//相册 选中图片代理
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    _photopic = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self LoadPhotoChoose];
}
@end
