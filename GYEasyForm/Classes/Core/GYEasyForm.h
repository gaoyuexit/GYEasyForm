//
//  GYEasyForm.h
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYEasyFormProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@class GYEasySection, GYEasyRow;

@interface GYEasyForm : NSObject <GYTaggable>

@property (nonatomic, strong, readonly) NSMutableArray<__kindof GYEasySection *> *sections;
@property (nonatomic, weak) UITableView *tableView;

/**监听*/
@property (nonatomic, copy) void(^contentSizeChang)(NSDictionary<NSKeyValueChangeKey,id> *change);
@property (nonatomic, copy) void(^scrollViewDidScroll)(UIScrollView *scrollView);

/**rowConfig*/
- (void)formRowConfig:(void(^)(__kindof GYEasyRow *row))rowConfig;

/**获取row*/
- (NSArray<__kindof GYEasyRow *> *)allRows;
- (nullable __kindof GYEasyRow *)rowWithIndexPath:(NSIndexPath *)indexPath;
- (nullable __kindof GYEasyRow *)rowWithTag:(NSString *)tag;

/**获取section*/
- (nullable __kindof GYEasySection *)sectionWithIndex:(NSUInteger)index;
- (nullable __kindof GYEasySection *)sectionWithTag:(NSString *)tag;

/**添加section*/
- (void)appendSection:(__kindof GYEasySection *)section;
- (void)appendSections:(NSArray<__kindof GYEasySection *> *)sections;

/**动态添加section*/
- (void)appendSection:(__kindof GYEasySection *)section withAnimation:(UITableViewRowAnimation)animation;
/**动态插入section*/
- (void)insertSection:(__kindof GYEasySection *)section atIndex:(NSUInteger)atIndex Animation:(UITableViewRowAnimation)animation;
/**动态删除section*/
- (void)deleteSection:(__kindof GYEasySection *)section Animation:(UITableViewRowAnimation)animation;
/**动态删除section*/
- (void)deleteSectionAtIndex:(NSUInteger)atIndex Animation:(UITableViewRowAnimation)animation;

/**刷新Form*/
- (void)reload;

@end


NS_ASSUME_NONNULL_END
