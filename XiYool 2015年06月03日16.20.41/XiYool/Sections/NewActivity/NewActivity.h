//
//  NewActivity.h
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/27.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewActivity : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) NSMutableArray  *cellary;
@property (nonatomic ,strong)NSMutableArray  *cellheight;
@property (nonatomic ,strong)UITableView *table;
@end
