//
//  NewActivity.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/27.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "NewActivity.h"
#import "AddDonHua.h"

@interface NewActivity ()

@end

@implementation NewActivity
{
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _cellary =[[NSMutableArray alloc]init];
     _cellheight =[[NSMutableArray alloc]init];
    UILabel *lable1;
    UIButton *button1;
    UITableViewCell *cell1;
    CGRect frame=[UIScreen mainScreen].applicationFrame;
    frame.origin.y=0;
    CGSize size=frame.size;
    _table=[[UITableView alloc]initWithFrame:frame];
    _table.delegate =self;
    _table.dataSource=self;
    _table.separatorStyle=NO;
    
    //参数设置
    int cellh=60;
    int PYx=2;
    int PXy=5;
    int LPYx=5;
    
    //活动名称标签创建
    cell1=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, size.width, cellh)];
    lable1=[[UILabel alloc]initWithFrame:CGRectMake(LPYx, 0, size.width, cellh)];
    lable1.text=@"活动名称" ;
    [cell1 addSubview:lable1];
    [cell1 addDHfangkuangFrame:CGRectMake(PYx, PXy, size.width-PYx*2, cellh-PXy*2) lineWidth:1 Color:[UIColor grayColor]];
    [_cellary addObject:cell1];
    [_cellheight addObject:[NSNumber numberWithInt:cellh]];
    
    //活动类别标签创建
    cell1=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, size.width, cellh)];
    lable1=[[UILabel alloc]initWithFrame:CGRectMake(LPYx, 0, size.width, cellh)];
    lable1.text=@"活动类别" ;
    [cell1 addSubview:lable1];
    [cell1 addDHfangkuangFrame:CGRectMake(PYx, PXy, size.width-PYx*2, cellh-PXy*2) lineWidth:1 Color:[UIColor grayColor]];
    [_cellary addObject:cell1];
    [_cellheight addObject:[NSNumber numberWithInt:cellh]];
    
    //开始时间标签创建
    cell1=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, size.width, cellh)];
    lable1=[[UILabel alloc]initWithFrame:CGRectMake(LPYx, 0, size.width, cellh)];
    lable1.text=@"开始时间" ;
    [cell1 addSubview:lable1];
    [cell1 addDHfangkuangFrame:CGRectMake(PYx, PXy, size.width-PYx*2, cellh-PXy*2) lineWidth:1 Color:[UIColor grayColor]];
    [_cellary addObject:cell1];
    [_cellheight addObject:[NSNumber numberWithInt:cellh]];
    
    //结束时间标签创建
    cell1=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, size.width, cellh)];
    lable1=[[UILabel alloc]initWithFrame:CGRectMake(LPYx, 0, size.width, cellh)];
    lable1.text=@"结束时间" ;
    [cell1 addSubview:lable1];
    [cell1 addDHfangkuangFrame:CGRectMake(PYx, PXy, size.width-PYx*2, cellh-PXy*2) lineWidth:1 Color:[UIColor grayColor]];
    [_cellary addObject:cell1];
    [_cellheight addObject:[NSNumber numberWithInt:cellh]];
    
    //添加活动图片按钮创建
    cell1=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, size.width, cellh)];
    button1 =[[UIButton alloc]initWithFrame:CGRectMake(size.width/10, cellh/10, size.width/10*8, cellh/10*8)];
    button1.layer.masksToBounds=YES;
    button1.layer.cornerRadius=5;
    [button1 setTitle:@"添加活动图片" forState:UIControlStateNormal];
    button1.backgroundColor=[UIColor colorWithRed:22.0/255 green:122.0/255 blue:255.0/255 alpha:1.0];
    [cell1 addSubview:button1];
    [_cellary addObject:cell1];
    [_cellheight addObject:[NSNumber numberWithInt:cellh]];
    
    //活动内容框创建
    cell1=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, size.width, cellh)];
    lable1=[[UILabel alloc]initWithFrame:CGRectMake(LPYx, 5, size.width, 25)];
    lable1.text=@"活动内容" ;
    [cell1 addSubview:lable1];
    [cell1 addDHfangkuangFrame:CGRectMake(PYx, PXy, size.width-PYx*2, cellh-PXy*2) lineWidth:1 Color:[UIColor grayColor]];
    [_cellary addObject:cell1];
    [_cellheight addObject:[NSNumber numberWithInt:cellh]];
    
    //保存按钮创建
    cell1=[[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, size.width, cellh)];
    button1 =[[UIButton alloc]initWithFrame:CGRectMake(size.width/10, cellh/10, size.width/10*8, cellh/10*8)];
    button1.layer.masksToBounds=YES;
    button1.layer.cornerRadius=5;
    [button1 setTitle:@"保存" forState:UIControlStateNormal];
    button1.backgroundColor=[UIColor colorWithRed:22.0/255 green:122.0/255 blue:255.0/255 alpha:1.0];
    [cell1 addSubview:button1];
    [_cellary addObject:cell1];
    [_cellheight addObject:[NSNumber numberWithInt:cellh]];

    
    
     [self.view addSubview:_table];
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
#pragma mark tableview
//用户点击cell
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//}
//tableview cell数量代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellary.count;
}
//tableview 获取cell代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= _cellary.count) {
        return [[UITableViewCell alloc]init];
    }
    return _cellary[indexPath.row];
}
//tableview cell高度代理
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSNumber *db=_cellheight[indexPath.row];
    return db.intValue;
}

@end
