//
//  GYViewController.m
//  GYEasyForm
//
//  Created by gaoyuexit on 12/25/2018.
//  Copyright (c) 2018 gaoyuexit. All rights reserved.
//

#import "GYViewController.h"
#import "GYNormalFormController.h"
#import "GYDynamicFormViewController.h"

@interface GYViewController ()

@end

@implementation GYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"GYEasyForm";
    
    __weak typeof(self)weakSelf = self;
    GYEasyForm *form = [[GYEasyForm alloc] init];
    GYEasySection *section = [[GYEasySection alloc] initWithHeaderHeight:10
                                                           headerBgColor:[UIColor groupTableViewBackgroundColor]
                                                            footerHeight:0
                                                           footerBgColor:nil];
    //first row
    GYNormalTitleRow *row1 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"Normal Form";
    }];
    row1.tap = ^(NSIndexPath * _Nonnull indexPath) {
        [weakSelf.navigationController pushViewController:[GYNormalFormController new] animated:YES];
    };
    
    //second row
    GYNormalTitleRow *row2 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"Dynamic";
    }];
    row2.tap = ^(NSIndexPath * _Nonnull indexPath) {
        [weakSelf.navigationController pushViewController:[GYDynamicFormViewController new] animated:YES];
    };
    
    //third row
    GYNormalTitleRow *row3 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"third line";
    }];
    
    //fourth row
    GYNormalTitleRow *row4 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"fourth line";
    }];
    
    [section appendRows:@[row1, row2, row3, row4]];
    [form appendSection:section];
    self.formView.form = form;
}

@end
