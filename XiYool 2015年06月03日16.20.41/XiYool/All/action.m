//
//  action.m
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/4.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import "action.h"
#import "Util4MD5.h"
#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import "Data.h"
#import "CJSONDeserializer.h"
#import "Constant.h"
#import "HTTP.h"

#pragma mark action功能方法
@implementation action

#pragma mark AES算法
+(NSString *)AESandBase64NSString:(NSString *)string KEY:(NSString *)key
{
    NSData *data=[string dataUsingEncoding:NSUTF8StringEncoding];
    data=[data AES256EncryptWithKey:key];
    NSString *restr=[data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return restr;
    
}

#pragma mark 未知
+(void)CollectionActionUserID:(NSString *)UserID StoreID:(NSString *)StoreID Block:(void(^)())Block
{
    NSString *body=[NSString stringWithFormat:@"userid=%@&storeid=%@",UserID,StoreID];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_URL,_COLLECTIONURL]];//url地址
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init ];
    [request setURL:url];//设置URL
    [request setHTTPMethod:@"POST"];//设置访问方式POST/GET
    [request setTimeoutInterval:60];//设置超时
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];//给提交参数进行UTF8编码
    //[request setValue:(NSString *) forHTTPHeaderField:(NSString *)]//设置协议头
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //连接成功后调用的block
        //data为网页返回数据
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding]);
        if(Block){
            Block();
        }
    }];
}
+(void)DeleteCollectionActionUserID:(NSString *)UserID StoreID:(NSString *)StoreID Block:(void(^)())Block
{
    NSString *body=[NSString stringWithFormat:@"userid=%@&storeid=%@",UserID,StoreID];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_URL,_DELETTCOLLECTIONURL]];//url地址
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init ];
    [request setURL:url];//设置URL
    [request setHTTPMethod:@"POST"];//设置访问方式POST/GET
    [request setTimeoutInterval:60];//设置超时
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];//给提交参数进行UTF8编码
    //[request setValue:(NSString *) forHTTPHeaderField:(NSString *)]//设置协议头
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //连接成功后调用的block
        //data为网页返回数据
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding]);
        if(Block){
            Block();
        }
    }];
}
+(void)GetCollectionActionStoreID:(NSString *)StoreID  Block:(void(^)())Block
{
    NSString *body=[NSString stringWithFormat:@"storeid=%@",StoreID];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_URL,_GETCOLLECTIONURL]];//url地址
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init ];
    [request setURL:url];//设置URL
    [request setHTTPMethod:@"POST"];//设置访问方式POST/GET
    [request setTimeoutInterval:60];//设置超时
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];//给提交参数进行UTF8编码
    //[request setValue:(NSString *) forHTTPHeaderField:(NSString *)]//设置协议头
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //连接成功后调用的block
        //data为网页返回数据
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding]);
        if(Block){
            Block();
        }
    }];
}
//获取通讯录
+(NSString *)GetBookCreate
{
    //取得本地通信录名柄
    //取得本地通信录名柄
    ABAddressBookRef tmpAddressBook = nil;
    tmpAddressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    ABAddressBookRequestAccessWithCompletion(tmpAddressBook, ^(bool greanted, CFErrorRef error){
        dispatch_semaphore_signal(sema);
    });
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    //取得本地所有联系人记录
    if (tmpAddressBook == nil) {
        return nil;
    };
    NSArray *tmpPeoples = (__bridge NSArray*)ABAddressBookCopyArrayOfAllPeople(tmpAddressBook);
    NSMutableString *Booklist=[[NSMutableString alloc]init];
    for(id tmpPerson in tmpPeoples)
    {
        //获取的联系人单一属性:Generic phone number
        ABMultiValueRef tmpPhones = ABRecordCopyValue(CFBridgingRetain(tmpPerson), kABPersonPhoneProperty);
        for(NSInteger j = 0; j < ABMultiValueGetCount(tmpPhones); j++)
        {
            NSString* tmpPhoneIndex = (NSString*)CFBridgingRelease(ABMultiValueCopyValueAtIndex(tmpPhones, j));
            tmpPhoneIndex = [tmpPhoneIndex stringByReplacingOccurrencesOfString:@" " withString:@""];
            tmpPhoneIndex = [tmpPhoneIndex stringByReplacingOccurrencesOfString:@"(" withString:@""];
            tmpPhoneIndex = [tmpPhoneIndex stringByReplacingOccurrencesOfString:@")" withString:@""];
            tmpPhoneIndex = [tmpPhoneIndex stringByReplacingOccurrencesOfString:@"-" withString:@""];
            tmpPhoneIndex = [tmpPhoneIndex stringByReplacingOccurrencesOfString:@" " withString:@""];
            if (tmpPhoneIndex.length>1) {
                 NSString *PhoneMD5=[tmpPhoneIndex MD516];
                 [Booklist appendFormat:@",\"%@\"",PhoneMD5 ] ;
            }
        }
        
    }
    [Booklist deleteCharactersInRange:NSMakeRange(0, 1)];
    Booklist=[NSMutableString stringWithFormat:@"[%@",Booklist];
    [Booklist appendString:@"]"];
    return  Booklist;
}
+(void)TestSel:(void (^)()) hander
{
    hander ();
}
//商店搜索
+(void)StoreSearchActionUserID:(NSString *)UserID Block:(void(^)())Block
{
    NSString *body=[NSString stringWithFormat:@"userId=%@",UserID];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_URL,_STORESEARCHURL]];//url地址
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init ];
    [request setURL:url];//设置URL
    [request setHTTPMethod:@"POST"];//设置访问方式POST/GET
    [request setTimeoutInterval:60];//设置超时
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];//给提交参数进行UTF8编码
    //[request setValue:(NSString *) forHTTPHeaderField:(NSString *)]//设置协议头
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSError *error;
        NSDictionary *backdt=[[CJSONDeserializer deserializer]deserialize:data error:&error];
        NSNumber *s_status=[backdt objectForKey:@"status"];
        //连接成功后调用的block
        if ([s_status isEqualToNumber:@1]) {
            [Data sharedController].dicmsg=[backdt objectForKey:@"msg"];
        }else
        {
        }
        if(Block){
            Block();
        }
    }];
  
}
//商店创建
+(void)StoreCreateActionInsertUser:(NSString *)InsertUser StoreName:(NSString *)StoreName StoreCategory:(NSString *)StoreCategory StoreAddress:(NSString *)StoreAddress StoreInstruction:(NSString *)StoreInstruction StoreTelephone:(NSString *)StoreTelephone FileIcon:(UIImage *)FileIcon Block:(void(^)())Block
{
    //192.168.0.106:8080/xiyoolcollection/storeCreate.action?insertUser=402862814cf8ad14014cf8b1efb50000&storeName=vailin&storeCategory=123123&storeAddress=宇宙无敌店铺&storeInstruction=我不知道&storeTelephone=15261633082
    NSString *url=[NSString stringWithFormat:@"%@%@",_URL,_STORECREATEURL];//url
    NSMutableDictionary *dic1=[[NSMutableDictionary alloc]init];
    [dic1 setObject:InsertUser forKey:@"insertUser"];
    [dic1 setObject:StoreName forKey:@"storeName"];
    [dic1 setObject:StoreCategory forKey:@"storeCategory"];
    [dic1 setObject:StoreAddress forKey:@"storeAddress"];
    [dic1 setObject:StoreInstruction forKey:@"storeInstruction"];
    [dic1 setObject:StoreTelephone forKey:@"storeTelephone"];
    NSMutableDictionary *dic2=[[NSMutableDictionary alloc]init];
    [dic2 setObject:FileIcon forKey:@"fileIcon"];
    [HTTP PostImagesToServer:url dicPostValue:dic1 dicImages:dic2 Block:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSError *error;
        NSDictionary *backdt=[[CJSONDeserializer deserializer]deserialize:data error:&error];
        Data *udt=[Data sharedController];
        if (backdt != nil) {
            udt.msg=[backdt objectForKey:@"msg"];
            udt.status=[backdt objectForKey:@"status"];
        }else{
            udt.msg=@"未知错误";
            udt.status=@0;
        }
        if (Block) {
            Block();
        }
    }];
}
+(void)MainRuningCallBack:(void(^)())block
{
    dispatch_sync(dispatch_get_main_queue(),^{
        block();
    });
}

//上传通讯录
+(void)GetCommunicationList:(NSString *)communicationList UsetId:(NSString *)userId Block:(void(^)())Block{
    NSString *body=[NSString stringWithFormat:@"userId=%@&communicationList=%@",userId,communicationList];
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",_URL,_SaveCommunicationURL]];//url地址
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init ];
    [request setURL:url];//设置URL
    [request setHTTPMethod:@"POST"];//设置访问方式POST/GET
    [request setTimeoutInterval:60];//设置超时
    [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];//给提交参数进行UTF8编码
    //[request setValue:(NSString *) forHTTPHeaderField:(NSString *)]//设置协议头
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //连接成功后调用的block
        //data为网页返回数据
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding]);
        if(Block){
            Block();
        }
    }];
}


@end
