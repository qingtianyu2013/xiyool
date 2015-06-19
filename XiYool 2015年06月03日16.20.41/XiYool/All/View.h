//
//  View.h
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/4.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Leftlistview.h"
@interface View : NSObject <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,assign)CGRect frame;
@property(nonatomic,strong)Leftlistview *leftlist;
@property(nonatomic,weak)UIViewController *maincontroller;
@property(nonatomic,strong)UIView *mainview;
@property(nonatomic,strong)UIView *Headview;
@property(nonatomic,strong)UIView *loginview;
@property(nonatomic,strong)UIViewController *registerview;
@property(nonatomic,strong)UIViewController *NewStoreViewController;
@property(nonatomic,strong)UIViewController *MyStoreViewController;
@property(nonatomic,strong)UIViewController *Photochoosecontroller;
@property(nonatomic,strong)UIViewController *NewActivity;
@property(nonatomic,strong)UIViewController *Mystoreload;

@property (nonatomic ,strong ) UIImage *photopic;

@property(nonatomic,weak)UILabel *leftlistUserNameLabel;

@property(nonatomic,strong)UIImageView *iconpic;
+(View *)sharedController;
-(void)loadleftlist;
-(void)loadHeadview;
-(void)loadLoginviewcontroller;
-(void)loadregisterview;
-(void)LoadNewStore;
-(void)LoadMyStore;
-(void)LoadMyStoreload;
-(void)LoadPhotoChoose;
-(void)LoadNewActivity;
-(void)openPhotoLibrary;
@end
