//
//  GYNormalButtonRow.m
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import "GYNormalButtonRow.h"

@implementation GYNormalButtonCell

- (void)prepare {
    [super prepare];
    
    GYNormalButtonRow *row = self.row;
    _button = [[UIButton alloc] init];
    _button.translatesAutoresizingMaskIntoConstraints = NO;
    [self setupRowButton];
    [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_button];
    
    [self.contentView addConstraints:@[
                                       [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:row.buttonInsets.left],
                                       [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-row.buttonInsets.right],
                                       [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:row.buttonInsets.top],
                                       [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-row.buttonInsets.bottom],
                                       ]];
    
}

- (void)buttonClick:(UIButton *)button {
    GYNormalButtonRow *row = self.row;
    if (row.onClick) { row.onClick(button); }
}


- (void)setupRowButton {
    GYNormalButtonRow *row = self.row;
    _button.titleLabel.font = row.font;
    [_button setTitle:row.title forState:UIControlStateNormal];
    [_button setTitleColor:row.enableTitleColor forState:UIControlStateNormal];
    [_button setTitleColor:row.disableTitleColor forState:UIControlStateDisabled];
    [_button setBackgroundImage:row.enableBackgroundImage forState:UIControlStateNormal];
    [_button setBackgroundImage:row.disableBackgroundImage forState:UIControlStateDisabled];
    _button.layer.cornerRadius = row.cornerRadius;
    _button.layer.borderColor = row.borderColor.CGColor;
    _button.layer.borderWidth = row.borderWidth;
}

@end

@implementation GYNormalButtonRow
@synthesize buttonInsets = _buttonInsets;
@synthesize title = _title;
@synthesize font = _font;
@synthesize enableTitleColor = _enableTitleColor;
@synthesize disableTitleColor = _disableTitleColor;
@synthesize enableBackgroundImage = _enableBackgroundImage;
@synthesize disableBackgroundImage = _disableBackgroundImage;
@synthesize borderColor = _borderColor;
@synthesize borderWidth = _borderWidth;
@synthesize cornerRadius = _cornerRadius;
@synthesize onClick = _onClick;



- (Class)associatedCellClass { return [GYNormalButtonCell class]; }

- (instancetype)init {
    if (self = [super init]) {
        _buttonInsets = UIEdgeInsetsMake(0, 20, 0, 20);
        _font = [UIFont systemFontOfSize:15];
        _enableTitleColor = [UIColor whiteColor];
        _disableTitleColor = [UIColor whiteColor];
        _enableBackgroundImage = nil;
        _disableBackgroundImage = nil;
        _borderColor = [UIColor whiteColor];
        _borderWidth = 0;
        _cornerRadius = 1;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.hiddenSeparatorLine = YES;
    }
    return self;
}


@end
