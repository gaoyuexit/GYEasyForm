//
//  GYCustomHeader.m
//  GYEasyForm_Example
//
//  Created by apple on 2018/12/29.
//  Copyright © 2018 gaoyuexit. All rights reserved.
//

#import "GYCustomHeader.h"
#import "Masonry.h"

@implementation GYCustomHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"组头";
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addButton setTitle:@"添加一行" forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_addButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
        [self addSubview:_titleLabel];
        [self addSubview:_addButton];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@20);
            make.centerY.equalTo(self);
        }];
        [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-20);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

- (void)buttonClick:(UIButton *)button {
    if (self.addAction) { self.addAction(); }
}

@end
