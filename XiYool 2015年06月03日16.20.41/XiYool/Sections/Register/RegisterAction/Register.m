//
//  Register.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/20.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "Register.h"
#import "Data.h"
#import "Util4MD5.h"
#import "Constant.h"
#import "CJSONDeserializer.h"

@implementation Register
#pragma mark 注册
+(void)RegisterActionUsername:(NSString *)username Password:(NSString *)password Store:(NSString *)store Block:(void(^)())Block
{
    NSString *usernameAES=[self AESandBase64NSString:username KEY:_KEY];
    NSString *usernameMD5=[username MD5Long:8];
    NSString *passwordAES=[self AESandBase64NSString:password KEY:usernameMD5];
    
    NSString *body=[NSString stringWithFormat:@"register_name=%@&register_password=%@&role=%@",usernameAES,passwordAES,store];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_URL,_registerURL]];//url地址
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init ];
    [request setURL:url];//设置URL
    [request setHTTPMethod:@"POST"];//设置访问方式POST/GET
    [request setTimeoutInterval:60];//设置超时
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];//给提交参数进行UTF8编码
    //[request setValue:(NSString *) forHTTPHeaderField:(NSString *)]//设置协议头
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //NSLog(@"%@",connectionError);
        //连接成功后调用的block
        //data为网页返回数据
        NSError *error;
        Data *udt=[Data sharedController];
        NSDictionary *backdt=[[CJSONDeserializer deserializer]deserialize:data error:&error];
        if(backdt==nil)
        {
            udt.msg=@"未知错误";
            udt.status=@0;
        }else{
            udt.msg=[backdt objectForKey:@"msg"];
            udt.status=[backdt objectForKey:@"status"];
        }
        if(Block){
            Block();
        }
    }];
}
+(NSString *)AESandBase64NSString:(NSString *)string KEY:(NSString *)key
{
    NSData *data=[string dataUsingEncoding:NSUTF8StringEncoding];
    data=[data AES256EncryptWithKey:key];
    NSString *restr=[data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return restr;
    
}

@end
