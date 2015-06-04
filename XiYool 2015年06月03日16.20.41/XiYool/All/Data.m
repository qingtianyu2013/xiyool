//
//  Data.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/4.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "Data.h"

@implementation Data
static Data *sharemode = nil;
+(Data *)sharedController{
    @synchronized(self){
        if(sharemode == nil){
            sharemode = [[self alloc] init] ;
        }
    }
    return sharemode;
}
-(NSMutableString *)Username
{
    if (_Username==nil) {
        _Username=[[NSMutableString alloc]initWithFormat:@""];
    }
    return _Username;
}
@end
