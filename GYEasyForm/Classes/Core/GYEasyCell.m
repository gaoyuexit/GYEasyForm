//
//  GYEasyCell.m
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import "GYEasyCell.h"

@interface GYEasyCell()

@end

@implementation GYEasyCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.layoutMargins = UIEdgeInsetsZero;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (self.selectionStyle == UITableViewCellSelectionStyleNone || self.row.selectionColor == nil) { return; }
    
    UIView *selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = self.row.selectionColor;
    self.selectedBackgroundView = selectedView;
}

- (void)prepare {
    [self.contentView addSubview:self.separatorLine];
    UIEdgeInsets separatorLineInset = self.row.separatorLineInset;
    self.separatorLine.backgroundColor = self.row.separatorLineColor;
    self.separatorLine.hidden = self.row.hiddenSeparatorLine;
    self.selectionStyle = self.row.selectionStyle;
    self.separatorLine.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraints:@[
                                       [NSLayoutConstraint constraintWithItem:self.separatorLine attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:separatorLineInset.left],
                                       [NSLayoutConstraint constraintWithItem:self.separatorLine attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-separatorLineInset.right],
                                        [NSLayoutConstraint constraintWithItem:self.separatorLine attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-separatorLineInset.bottom],
                                       [NSLayoutConstraint constraintWithItem:self.separatorLine attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:1.0/UIScreen.mainScreen.scale]
                                       ]];
}

- (void)update{}
- (void)customUpdate{}

#pragma mark --- Setter && Getter
- (UIView *)separatorLine {
    if (!_separatorLine) {
        _separatorLine = [[UIView alloc] init];
    }
    return _separatorLine;
}

@end
