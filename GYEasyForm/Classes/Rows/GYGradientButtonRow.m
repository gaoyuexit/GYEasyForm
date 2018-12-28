//
//  GYGradientButtonRow.m
//  ZGSellHouseModule
//
//  Created by apple on 2018/12/15.
//

#import "GYGradientButtonRow.h"


@implementation GYGradientButtonCell

- (void)prepare {
    [super prepare];
    
    GYGradientButtonRow *row = self.row;
    _gradientButton = [[GYEasyGradientButton alloc] init];
    _gradientButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self setupRowButton];
    [_gradientButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_gradientButton];
    
    [self.contentView addConstraints:@[
                                       [NSLayoutConstraint constraintWithItem:self.gradientButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:row.buttonInsets.left],
                                       [NSLayoutConstraint constraintWithItem:self.gradientButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-row.buttonInsets.right],
                                       [NSLayoutConstraint constraintWithItem:self.gradientButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:row.buttonInsets.top],
                                       [NSLayoutConstraint constraintWithItem:self.gradientButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-row.buttonInsets.bottom],
                                       ]];
    
}

- (void)setupRowButton {
    GYGradientButtonRow *row = self.row;
    _gradientButton.startPoint = row.startPoint;
    _gradientButton.endPoint = row.endPoint;
    _gradientButton.colors = row.colors;
    _gradientButton.locations = row.locations;
    _gradientButton.titleLabel.font = row.font;
    [_gradientButton setTitle:row.title forState:UIControlStateNormal];
    [_gradientButton setTitleColor:row.enableTitleColor forState:UIControlStateNormal];
    [_gradientButton setTitleColor:row.disableTitleColor forState:UIControlStateDisabled];
    [_gradientButton setBackgroundImage:row.enableBackgroundImage forState:UIControlStateNormal];
    [_gradientButton setBackgroundImage:row.disableBackgroundImage forState:UIControlStateDisabled];
    _gradientButton.layer.cornerRadius = row.cornerRadius;
    _gradientButton.layer.borderColor = row.borderColor.CGColor;
    _gradientButton.layer.borderWidth = row.borderWidth;
}

- (void)buttonClick:(GYEasyGradientButton *)button {
    GYGradientButtonRow *row = self.row;
    if (row.onClick) { row.onClick(button); }
}

- (void)update {
    [super update];
    [self setupRowButton];
}

@end

@implementation GYGradientButtonRow
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

- (Class)associatedCellClass { return [GYGradientButtonCell class]; }

- (instancetype)init {
    if (self = [super init]) {
        _startPoint = CGPointMake(0, 0);
        _endPoint = CGPointMake(1, 1);
        _colors = @[];
        _locations = @[@0, @1];
    
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
