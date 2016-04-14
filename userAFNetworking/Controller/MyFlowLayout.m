//
//  MyFlowLayout.m
//  WaterFlowLearn
//
//  Created by 蔡欣东 on 16/4/13.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "MyFlowLayout.h"

#define MyCollectionW self.collectionView.frame.size.width

/** 每一行之间的间距 */
static const CGFloat RowSpacing = 1;
/** 每一列之间的间距 */
static const CGFloat ColumnSpacing = 1;
/** 每一列之间的间距 top, left, bottom, right */
static const UIEdgeInsets MyContentInset = {0,0,0,0};
/** 默认的列数 */
static const int ColumnCount = 3;

@interface MyFlowLayout()
/** 每一列的最大Y值 */
@property (nonatomic, strong) NSMutableArray *columnMaxYs;
/** 存放所有cell的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;
@end


@implementation MyFlowLayout



#pragma mark - 懒加载
- (NSMutableArray *)columnMaxYs
{
    if (!_columnMaxYs) {
        _columnMaxYs = [[NSMutableArray alloc] init];
    }
    return _columnMaxYs;
}

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}

/**
 * 决定了collectionView的contentSize
 */
- (CGSize)collectionViewContentSize
{
    // 找出最长那一列的最大Y值
    CGFloat destMaxY = [self.columnMaxYs[0] doubleValue];
    for (NSUInteger i = 1; i<self.columnMaxYs.count; i++) {
        // 取出第i列的最大Y值
        CGFloat columnMaxY = [self.columnMaxYs[i] doubleValue];
        
        // 找出数组中的最大值
        if (destMaxY < columnMaxY) {
            destMaxY = columnMaxY;
        }
    }
    return CGSizeMake(0, destMaxY + MyContentInset.bottom);
}

- (void)prepareLayout
{
    [super prepareLayout];
    NSLog(@"prepareLayout");
    // 重置每一列的最大Y值
    [self.columnMaxYs removeAllObjects];
    for (NSUInteger i = 0; i<ColumnCount; i++) {
        [self.columnMaxYs addObject:@(MyContentInset.top)];
    }
    
    // 计算所有cell的布局属性
    [self.attrsArray removeAllObjects];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSUInteger i = 0; i < count; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

/**
 * 说明所有元素（比如cell、补充控件、装饰控件）的布局属性
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

/**
 * 说明cell的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    /** 计算indexPath位置cell的布局属性 */
    
    // 水平方向上的总间距
    CGFloat xMargin = MyContentInset.left + MyContentInset.right + (ColumnCount - 1) * ColumnSpacing;
    // cell的宽度
    CGFloat w = (MyCollectionW - xMargin) / ColumnCount;
    // cell的高度，测试数据，随机数
    CGFloat h = 50 + arc4random_uniform(150);
    
    // 找出最短那一列的 列号 和 最大Y值
    CGFloat currentColumnMaxY = [self.columnMaxYs[0] doubleValue];
    NSUInteger currentColumn = 0;
    for (NSUInteger i = 1; i<self.columnMaxYs.count; i++) {
        // 取出第i列的最大Y值
        CGFloat columnMaxY = [self.columnMaxYs[i] doubleValue];
        
        // 找出数组中的最小值
        if (currentColumnMaxY > columnMaxY) {
            currentColumnMaxY = columnMaxY;
            currentColumn = i;
        }
    }
    
    // cell的x值
    CGFloat x = MyContentInset.left + currentColumn * (w + ColumnSpacing);
    // cell的y值
    CGFloat y = currentColumnMaxY + RowSpacing;
    // cell的frame
    attrs.frame = CGRectMake(x, y, w, h);
    
    // 更新数组中的最大Y值
    self.columnMaxYs[currentColumn] = @(CGRectGetMaxY(attrs.frame));
    
    return attrs;
}
@end
