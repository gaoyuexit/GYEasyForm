//
//  GYNormalTitleRow.m
//  EasyForm
//
//  Created by apple on 2018/12/13.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import "GYNormalTitleRow.h"

@implementation GYNormalTitleCell


- (void)prepare{
    [super prepare];
    GYNormalTitleRow *row = self.row;
    
    self.iconView.image = row.icon;
    self.titleLabel.text = row.title;
    self.textField.text = row.content;
    self.textField.textAlignment = row.contentAlignment;
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:row.placeholder attributes:@{
                                                                                                                   NSFontAttributeName: self.textField.font,
                                                                                                                   NSForegroundColorAttributeName: row.placeholderColor
                                                                                                                   }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.textField];
    [self.contentView addSubview:self.iconView];
    
    BOOL hasIcon = self.iconView.image != nil;
    
    [self.contentView addConstraints:@[
                                       [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:row.titleInsets.left],
                                       [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-row.titleInsets.right],
                                       [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                       
                                       
                                       [NSLayoutConstraint constraintWithItem:self.iconView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:-row.iconInsets.right],
                                       [NSLayoutConstraint constraintWithItem:self.iconView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],

                                       [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:row.contentInsets.left],
                                       [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem: (hasIcon ? self.iconView : self.contentView) attribute:(hasIcon ? NSLayoutAttributeLeft : NSLayoutAttributeRight) multiplier:1 constant:-row.contentInsets.right],
                                       [NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
                                       ]];
}

- (void)update{
    [super update];
    GYNormalTitleRow *row = self.row;
    self.iconView.image = row.icon;
    self.titleLabel.text = row.title;
    self.textField.text = row.content;
}

#pragma mark -- Setter && Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _titleLabel;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor clearColor];
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        _textField.enabled = NO;
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _textField;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.translatesAutoresizingMaskIntoConstraints = NO;
        [_iconView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    }
    return _iconView;
}

@end


@implementation GYNormalTitleRow

- (Class)associatedCellClass {
    return [GYNormalTitleCell class];
}

- (instancetype)init {
    if (self = [super init]) {
        _titleInsets = UIEdgeInsetsMake(0, 20, 0, 20);
        _contentInsets = UIEdgeInsetsMake(0, 100, 0, 10);
        _iconInsets = UIEdgeInsetsMake(0, 0, 0, 15);
        _placeholder = @"";
        _placeholderColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        _contentAlignment = NSTextAlignmentRight;
        NSURL *bundleUrl = [[NSBundle bundleForClass:[GYNormalTitleRow class]] URLForResource:@"Rows" withExtension:@"bundle"];
        _icon = [UIImage imageNamed:@"form_right_icon" inBundle:[NSBundle bundleWithURL:bundleUrl] compatibleWithTraitCollection:nil];
    }
    return self;
}


@end
