//
//  PBSearchCollectionViewCell.m
//  search
//
//  Created by Playboy on 2018/6/7.
//  Copyright © 2018年 Playboy. All rights reserved.
//

#import "PBSearchCollectionViewCell.h"
#import "Masonry.h"

@interface PBSearchCollectionViewCell ()

@property (nonatomic, strong) UILabel   *label;

@end

@implementation PBSearchCollectionViewCell

- (void)drawRect:(CGRect)rect {
}

- (void)refreshWithString:(NSString *)str {
    self.label.text = str;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
        _label.font = [UIFont systemFontOfSize:13];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = [UIColor grayColor];
        _label.textColor = [UIColor blackColor];
        [self.contentView addSubview:_label];
    }
    return _label;
}

@end
