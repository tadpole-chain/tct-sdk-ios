//
//  SDK.m
//  TCTSDKDome
//
//  Created by 曹晓琦 on 2018/5/9.
//  Copyright © 2018年 TCT. All rights reserved.
//

#import <TCTSDK/TCTSDK.h>

#if defined(__cplusplus)

extern "C"{
#endif
    
    
    
    void SDKLogin(char * scene,char * method){
 
        [[TCTSDK sharedInstance] login];
        //不转换在回调中无法取到值
        NSString * msgStr1  = [NSString stringWithUTF8String:scene];
        NSString * msgStr2  = [NSString stringWithUTF8String:method];
        
        [TCTSDK sharedInstance].loginSuccessBlock = ^{
            const char *sceneStr =   [msgStr1 UTF8String];
            const char *methodStr =   [msgStr2 UTF8String];
            UnitySendMessage(sceneStr, methodStr,"success");
        };
        
        
    }
    
    
    int SDKGetDate( )
    {
        
        return [TCTSDK sharedInstance].getStatus;
    }
    
    char *  SDKUserInfo(char * infoName)
    {
 
         NSString * msgStr1  = [NSString stringWithUTF8String:infoName];
        if ([msgStr1 isEqualToString:@"Id"]) {
       
            return strdup([[TCTSDK sharedInstance].idStr UTF8String]);
        }
        else if ([msgStr1 isEqualToString:@"Nickname"])
        {
          
            return strdup([[TCTSDK sharedInstance].nickname UTF8String]);
        }
        else
        {
          
            return strdup([[TCTSDK sharedInstance].avatar UTF8String]);
        }
 
   
    }
    
    void SDKLoginout(){
        
        [[TCTSDK sharedInstance] loginOut];
    }
    
    void SDKShop()
    {
        [[TCTSDK sharedInstance] requestadvert];
    }
    
    void SDKDiversions(char *msg)
    {
        NSString * msgStr  = [NSString stringWithUTF8String:msg];
        [[TCTSDK sharedInstance] diversionsAction:msgStr withType:2];
    }
    void SDKGameScore(float score)
    {
        [[TCTSDK sharedInstance]requestGameScore:score];
        
    }
    
    void SDKOnline(char* scene,char * method)
    {
        
        [[TCTSDK sharedInstance] online];
        
        NSString * msgStr1  = [NSString stringWithUTF8String:scene];
        NSString * msgStr2  = [NSString stringWithUTF8String:method];
        
        [TCTSDK sharedInstance].onLineSuccessBlock = ^{
            
            const char *sceneStr =   [msgStr1 UTF8String];
            const char *methodStr =   [msgStr2 UTF8String];
            
            
            UnitySendMessage(sceneStr, methodStr,"success");
        };
        
        
        
    }
    
    void SDKGameDataKey(char *key,float score)
    {
        NSString * keyStr  = [NSString stringWithUTF8String:key];
        [[TCTSDK sharedInstance]requestGameDataKey:keyStr withSoce:score];
    }
    
    
        void SDKPayAction(float amount,const char * content,const char * scene,const char * method)
        {
            NSString * contentStr  =  [NSString stringWithUTF8String:content];
            NSString * msgStr1  = [NSString stringWithUTF8String:scene];
            NSString * msgStr2  = [NSString stringWithUTF8String:method];
        
            [[TCTSDK sharedInstance]requestGamePayAmount:amount withontent: contentStr complete:^(id value) {
                
                const char *sceneStr =   [msgStr1 UTF8String];
                const char *methodStr =   [msgStr2 UTF8String];
                  NSData *data = [NSJSONSerialization dataWithJSONObject:value options:kNilOptions error:nil];
                  NSString *jsonString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                  const char* constStr = [jsonString UTF8String];
                UnitySendMessage(sceneStr, methodStr,constStr);
                
            }];
        }
    
}





