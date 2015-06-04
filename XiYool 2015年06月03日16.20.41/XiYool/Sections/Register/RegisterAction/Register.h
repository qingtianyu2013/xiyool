//
//  Register.h
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/20.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Register : NSObject
//注册方法
+(void)RegisterActionUsername:(NSString *)username Password:(NSString *)password Store:(NSString *)store Block:(void(^)())Block;
@end
