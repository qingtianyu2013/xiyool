//
//  ViewController.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/4.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "ViewController.h"
#import "All.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    extern NSString *CTSettingCopyMyPhoneNumber();
    CGRect frame=[UIScreen mainScreen].applicationFrame;
    CGRect size=CGRectMake(0,50, frame.size.width, frame.size.height-40);
    [View sharedController].frame=size;
    [View sharedController].mainview=self.view;
    [View sharedController].maincontroller=self;
    [[View sharedController] loadHeadview];
    [[View sharedController] loadLoginviewcontroller];
    self.navigationController.navigationBar.hidden=YES;
    
  //  [action RegisterActionUsername:@"15261633082" Password:@"12345678" Store:@"1" Block:^(){}];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onload
{
    [[View sharedController] loadleftlist];
}
@end
