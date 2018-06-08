//
//  PBSearchCell.m
//  search
//
//  Created by Playboy on 2018/6/7.
//  Copyright © 2018年 Playboy. All rights reserved.
//

#import "PBSearchCell.h"
#import "PBCustomCollectionView.h"


@interface PBSearchCell ()
@property (nonatomic, strong) PBCustomCollectionView *collectView;
@end

@implementation PBSearchCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)drawRect:(CGRect)rect {
    [self configureView];
}

- (void)configureView {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 200, 40)];
    label.text = @"大家都在搜";
    label.font = [UIFont systemFontOfSize:24];
    [self.contentView addSubview:label];
    [self.contentView addSubview:self.collectView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (PBCustomCollectionView *)collectView {
    if (!_collectView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectView = [[PBCustomCollectionView alloc] initWithFrame:CGRectMake(0, 80, self.frame.size.width, 200) collectionViewLayout:layout];
    }
    return _collectView;
}


@end
