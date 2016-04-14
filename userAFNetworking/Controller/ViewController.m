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
#import "MyFlowLayout.h"
#import "DetailViewController.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property(nonatomic,strong)NSArray* dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"show";
    [_myCollectionView registerNib:[UINib nibWithNibName:CELLID bundle:nil] forCellWithReuseIdentifier:CELLID];
    
    _myCollectionView.collectionViewLayout = [[MyFlowLayout alloc]init];
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    vc.model = _dataArr[indexPath.item];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1,1);
    [UIView animateWithDuration:0.5 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
