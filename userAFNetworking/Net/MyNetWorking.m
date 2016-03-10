//
//  MyNetWorking.m
//  userAFNetworking
//
//  Created by 蔡欣东 on 16/3/10.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "MyNetWorking.h"

@implementation MyNetWorking


+(void)GETTWith:(NSString *)url withParams:(NSDictionary *)params completeWithSuccess:(SUCCESSBLOCK)successBlock failwithFailBlock:(FAILBLOCK)failBlock withErrorBlock:(ERRORBLOCK)errorBlock{
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    

    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    
    
    AFHTTPRequestOperation* op = [manager GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"error is %@",error);
        NSLog(@"no net");
        if (failBlock) {
            failBlock();
        }
    }];
    [op start];
    

}

+(void)POSTWith:(NSString *)url withParams:(NSDictionary *)params completeWithSuccess:(SUCCESSBLOCK)successBlock failwithFailBlock:(FAILBLOCK)failBlock withErrorBlock:(ERRORBLOCK)errorBlock{
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    AFHTTPRequestOperation* op = [manager POST:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary* returnData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if (successBlock) {
            successBlock(returnData);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (failBlock) {
            failBlock();
        }
    } ];
    [op start];
}

@end
