//
//  GYEasyFormViewController.m
//  GYEasyForm_Example
//
//  Created by apple on 2018/12/25.
//  Copyright © 2018 gaoyuexit. All rights reserved.
//

#import "GYEasyFormViewController.h"

@interface GYEasyFormViewController ()

@end

@implementation GYEasyFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.formView];
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.formView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:self.formView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:self.formView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:self.formView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]
                                ]];
}

- (GYEasyFormView *)formView {
    if (!_formView) {
        _formView = [[GYEasyFormView alloc] init];
        _formView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _formView;
}


@end
