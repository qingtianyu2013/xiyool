//
//  MystoreloadController.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/27.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "MystoreloadController.h"
#import "Data.h"
@interface MystoreloadController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconimge;
@property (weak, nonatomic) IBOutlet UILabel *storename;
@property (weak, nonatomic) IBOutlet UILabel *storejianjie;
@property (weak, nonatomic) IBOutlet UILabel *storeadress;
@property (weak, nonatomic) IBOutlet UILabel *storephone;


@end

@implementation MystoreloadController

- (void)viewDidLoad {
    [super viewDidLoad];
    Data *udt=[Data sharedController];
    _storeadress.text=[udt.dicmsg objectForKey:@"address"];
    _storejianjie.text=[udt.dicmsg objectForKey:@"category"];
    _storename.text=[udt.dicmsg objectForKey:@"name"];
    _storephone.text=[udt.dicmsg objectForKey:@"tel"];
    _iconimge.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[udt.dicmsg objectForKey:@"icon"]]]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
