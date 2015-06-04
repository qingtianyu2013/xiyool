//
//  newStoreViewController.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/11.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "NewStoreViewController.h"
#import "All.h"
@interface NewStoreViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UITextView *DPjj;
@property (weak, nonatomic) IBOutlet UITextField *dplb;
@property (weak, nonatomic) IBOutlet UITextField *dpmc;
@property (weak, nonatomic) IBOutlet UITextField *dpdz;
@property (weak, nonatomic) IBOutlet UITextField *lxdh;
@property (weak, nonatomic) IBOutlet UIButton *savebtn;
@property (weak, nonatomic) IBOutlet UIButton *icon;

@end

@implementation NewStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //给tablevie设置代理,通过代理方法获取每个加载的cell
    _tableview.delegate=self;
    _tableview.dataSource=self;

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //检查cell是否被画过框
    if (cell.tag==0) {
        if(indexPath.row==0)
        {
            [_DPjj addDHxiahuaxieSize:15 LineWidth:1 Color:[UIColor blackColor]];
            [_dpdz addDHxiahuaxieSize:10 LineWidth:1 Color:[UIColor blackColor]];
            [_dplb addDHxiahuaxieSize:10 LineWidth:1 Color:[UIColor blackColor]];
            [_dpmc addDHxiahuaxieSize:10 LineWidth:1 Color:[UIColor blackColor]];
            [_lxdh addDHxiahuaxieSize:10 LineWidth:1 Color:[UIColor blackColor]];
        }
        CGRect frame=[UIScreen mainScreen].applicationFrame;
        //获取cell实例的高度
        CGSize size = cell.frame.size;
        [cell addDHfangkuangFrame:CGRectMake(3, 3, frame.size.width-6, size.height-6) lineWidth:1 Color:[UIColor grayColor]];
        cell.tag=1;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
 
}
- (IBAction)getpic:(id)sender {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(picvchoose) name:@"PicChoose" object:nil];
    [[View sharedController]openPhotoLibrary];
}
-(void)picvchoose
{
    [_icon removeFromSuperview];
    UIImage *image= [View sharedController].photopic;
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _icon.frame.size.width, _icon.frame.size.height)];
    imageview.image=image;
    [_icon addSubview:imageview];
}
- (IBAction)updataforserver:(id)sender {
    [action StoreCreateActionInsertUser:[Data sharedController].userid StoreName:_dpmc.text StoreCategory:_DPjj.text StoreAddress:_dpdz.text StoreInstruction:nil StoreTelephone:nil FileIcon:[View sharedController].photopic Block:nil];
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
