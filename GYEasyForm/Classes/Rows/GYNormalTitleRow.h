//
//  GYNormalTitleRow.h
//  EasyForm
//
//  Created by apple on 2018/12/13.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import "GYEasyRow.h"
#import "GYEasyCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface GYNormalTitleCell : GYEasyCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIImageView *iconView;
@end


@interface GYNormalTitleRow : GYEasyRow <GYNormalTitleCell *>

@property (nonatomic, assign) UIEdgeInsets titleInsets;         //标题
@property (nonatomic, assign) UIEdgeInsets contentInsets;       //内容
@property (nonatomic, assign) UIEdgeInsets iconInsets;          //accessoryView

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, assign) NSTextAlignment contentAlignment;
@property (nonatomic, strong, nullable) UIImage *icon;


@end

NS_ASSUME_NONNULL_END
