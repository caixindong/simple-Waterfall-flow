//
//  BaseViewModel.h
//  userAFNetworking
//
//  Created by 蔡欣东 on 16/3/10.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject

@property(nonatomic,strong)SUCCESSBLOCK successBlock;
@property(nonatomic,strong)FAILBLOCK failBlock;
@property(nonatomic,strong)ERRORBLOCK errorBlock;

-(void)setSuccessBlock:(SUCCESSBLOCK)successBlock
             withError:(ERRORBLOCK) errorBlock
              withFail:(FAILBLOCK) failBlock;


@end
