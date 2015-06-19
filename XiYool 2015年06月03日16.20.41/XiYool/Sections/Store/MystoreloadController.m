//
//  MystoreloadController.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/27.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "MystoreloadController.h"
#import "Data.h"
#import "action.h"
#import "WKAlertView.h"
@interface MystoreloadController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconimge;
@property (weak, nonatomic) IBOutlet UILabel *storename;
@property (weak, nonatomic) IBOutlet UILabel *storejianjie;
@property (weak, nonatomic) IBOutlet UILabel *storeadress;
@property (weak, nonatomic) IBOutlet UILabel *storephone;
//@property (weak, nonatomic) IBOutlet UIButton *Deletestotr;
//- (IBAction)deleteStore:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *deletestore;


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
    [_deletestore addTarget:self action:@selector(deleteStore:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)deleteStore:(id)sender {
    WKAlertView *alert=[WKAlertView showAlertViewWithStyle:WKAlertViewStyleWaring title:@"是否删除当前店铺?" detail:nil canleButtonTitle:@"确认" okButtonTitle:@"取消" callBlock:^(MyWindowClick buttonIndex) {
        if (buttonIndex==MyWindowClickForCancel)
        { WKAlertView *alert=[WKAlertView showAlertViewWithStyle:WKAlertViewStyleLoading title:@"请稍后..." detail:nil canleButtonTitle:nil okButtonTitle:nil callBlock:^(MyWindowClick buttonIndex){
        }];
            
            [action StoreDeleteActionUserId:[Data sharedController].userid StoreID:[Data sharedController].storeid Block:^(){
                Data *udt=[Data sharedController];
                if ([udt.status isEqualToNumber:@1]) {
                    WKAlertView *alert=[WKAlertView showAlertViewWithStyle:WKAlertViewStyleFail title:@"删除成功" detail:udt.msg canleButtonTitle:@"确定" okButtonTitle:nil callBlock:^(MyWindowClick buttonIndex){
                        WKAlertView *alert=[WKAlertView shared];
                        alert.hidden=YES;
                        alert=nil;
                    }];
                }else
                {
                    WKAlertView *alert=[WKAlertView showAlertViewWithStyle:WKAlertViewStyleFail title:@"删除失败" detail:udt.msg canleButtonTitle:@"确定" okButtonTitle:nil callBlock:^(MyWindowClick buttonIndex){
                        WKAlertView *alert=[WKAlertView shared];
                        alert.hidden=YES;
                        alert=nil;
                    }];
                }
            }];
        }else
        {
            WKAlertView *alert=[WKAlertView shared];
            alert.hidden=YES;
            alert=nil;
        }
    }];
    

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
