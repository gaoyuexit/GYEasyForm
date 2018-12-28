//
//  GYEasyFormView.h
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GYEasyForm;
@interface GYEasyFormView : UIView

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) GYEasyForm *form;

@end

NS_ASSUME_NONNULL_END
