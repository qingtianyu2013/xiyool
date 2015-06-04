//
//  registerViewController.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/6.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "RegisterViewController.h"
#import "All.h"
#import "RegisterAction/Register.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password2;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *mystore;

@end

@implementation RegisterViewController
{
    NSString *store;
    UIImageView *imge;
}

- (void)viewDidLoad
{

    store=@"0";
    [super viewDidLoad];
    imge=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"auth_follow_cb_unc"]];
    imge.frame=CGRectMake(0, 0, _mystore.frame.size.height, _mystore.frame.size.height);
    [_mystore addSubview:imge];
    [_password setSecureTextEntry:YES];
    [_password2 setSecureTextEntry:YES];
    // Do any additional setup after loading the view.
}
- (IBAction)Mystoreclick:(id)sender {
    if (store==nil ||[store isEqualToString:@"0"]) {
        imge.image=[UIImage imageNamed:@"auth_follow_cb_chd"];
        store=@"1";
    }else
    {
    imge.image=[UIImage imageNamed:@"auth_follow_cb_unc"];
        store=@"0";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)JK:(id)sender
{
    if ([_password.text isEqualToString:_password2.text]==false) {
        [WKAlertView showAlertViewWithStyle:WKAlertViewStyleFail title:@"注册失败" detail:@"确认密码不相同!" canleButtonTitle:nil okButtonTitle:@"确定" callBlock:^(MyWindowClick buttonIndex){
            
            [WKAlertView shared].hidden=YES;
            WKAlertView *alert=[WKAlertView shared];
            alert=nil;
        }];
       
    }else if ([_password.text isEqualToString:@""]) {
        [WKAlertView showAlertViewWithStyle:WKAlertViewStyleFail title:@"注册失败" detail:@"请输入密码!" canleButtonTitle:nil okButtonTitle:@"确定" callBlock:^(MyWindowClick buttonIndex){
            
            [WKAlertView shared].hidden=YES;
            WKAlertView *alert=[WKAlertView shared];
            alert=nil;
        }];
        
    }
    else if ([_username.text isEqualToString:@""]) {
        [WKAlertView showAlertViewWithStyle:WKAlertViewStyleFail title:@"注册失败" detail:@"请输入账号!" canleButtonTitle:nil okButtonTitle:@"确定" callBlock:^(MyWindowClick buttonIndex){
            
            [WKAlertView shared].hidden=YES;
            WKAlertView *alert=[WKAlertView shared];
            alert=nil;
        }];
        
    }
    else{
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"提示                                        为了建立您的家人朋友圈,我们需要您的通讯录,但是注意,为了保护您的隐私,防止泄露,我们的APP会将您和家人朋友的手机号码转换为虚拟ID,建立关系圈,其次,我们的APP禁止调用手机号码及与之对应的真实姓名." message:nil delegate:self cancelButtonTitle:@"同意" otherButtonTitles:@"拒绝", nil];
    al.delegate=self;
    [al show];
    }

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_username resignFirstResponder];
    [_password resignFirstResponder];
    [_password2 resignFirstResponder];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
      
        if (_username.text.length != 11) {
           [WKAlertView showAlertViewWithStyle:WKAlertViewStyleFail title:@"注册失败" detail:@"请输入正确的手机号!" canleButtonTitle:nil okButtonTitle:@"确定" callBlock:^(MyWindowClick buttonIndex){
                
                [WKAlertView shared].hidden=YES;
                WKAlertView *alert=[WKAlertView shared];
                alert=nil;
            }];
            
            
            return;
        }
        if (_password.text.length < 8) {
           [WKAlertView showAlertViewWithStyle:WKAlertViewStyleFail title:@"注册失败" detail:@"密码应该在8位以上!" canleButtonTitle:nil okButtonTitle:@"确定" callBlock:^(MyWindowClick buttonIndex){
               
               [WKAlertView shared].hidden = YES;
                WKAlertView *alert=[WKAlertView shared];
               alert = nil;
            }];
            return;
        }
       [WKAlertView showAlertViewWithStyle:WKAlertViewStyleLoading title:@"注册中..." detail:nil canleButtonTitle:nil okButtonTitle:nil callBlock:^(MyWindowClick buttonIndex) {
            
        }];
        [Register RegisterActionUsername:_username.text Password:_password.text Store:store Block:^(){
            Data *udt=[Data sharedController];
            //udt.msg
      
          
            if ([udt.status isEqualToNumber:@1])
            {
                [action MainRuningCallBack:^(){
                    [WKAlertView showAlertViewWithStyle:WKAlertViewStyleSuccess title:@"注册成功" detail:nil canleButtonTitle:nil okButtonTitle:@"确定" callBlock:^(MyWindowClick buttonIndex){
                        
                        [WKAlertView shared].hidden=YES;
                        WKAlertView *alert=[WKAlertView shared];
                        alert=nil;
                    }];
                }];
            }
            else
            {
                [action MainRuningCallBack:^(){
                  [WKAlertView showAlertViewWithStyle:WKAlertViewStyleFail title:@"注册失败" detail:udt.msg canleButtonTitle:nil okButtonTitle:@"确定" callBlock:^(MyWindowClick buttonIndex){
                        [WKAlertView shared].hidden=YES;
                        WKAlertView *alert=[WKAlertView shared];
                        alert=nil;
                    }];
                }];
            }
            //udt.status
            
        }];
    }
   
}
@end
