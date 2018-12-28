//
//  GYViewController.m
//  GYEasyForm
//
//  Created by gaoyuexit on 12/25/2018.
//  Copyright (c) 2018 gaoyuexit. All rights reserved.
//

#import "GYViewController.h"

@interface GYViewController ()

@end

@implementation GYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"GYEasyForm";
    GYEasyForm *form = [[GYEasyForm alloc] init];
    GYEasySection *section = [[GYEasySection alloc] initWithHeaderHeight:10 headerBgColor:[UIColor groupTableViewBackgroundColor] footerHeight:0 footerBgColor:nil];
    GYNormalTitleRow *row1 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"第一行";
    }];
    GYNormalTitleRow *row2 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"第二行";
    }];
    GYNormalTitleRow *row3 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"第三行";
    }];
    GYNormalTitleRow *row4 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"第四行";
    }];
    
    [section appendRows:@[row1, row2, row3, row4]];
    [form appendSection:section];
    self.formView.form = form;
}

@end
