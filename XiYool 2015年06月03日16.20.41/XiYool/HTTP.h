//
//  HTTP.h
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/29.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HTTP : NSObject
+(void)PostImagesToServer:(NSString *)strUrl dicPostValue:(NSMutableDictionary *)params dicImages:(NSMutableDictionary *)dicImages Block:(void(^)(NSURLResponse *response, NSData *data, NSError *connectionError))Block;
@end
