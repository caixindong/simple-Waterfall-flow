//
//  BaseViewModel.m
//  userAFNetworking
//
//  Created by 蔡欣东 on 16/3/10.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

-(void)setSuccessBlock:(SUCCESSBLOCK)successBlock withError:(ERRORBLOCK)errorBlock withFail:(FAILBLOCK)failBlock{
    _successBlock = successBlock;
    _errorBlock = errorBlock;
    _failBlock = failBlock;
}
@end
