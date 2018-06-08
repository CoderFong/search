//
//  PBCustomCollectionView.m
//  search
//
//  Created by Playboy on 2018/6/8.
//  Copyright © 2018年 Playboy. All rights reserved.
//

#import "PBCustomCollectionView.h"
#import "PBCustomLayout.h"
#import "PBSearchCollectionViewCell.h"

static NSString * const kPBSearchCollectionViewCell = @"PBSearchCollectionViewCell";

@interface PBCustomCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,PBCustomLayoutDelegate>

@property (nonatomic, strong) PBCustomLayout *layout;
@property (nonatomic, strong) NSArray *itemArray;

@end

@implementation PBCustomCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self setCollectionViewLayout:self.layout];
        [self registerClass:[PBSearchCollectionViewCell class] forCellWithReuseIdentifier:kPBSearchCollectionViewCell];
        self.backgroundColor = [UIColor whiteColor];
        
        self.itemArray = @[@"这就是街舞",@"无名",@"杨凯帅",@"肖杰牛逼",@"中国有嘻哈",@"创造101好看吗",@"世界杯",@"NBA",@"快乐大本营"];
        
    }
    return self;
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PBSearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPBSearchCollectionViewCell forIndexPath:indexPath];
    [cell refreshWithString:self.itemArray[indexPath.row]];
    return cell;
}
//// 设置每个item的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(80, 30);
//}
//
//// 设置每个item的间隔
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}
//
////设置每个item垂直间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    return 10;
//}

#pragma mark - PBCustomLayoutDelegate
- (CGSize)customFlowLayout:(PBCustomLayout *)customFlowLayout heightForWidth:(CGFloat)width indexPath:(NSIndexPath *)indexPath{
    return [self getSize:self.itemArray[indexPath.row]];
}

- (CGSize)getSize:(NSString *)str{
    UIFont *font=[UIFont systemFontOfSize:13];
    NSDictionary *attrs=@{NSFontAttributeName:font};
    CGSize mySize=[str sizeWithAttributes:attrs];
    return mySize;
}

- (PBCustomLayout *)layout {
    if (!_layout) {
        _layout = [[PBCustomLayout alloc] init];
        _layout.rowMargin = 10;
        _layout.columnMargin = 20;
        _layout.delegate = self;
    }
    return _layout;
}

@end
