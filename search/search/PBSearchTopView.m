//
//  PBSearchTopView.m
//  search
//
//  Created by Playboy on 2018/6/7.
//  Copyright © 2018年 Playboy. All rights reserved.
//

#import "PBSearchTopView.h"

@implementation PBSearchTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configer];
    }
    return self;
}

- (void)configer {
    self.backgroundColor = [UIColor redColor];
}

@end
