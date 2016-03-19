//
//  PhotoModel.h
//  userAFNetworking
//
//  Created by 蔡欣东 on 16/3/10.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoModel : NSObject
@property(nonatomic,strong)NSString* imgUrl;
@property(nonatomic,strong)NSString* name;

/**
 * 简析json数据
 **/
-(NSArray*)getDataFromDict:(NSDictionary*)dict;
@end
