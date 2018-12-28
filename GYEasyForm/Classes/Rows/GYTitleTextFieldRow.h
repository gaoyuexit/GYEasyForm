//
//  GYTitleTextFieldRow.h
//  EasyForm
//
//  Created by apple on 2018/12/13.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import "GYEasyTextFieldRow.h"

NS_ASSUME_NONNULL_BEGIN

@interface GYTitleTextFieldCell : GYEasyTextFieldCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *remarkLabel;
@end


@interface GYTitleTextFieldRow : GYEasyTextFieldRow<GYTitleTextFieldCell *>
@property (nonatomic, assign) UIEdgeInsets titleInsets;         //标题
@property (nonatomic, assign) UIEdgeInsets contentInsets;       //内容
@property (nonatomic, assign) UIEdgeInsets remarkInsets;        //备注

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy, nullable) NSString *remark;

@end

NS_ASSUME_NONNULL_END
