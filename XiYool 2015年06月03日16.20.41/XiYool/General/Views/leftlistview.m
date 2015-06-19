//
//  leftlistview.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/4.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "Leftlistview.h"
#import "All.h"
static int _WIDTH=200;
@implementation Leftlistview
{

    NSArray *cellheight;
    NSMutableArray *cellary;
    UITableView *tableview;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)init
{
//   获取设备尺寸创建控件
    CGRect size=[UIScreen mainScreen].applicationFrame;
    CGRect frame=CGRectMake(-size.size.height ,20,size.size.width ,size.size.height );
    self=[super initWithFrame:frame];
    //背景按钮
    UIButton *backgroundbtn=[[UIButton alloc]initWithFrame:size];
    [backgroundbtn addTarget:[View sharedController] action:@selector(loadleftlist) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backgroundbtn];
    
    //存入全局
    View *view=[View sharedController];
    view.leftlist=self;
    [self dataload];
//    创建tableview
    frame.origin.x=0;
    frame.origin.y=0;
    frame.size.width=_WIDTH;
    tableview=[[UITableView alloc]initWithFrame:frame];
    tableview.delegate=self;
    tableview.dataSource=self;
    tableview.separatorStyle=NO;
    [self addSubview:tableview];
    return self;
}
-(void)dataload
{
    //独立的登陆cell
    //登陆cell不同于其他cell所以独立制作
    cellary =[[NSMutableArray alloc]init];
    //登陆cell中的图片view
    UITableViewCell *logincell=[[UITableViewCell alloc]init];
    UIImageView *imge=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 180, 180)];
    imge.image=[UIImage imageNamed:@"menu_login_icon"];
    imge.layer.masksToBounds = YES;
    [View sharedController].iconpic=imge;
    [logincell addSubview:imge];
    //登陆cell中的昵称标签
    UILabel *logintitle=[[UILabel alloc]initWithFrame:CGRectMake(0, 190, 200, 20)];
    View *view=[View sharedController];
    view.leftlistUserNameLabel = logintitle;
     Data *udt=[Data sharedController];
    logintitle.text=udt.Username;
    if ([udt.Username isEqualToString:@""]) {
        [udt.Username setString:@"请登录"];
    }
    logintitle.textAlignment=NSTextAlignmentCenter;
    [logincell addSubview:logintitle];
    
    [cellary addObject:logincell];
    //定义菜单内容
    titlestr=[[NSArray alloc]initWithObjects:@"我的收藏",@"分享纪录",@"喜哟分享", nil];
    picary=[[NSArray alloc]initWithObjects:@"menu_share_favourite",@"menu_share_history",@"menu_pengyouquan", nil];
    cellheight=[[NSArray alloc]initWithObjects:@230,@25,@25,@25, nil];
    //生成同用cell并存入数组
    for (int key=0;key<titlestr.count ;key++) {
        UITableViewCell *cell=[[UITableViewCell alloc]init];
        cell.imageView.image=[UIImage imageNamed:picary[key]];
        cell.textLabel.text=titlestr[key];
        [cellary addObject:cell];
    }
}
-(void)addStoreUser
{
    //独立的登陆cell
    //登陆cell不同于其他cell所以独立制作
    cellary =[[NSMutableArray alloc]init];
    //登陆cell中的图片view
    UITableViewCell *logincell=[[UITableViewCell alloc]init];
    UIImageView *imge=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 180, 180)];
    imge.image=[UIImage imageNamed:@"menu_login_icon"];
     [View sharedController].iconpic=imge;
    [logincell addSubview:imge];
    //登陆cell中的昵称标签
    UILabel *logintitle=[[UILabel alloc]initWithFrame:CGRectMake(0, 190, 200, 20)];
    Data *udt=[Data sharedController];
    if ([udt.Username isEqualToString:@""]) {
        [udt.Username setString:@"请登录"];
    }
    logintitle.textAlignment=NSTextAlignmentCenter;
   
    [logincell addSubview:logintitle];
    [cellary addObject:logincell];
    //定义菜单内容
    titlestr=[[NSArray alloc]initWithObjects:@"我的收藏",@"分享纪录",@"喜哟分享",@"我的店铺",@"活动管理", nil];
    picary=[[NSArray alloc]initWithObjects:@"menu_share_favourite",@"menu_share_history",@"menu_pengyouquan",@"menu_seller_store",@"menu_seller_activity", nil];
    cellheight=[[NSArray alloc]initWithObjects:@230,@30,@30,@30,@30,@30, nil];
    //生成同用cell并存入数组
    for (int key=0;key<titlestr.count ;key++) {
        UITableViewCell *cell=[[UITableViewCell alloc]init];
        cell.imageView.image=[UIImage imageNamed:picary[key]];
        cell.textLabel.text=titlestr[key];
        [cellary addObject:cell];
    }
    [tableview reloadData];

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //点击用户cell
  if (indexPath.row == 0)
  {
      [[View sharedController] loadLoginviewcontroller];
      [[View sharedController]loadleftlist];
      NSLog(@"loadview");
  }else if(indexPath.row == 1)
  {
      [[View sharedController] LoadNewActivity];
      [[View sharedController]loadleftlist];
  }else if(indexPath.row == 2)
  {
      [[View sharedController] LoadMyStore];
      [[View sharedController]loadleftlist];
  }
  else if(indexPath.row == 3)
  {
      [[View sharedController] LoadNewActivity];
      [[View sharedController]loadleftlist];
  }
  else if(indexPath.row == 4)
  {
      [[View sharedController] LoadMyStore];
      [[View sharedController]loadleftlist];
  }
  else if(indexPath.row == 5)
  {
      [[View sharedController] LoadNewActivity];
      [[View sharedController]loadleftlist];
  }
}
//tableview cell数量代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellary.count;
}
//tableview 获取cell代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellary[indexPath.row];
}
//tableview cell高度代理
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *db=cellheight[indexPath.row];
    return db.intValue;
}

@end
