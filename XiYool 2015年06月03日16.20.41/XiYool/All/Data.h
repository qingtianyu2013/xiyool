//
//  Data.h
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/4.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject
@property(nonatomic,strong) NSMutableString *Username;

@property(nonatomic,strong) NSNumber *status;
@property(nonatomic,strong) NSNumber *role;
@property(nonatomic,strong) NSString *storeid;
@property(nonatomic,strong) NSString *userid;
@property(nonatomic,strong) NSString *msg;
@property(nonatomic,strong) NSString *icon;
@property(nonatomic,strong) NSDictionary *dicmsg;
+(Data *)sharedController;
@end
//store  storeid storeurl1