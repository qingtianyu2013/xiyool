//
//  action.h
//  XiYool
//
//  Created by 吴 菲菲 on 15/5/4.
//  Copyright (c) 2015年 dayou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface action : NSObject
//登陆方法
+(void)TestSel:(void (^)()) hander;

//收藏商铺信息
+(void)CollectionActionUserID:(NSString *)UserID StoreID:(NSString *)StoreID Block:(void(^)())Block;
//删除收藏
+(void)DeleteCollectionActionUserID:(NSString *)UserID StoreID:(NSString *)StoreID Block:(void(^)())Block;
//获取收藏
+(void)GetCollectionActionStoreID:(NSString *)StoreID  Block:(void(^)())Block;
//搜索自己的商铺
+(void)StoreSearchActionUserID:(NSString *)UserID Block:(void(^)())Block;
//商铺创建
+(void)StoreCreateActionInsertUser:(NSString *)InsertUser StoreName:(NSString *)StoreName StoreCategory:(NSString *)StoreCategory StoreAddress:(NSString *)StoreAddress StoreInstruction:(NSString *)StoreInstruction StoreTelephone:(NSString *)StoreTelephone FileIcon:(UIImage *)FileIcon Block:(void(^)())Block;
//获取通讯录
+(NSString *)GetBookCreate;
//主线程运行代码
+(void)MainRuningCallBack:(void(^)())block;
//上传通讯录
+(void)GetCommunicationList:(NSString *)communicationList UsetId:(NSString *)userId Block:(void(^)())Block;
@end
