//
//  TCTSDK.h
//  TCTSDK
//
//  Created by 曹晓琦 on 2018/4/23.
//  Copyright © 2018年 TCT. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "TCTBasicModel.h"
@interface TCTSDK : NSObject

/**
 *  登录成功回调
 *
 */
@property (nonatomic,copy) void (^loginSuccessBlock)(void);
/**
 *  上线回调
 *
 */
@property (nonatomic,copy) void (^onLineSuccessBlock)(void);

/**
 *  支付回调
 *
 */
typedef void (^payResultsBlock)(id value);


/*
 * 头像
 */
@property (nonatomic, copy)   NSString * avatar;
/*
 * 名字
 */
@property (nonatomic, copy)   NSString * nickname;
/*
 * 用户id
 */
@property (nonatomic, copy)   NSString * idStr;


/*
 * SDK状态
 */
@property (nonatomic, assign)  int  getStatus;

 /**
 *  返回 SDK 单例
 *
 *  @return SDK 单例
 */

+ (TCTSDK *) sharedInstance;


/**
 *  注册SDK
 *
 *  @param appKey  appKey 对应管理后台分配的appkey
 *  @param secretKey secretKey  对应管理后台分配的secretKey
  *  @param online  online  是否使用线上地址，YES 是使用  NO不使用
 */
- (void)registerAppKey:(NSString *)appKey appSecretKey:(NSString *)secretKey withOnline:(BOOL)online;

//登陆
- (void)login;

/**
 *  获取广告信息
 */

- (void)requestadvert;
/**
 *  下线
 */

- (void)loginOut;
/**
 *  上线
 */
- (void)online;

/**
 *  记录游戏得分
 *  @param score  score 分数
 */
- (void)requestGameScore:(float)score;

//记录游戏数据

- (void)requestGameDataKey:(NSString *)key withSoce:(float)score;



/**
 *    自定义广告
 *    @param str  str 邀请码
 *    @param type  type  请传 2
 */

- (void)diversionsAction:(NSString *)str withType:(NSInteger)type;


/**
 *    游戏内消费
 *    @param amount  amount 金额
 *    @param content  content 内容  如："充值400个钻石，消费0.8元"
 */

- (void)requestGamePayAmount:(float)amount withontent:(NSString *)content complete:(payResultsBlock)resultsHandler;


//- (void)requestGamePayAmount:(float)amount withontent:(NSString *)content success:(paySuccessBlock)successHandler failure:(payFialBlock) fialHandler;
@end
