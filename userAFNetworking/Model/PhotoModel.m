//
//  PhotoModel.m
//  userAFNetworking
//
//  Created by 蔡欣东 on 16/3/10.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "PhotoModel.h"

@implementation PhotoModel

-(NSArray *)getDataFromDict:(NSDictionary *)dict{
    NSArray* photos = dict[@"photos"];
    NSMutableArray* photoArr = [NSMutableArray arrayWithCapacity:20];
    for (NSDictionary* infoDict in photos) {
        PhotoModel* model = [[PhotoModel alloc]init];

        model.imgUrl = infoDict[@"image_url"];
        NSLog(@"img url is %@",infoDict[@"image_url"]);
        [photoArr addObject:model];
    }
    return photoArr;
}

@end
