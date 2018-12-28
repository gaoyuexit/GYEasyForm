//
//  GYEasySection.h
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYEasyFormProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, GYSectionPart) {
    GYSectionPartHeader,
    GYSectionPartFooter
};

@class GYEasyRow, GYEasyForm, GYHeaderFooterView;

@interface GYEasySection<Header: __kindof UIView *, Footer: __kindof UIView *> : NSObject <GYTaggable>

@property (nonatomic, weak) GYEasyForm *form;
@property (nonatomic, assign, readonly) NSUInteger index;
@property (nonatomic, strong) Header header;
@property (nonatomic, strong) Footer footer;
@property (nonatomic, strong, readonly) NSMutableArray<__kindof GYEasyRow *> *rows;
@property (nonatomic, assign) BOOL hideLastRowSeparator; //隐藏最后的row的分割线
/**构造方法*/
- (instancetype)initWithHeaderHeight:(CGFloat)headerHeight footerHeight:(CGFloat)footerHeight;

- (instancetype)initWithHeaderHeight:(CGFloat)headerHeight
                       headerBgColor:(nullable UIColor *)headerBgColor
                        footerHeight:(CGFloat)footerHeight
                       footerBgColor:(nullable UIColor *)footerBgColor NS_DESIGNATED_INITIALIZER;

/**添加row*/
- (void)appendRow:(__kindof GYEasyRow *)row;
/**添加rows*/
- (void)appendRows:(NSArray<__kindof GYEasyRow *> *)rows;
/**动态添加row*/
- (void)appendRow:(__kindof GYEasyRow *)row withAnimation:(UITableViewRowAnimation)animation;
/**动态插入row*/
- (void)insertRow:(__kindof GYEasyRow *)row atIndex:(NSUInteger)atIndex Animation:(UITableViewRowAnimation)animation;
/**动态删除row*/
- (void)deleteRow:(__kindof GYEasyRow *)row Animation:(UITableViewRowAnimation)animation;
/**动态删除row*/
- (void)deleteRowAtIndex:(NSUInteger)atIndex Animation:(UITableViewRowAnimation)animation;
/**动态删除row*/
- (void)deleteAllRowWithAnimation:(UITableViewRowAnimation)animation;

/**刷新Section*/
- (void)reload;
- (void)reloadWithAnimation:(UITableViewRowAnimation)animation;

@end

NS_ASSUME_NONNULL_END
