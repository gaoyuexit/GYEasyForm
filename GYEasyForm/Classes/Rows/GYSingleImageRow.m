//
//  GYSingleImageRow.m
//  ZGSellHouseModule
//
//  Created by apple on 2018/12/18.
//

#import "GYSingleImageRow.h"

@implementation GYSingleImageCell

- (void)prepare {
    [super prepare];
    GYSingleImageRow *row = self.row;
    _iconView = [[UIImageView alloc] init];
    _iconView.image = row.icon;
    _iconView.contentMode = row.contentMode;
    _iconView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_iconView];
    [self.contentView addConstraints:@[
                                       [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:row.iconInsets.left],
                                       [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-row.iconInsets.right],
                                       [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:row.iconInsets.top],
                                       [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-row.iconInsets.bottom],
                                       ]];
}

@end


@implementation GYSingleImageRow
- (Class)associatedCellClass { return [GYSingleImageCell class];  }

- (instancetype)init {
    if (self = [super init]) {
        self.hiddenSeparatorLine = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _iconInsets = UIEdgeInsetsZero;
        _contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}
@end
