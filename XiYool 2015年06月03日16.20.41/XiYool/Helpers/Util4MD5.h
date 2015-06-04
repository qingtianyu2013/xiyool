//
//  Util4MD5.h
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/20.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSData(Util4MD5)
- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;
@end
@interface NSString (action)
-(NSString *)MD5Long:(int)md5long;
-(NSString *)MD532;
-(NSString *)MD516;
@end
