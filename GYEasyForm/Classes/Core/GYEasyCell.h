//
//  GYEasyCell.h
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYEasyRow.h"

NS_ASSUME_NONNULL_BEGIN

@interface GYEasyCell : UITableViewCell

/**Row*/
@property (nonatomic, weak) __kindof GYEasyRow *row;
/**分割线*/
@property (nonatomic, strong) UIView *separatorLine;

/**子类可重写该方法进行布局  Called only once during initialization */
- (void)prepare NS_REQUIRES_SUPER;

/**子类可重写该方法进行刷新操作, call each time in `cellForRowAtIndexPath` */
- (void)update NS_REQUIRES_SUPER;

/**子类可重写该方法进行自定义操作*/
- (void)customUpdate NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
