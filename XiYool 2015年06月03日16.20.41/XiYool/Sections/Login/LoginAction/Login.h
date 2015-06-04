//
//  Login.h
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/20.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "action.h"
@interface Login : NSObject 
+(void)LoginActionUsername:(NSString *)username Password:(NSString *)password Block:(void(^)())Block;
@end
/*
 Public class user extends Object{
 
 }
 Public class superU implements user {
 
 }
*/