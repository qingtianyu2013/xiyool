//
//  Login.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/20.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "Login.h"
#import "Data.h"
#import "Util4MD5.h"
#import "Constant.h"
#import "CJSONDeserializer.h"
@implementation Login :NSObject
#pragma mark 登陆
+(void)LoginActionUsername:(NSString *)username Password:(NSString *)password Block:(void(^)())Block
{
    NSString *passwordMD5=[[username stringByAppendingString:password ] MD516];
    NSString *usernameAES=[self AESandBase64NSString:username  KEY:_KEY];
    NSString *body=[NSString stringWithFormat:@"login_name=%@&login_password=%@",usernameAES,passwordMD5];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_URL,_LOGINURL]];//url地址
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init ];
    [request setURL:url];//设置URL
    [request setHTTPMethod:@"POST"];//设置访问方式POST/GET
    [request setTimeoutInterval:15];//设置超时
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];//给提交参数进行UTF8编码
    //[request setValue:(NSString *) forHTTPHeaderField:(NSString *)]//设置协议头
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //连接成功后调用的block
        //data为网页返回数据
        NSError *error;
        Data *udt=[Data sharedController];
        NSDictionary *backdt=[[CJSONDeserializer deserializer]deserialize:data error:&error];
        //校验返回数据是否正确
        if (backdt) {
            udt.status=[backdt objectForKey:@"status"];
            //登陆是否
            if ([udt.status isEqualToNumber:@1]) {
                udt.role=[backdt objectForKey:@"role"];
                NSDictionary *msgdt=[backdt objectForKey:@"msg"];
                udt.userid=[msgdt objectForKey:@"userId"];
                udt.icon=[msgdt objectForKey:@"icon"];
                udt.storeid=[backdt objectForKey:@"storeId"];
                
            }else
            {
                //登陆失败写入错误原因!
                udt.msg=[backdt objectForKey:@"msg"];
            }
            
        }else{
            if (connectionError != nil) {
              NSString *erostr = [connectionError.userInfo objectForKey:@"NSLocalizedDescription"];
                udt.status=@0;
                if ([erostr isEqualToString:@"The request timed out."]) {
                    erostr=@"连接超时!";
                }
                udt.msg=erostr;
            }else{
            udt.status=@0;
            udt.msg=@"出现未知错误!";
            }
            }
        
        
        //block回调
        if(Block){
            Block();
        }
    }];
}
+(NSString *)AESandBase64NSString:(NSString *)string KEY:(NSString *)key
{
    NSData *data=[string dataUsingEncoding:NSUTF8StringEncoding];
    data=[data AES256EncryptWithKey:key];
    NSString *restr=[data base64EncodedStringWithOptions:NSDataBase64DecodingIgnoreUnknownCharacters];
    return restr;
    
}
@end
