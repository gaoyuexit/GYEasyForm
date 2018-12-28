//
//  GYNormalButtonRow.h
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import "GYEasyRow.h"
#import <UIKit/UIKit.h>
#import "GYEasyCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface GYNormalButtonCell : GYEasyCell
@property (nonatomic, strong) UIButton *button;
@end


@interface GYNormalButtonRow : GYEasyRow<GYNormalButtonCell *> <GYButtonRowConformace>


@end

NS_ASSUME_NONNULL_END
