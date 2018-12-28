//
//  GYEasyFormProtocol.h
//  EasyForm
//
//  Created by apple on 2018/11/7.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol GYTaggable <NSObject>
@property (nonatomic, copy) NSString *tag;
@end


@protocol GYValueable <NSObject>
@property (nonatomic, strong) id value;
@end


@protocol GYRowAssociatedCellable <NSObject>
@required
- (Class)associatedCellClass;
@end


@protocol GYRowConformance <GYRowAssociatedCellable>
/**分割线的颜色*/
@property (nonatomic, strong) UIColor *separatorLineColor;
/**分割线separatorInsets*/
@property (nonatomic, assign) UIEdgeInsets separatorLineInset;
/**隐藏分割线*/
@property (nonatomic, assign) BOOL hiddenSeparatorLine;
/**selectionColor*/
@property (nonatomic, strong) UIColor *selectionColor;
/**UITableViewCellSelectionStyle*/
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;
@end


@protocol GYInputRowConformace <GYRowConformance>
@property (nonatomic, assign) BOOL secureInput; //是否显示密码样式
@property (nonatomic, copy, nullable) NSString *content;
@property (nonatomic, strong) UIFont *contentFont;
@property (nonatomic, strong) UIColor *contentColor;
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, assign) UIKeyboardType keyboardType;
@property (nonatomic, assign) NSTextAlignment contentAlignment;
@property (nonatomic, copy) void(^onTextChange)(id<UITextInput> input);
@property (nonatomic, copy) void(^onFirstResponserChange)(BOOL isFirstResponser);
@end


@protocol GYButtonRowConformace <GYRowConformance>
@property (nonatomic, assign) UIEdgeInsets buttonInsets;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *enableTitleColor;
@property (nonatomic, strong) UIColor *disableTitleColor;
@property (nonatomic, strong, nullable) UIImage *enableBackgroundImage;
@property (nonatomic, strong, nullable) UIImage *disableBackgroundImage;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, copy) void(^onClick)(UIButton *button);

@end


NS_ASSUME_NONNULL_END
