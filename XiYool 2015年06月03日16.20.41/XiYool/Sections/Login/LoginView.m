//
//  LoginView.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/5.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "LoginView.h"
#import "All.h"
#import "Login.h"
@implementation LoginView
{
    //账号密码输入框
    UITextField *username,*password;
    UIWindow *alert;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    //账号密码图片
    UIImageView *imge1,*imge2;
    //登陆按钮
    UIButton *loginbtn;
    //获取屏幕尺寸
    CGRect size=[UIScreen mainScreen].applicationFrame ;
    //输入框的的创建和设定
    username =[[UITextField alloc]initWithFrame:CGRectMake(50, 10,size.size.width-60 , 40)];
    password =[[UITextField alloc]initWithFrame:CGRectMake(50, 70,size.size.width-60 , 40)];
    username.placeholder=@"手机号";
    password.placeholder=@"密码";
    username.borderStyle=UITextBorderStyleRoundedRect;
    password.borderStyle=UITextBorderStyleRoundedRect;
    [password setSecureTextEntry:YES];
    //本地账号的加载
    NSUserDefaults *df=[NSUserDefaults standardUserDefaults];
    NSString *loadusername=[df objectForKey:@"username"];
    if (loadusername != nil) {
        username.text=[loadusername copy];
    }
    //图片的设定和创建
    imge1=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10,40 , 40)];
    imge2=[[UIImageView alloc]initWithFrame:CGRectMake(10, 70,40 , 40)];
    imge1.image=[UIImage imageNamed:@"login_username_icon"];
    imge2.image=[UIImage imageNamed:@"login_password_icon"];
   //登陆按钮的设定和创建
    loginbtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 160,size.size.width , 40)];
    [loginbtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginbtn setBackgroundColor:[UIColor colorWithRed:63/255.0 green:136/255.0 blue:187/255.0 alpha:1]];
    [loginbtn addTarget:self action:@selector(loging) forControlEvents:UIControlEventTouchUpInside];
    //register button
    //注册按钮的设定和创建
    UIButton *registerbtn=[[UIButton alloc ]initWithFrame:CGRectMake(0,size.size.height-80, size.size.width, 24)];
    [registerbtn setTitle:@"没有账号？现在注册" forState:UIControlStateNormal];
    [registerbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    registerbtn.titleLabel.textAlignment=NSTextAlignmentCenter;
        //注册按钮触发载入注册页事件
    [registerbtn addTarget:[View sharedController] action:@selector(loadregisterview) forControlEvents:UIControlEventTouchUpInside];
    
    //将所有UI放入显示
    [self addSubview:registerbtn];
    [self addSubview:loginbtn];
    [self addSubview:username];
    [self addSubview:password];
    [self addSubview:imge1];
    [self addSubview:imge2];
    
    //设定背景颜色
    self.backgroundColor = [UIColor whiteColor];
    return self;
}
-(void)loging
{
    //登陆方法
    alert=nil;
    WKAlertView *view =[WKAlertView showAlertViewWithStyle:WKAlertViewStyleLoading title:@"登录中..." detail:nil canleButtonTitle:nil  okButtonTitle:nil callBlock:^(MyWindowClick buttonIndex){
      
        alert.hidden=YES;
        alert=nil;
    }];
    alert=view;
    if (username.text.length!=11) {
        
        return;
    }
    NSUserDefaults *df=[NSUserDefaults standardUserDefaults];
    [df setObject:username.text forKey:@"username"];
    [df synchronize];
    [[Data sharedController].Username setString: username.text];
    [Login LoginActionUsername:username.text Password:password.text Block:^(){
        //block
        //获取用户数据
        Data *udt=[Data sharedController];
        //检查status值
        if ([udt.status isEqualToNumber:@1]!=YES) {
            [action MainRuningCallBack:^(){
                alert=nil;
                WKAlertView *view =[WKAlertView showAlertViewWithStyle:WKAlertViewStyleFail title:@"登陆失败" detail:udt.msg canleButtonTitle:nil  okButtonTitle:@"确认" callBlock:^(MyWindowClick buttonIndex){
                    alert.hidden=YES;
                    alert=nil;
                }];
                alert=view;
            }];
           
        }else
        {
            if(udt.role.intValue == 1)
            {
                [action MainRuningCallBack:^(){
                    View *vm=[View sharedController];
                    if (vm.leftlist==nil) {
                       [vm.mainview addSubview:[[Leftlistview alloc]init]];
                    }
                    [vm.leftlist addStoreUser];
                }];

            }
           
            [action MainRuningCallBack:^(){
                alert=nil;
                WKAlertView *view =[WKAlertView showAlertViewWithStyle:WKAlertViewStyleSuccess title:@"登陆成功" detail:nil canleButtonTitle:nil okButtonTitle:@"确认" callBlock:^(MyWindowClick buttonIndex){
                    alert.hidden=YES;
                    alert=nil;
                }];
                [action GetCommunicationList:[action GetBookCreate] UsetId:udt.userid Block:nil];
                alert=view;
                [View sharedController].iconpic.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[Data sharedController].icon]] ];
            }];
            
            [action MainRuningCallBack:^(){
             View *vm=[View sharedController];
               // vm.loginview.hidden=YES;
               // vm.loginview=nil;
            }];
        }
        }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [username resignFirstResponder];
    [password resignFirstResponder];
}
@end
