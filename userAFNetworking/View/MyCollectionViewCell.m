//
//  MyCollectionViewCell.m
//  userAFNetworking
//
//  Created by 蔡欣东 on 16/3/10.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "MyCollectionViewCell.h"

@interface MyCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *image;


@end

@implementation MyCollectionViewCell

- (void)awakeFromNib {
    
    // Initialization code
}


-(void)showUIWithModel:(id)model{
    if ([model isMemberOfClass:[PhotoModel class]]) {
        PhotoModel* newModel = (PhotoModel*)model;
        [_image setImageWithURL:[NSURL URLWithString:newModel.imgUrl]];
    }
}
@end
