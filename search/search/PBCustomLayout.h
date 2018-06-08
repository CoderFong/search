//
//  PBCustomLayout.h
//  search
//
//  Created by Playboy on 2018/6/8.
//  Copyright © 2018年 Playboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PBCustomLayout;
@protocol PBCustomLayoutDelegate <NSObject>

-(CGSize)customFlowLayout:(PBCustomLayout *) customFlowLayout
           heightForWidth:(CGFloat)width
             indexPath:(NSIndexPath *)indexPath;

@end

@interface PBCustomLayout : UICollectionViewLayout

@property (nonatomic)id<PBCustomLayoutDelegate>delegate;

// 每一列item的间距
@property (nonatomic, assign) CGFloat columnMargin;
// 每一行item间距
@property (nonatomic, assign) CGFloat rowMargin;

@end
