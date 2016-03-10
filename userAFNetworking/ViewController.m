//
//  ViewController.m
//  userAFNetworking
//
//  Created by 蔡欣东 on 16/3/10.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "ViewController.h"
#import "GetPototViewModel.h"
#import "MyCollectionViewCell.h"


@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property(nonatomic,strong)NSArray* dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    [_myCollectionView registerNib:[UINib nibWithNibName:CELLID bundle:nil] forCellWithReuseIdentifier:CELLID];
    
    GetPototViewModel* viewModel = [[GetPototViewModel alloc]init];
    [viewModel setSuccessBlock:^(id returnData) {
        _dataArr = (NSArray*)returnData;
        [_myCollectionView reloadData];
    } withError:^(id errorCode) {
        
    } withFail:^{
        
    }];
    [viewModel getPhoto];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELLID forIndexPath:indexPath];
    [cell showUIWithModel:_dataArr[indexPath.row]];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width  = [UIScreen mainScreen].bounds.size.width;
    CGFloat sizeW = (width-10*4)/2;
    return  CGSizeMake(sizeW, sizeW);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
