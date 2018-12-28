//
//  GYEasyRow.h
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYEasyFormProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@class GYEasyCell, GYEasySection, GYEasyRow;

@interface GYEasyRow<__covariant Cell: __kindof GYEasyCell *> : NSObject <GYTaggable, GYValueable, GYRowConformance>

@property (nonatomic, weak) GYEasySection *section;

@property (nonatomic, assign, readonly) NSUInteger index;

@property (nonatomic, strong, readonly) NSIndexPath *indexPath;

@property (nonatomic, strong) Cell cell;

@property (nonatomic, copy) void(^tap)(NSIndexPath *indexPath);
/**row的高度*/
@property (nonatomic, assign) CGFloat height;
/**row的估算高度*/
@property (nonatomic, assign) CGFloat estimatedHeight;

+ (void)rowConfig:(nullable void(^)(__kindof GYEasyRow *row, Cell cell))config;

//默认的初始化方法
+ (instancetype)rowInit:(nullable void(^)(__kindof GYEasyRow *row))init;

/**刷新Row*/
- (void)reload;
- (void)reloadWithAnimation:(UITableViewRowAnimation)animation;
/**更新cell*/
- (void)updateCell;



- (Class)associatedCellClass;

@end

NS_ASSUME_NONNULL_END
