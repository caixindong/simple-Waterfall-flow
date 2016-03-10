//
//  GetPototViewModel.m
//  userAFNetworking
//
//  Created by 蔡欣东 on 16/3/10.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "GetPototViewModel.h"
#import "PhotoModel.h"
@implementation GetPototViewModel
-(void)getPhoto{
    NSString* url = @"https://api.500px.com/v1/photos";
    NSDictionary* params = @{@"consumer_key":@"HY6QFDF3znsN7zPwCVpYzvSNISMYrIlPhrUqwvcR"};
    [MyNetWorking GETTWith:url withParams:params completeWithSuccess:^(id returnData) {
        PhotoModel* model = [[PhotoModel alloc]init];
        NSArray* photos = [model getDataFromDict:returnData];
        
        self.successBlock(photos);
    } failwithFailBlock:^{
        
    } withErrorBlock:^(id errorCode) {
        
    }];
}
@end
