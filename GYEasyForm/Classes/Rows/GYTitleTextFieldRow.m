//
//  GYTitleTextFieldRow.m
//  EasyForm
//
//  Created by apple on 2018/12/13.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import "GYTitleTextFieldRow.h"

@implementation GYTitleTextFieldCell

- (void)prepare {
    [super prepare];
    GYTitleTextFieldRow *row = self.row;
    
    self.titleLabel.text = row.title;
    self.remarkLabel.text = row.remark;
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.remarkLabel];
    
    BOOL hasRemark = self.remarkLabel.text.length > 0;
    
    NSLayoutConstraint *labelLeftLayout = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                       attribute:NSLayoutAttributeLeft
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.contentView
                                                                       attribute:NSLayoutAttributeLeft
                                                                      multiplier:1 constant:row.titleInsets.left];
    NSLayoutConstraint *labelRightLayout = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                        attribute:NSLayoutAttributeRight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.contentView
                                                                        attribute:NSLayoutAttributeRight
                                                                       multiplier:1 constant:-row.titleInsets.right];
    NSLayoutConstraint *labelCenterYLayout = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.contentView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1 constant:0];
    NSLayoutConstraint *fieldLeftLayout = [NSLayoutConstraint constraintWithItem:self.textField
                                                                       attribute:NSLayoutAttributeLeft
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:self.contentView
                                                                       attribute:NSLayoutAttributeLeft
                                                                      multiplier:1 constant:row.contentInsets.left];
    NSLayoutConstraint *fieldRightLayout = [NSLayoutConstraint constraintWithItem:self.textField
                                                                        attribute:NSLayoutAttributeRight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:(hasRemark ? self.remarkLabel : self.contentView)
                                                                        attribute:(hasRemark ? NSLayoutAttributeLeft : NSLayoutAttributeRight)
                                                                       multiplier:1 constant:-row.contentInsets.right];
    NSLayoutConstraint *fieldCenterYLayout =  [NSLayoutConstraint constraintWithItem:self.textField
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.contentView
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier:1 constant:0];
    NSLayoutConstraint *fieldHeightLayout =  [NSLayoutConstraint constraintWithItem:self.textField
                                                                          attribute:NSLayoutAttributeHeight
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.contentView
                                                                          attribute:NSLayoutAttributeHeight
                                                                         multiplier:1 constant:0];
    NSLayoutConstraint *remarkCenterYLayout = [NSLayoutConstraint constraintWithItem:self.remarkLabel
                                                                           attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.contentView
                                                                           attribute:NSLayoutAttributeCenterY
                                                                          multiplier:1 constant:0];
    NSLayoutConstraint *remarkRightLayout = [NSLayoutConstraint constraintWithItem:self.remarkLabel
                                                                         attribute:NSLayoutAttributeRight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.contentView
                                                                         attribute:NSLayoutAttributeRight
                                                                        multiplier:1 constant:-row.remarkInsets.right];
    [self.contentView addConstraints:@[labelLeftLayout, labelRightLayout, labelCenterYLayout,
                                       fieldLeftLayout, fieldRightLayout, fieldCenterYLayout, fieldHeightLayout,
                                       remarkCenterYLayout, remarkRightLayout]];
}

- (void)update {
    [super update];
    GYTitleTextFieldRow *row = self.row;
    self.titleLabel.text = row.title;
    self.remarkLabel.text = row.remark;
}

#pragma mark -- Setter && Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _titleLabel;
}

- (UILabel *)remarkLabel {
    if (!_remarkLabel) {
        _remarkLabel = [[UILabel alloc] init];
        _remarkLabel.font = [UIFont systemFontOfSize:14];
        _remarkLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        _remarkLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [_remarkLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_remarkLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _remarkLabel;
}

@end


@implementation GYTitleTextFieldRow

- (Class)associatedCellClass {
    return [GYTitleTextFieldCell class];
}

- (instancetype)init {
    if (self = [super init]) {
        _titleInsets = UIEdgeInsetsMake(0, 20, 0, 20);
        _contentInsets = UIEdgeInsetsMake(0, 115, 0, 10);
        _remarkInsets = UIEdgeInsetsMake(0, 0, 0, 15);
        
        self.contentAlignment = NSTextAlignmentRight;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


@end
