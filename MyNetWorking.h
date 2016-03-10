//
//  MyNetWorking.h
//  userAFNetworking
//
//  Created by 蔡欣东 on 16/3/10.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MyNetWorking : NSObject

+(void)GETTWith:(NSString*)url withParams:(NSDictionary*)params completeWithSuccess:(SUCCESSBLOCK) successBlock failwithFailBlock:(FAILBLOCK)failBlock withErrorBlock:(ERRORBLOCK)errorBlock;


+(void)POSTWith:(NSString*)url withParams:(NSDictionary*)params completeWithSuccess:(SUCCESSBLOCK) successBlock failwithFailBlock:(FAILBLOCK)failBlock withErrorBlock:(ERRORBLOCK)errorBlock;

@end
