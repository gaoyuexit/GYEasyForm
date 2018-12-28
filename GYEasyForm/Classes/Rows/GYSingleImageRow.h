//
//  GYSingleImageRow.h
//  ZGSellHouseModule
//
//  Created by apple on 2018/12/18.
//

#import "GYEasyRow.h"
#import "GYEasyCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface GYSingleImageCell : GYEasyCell
@property (nonatomic, strong) UIImageView *iconView;
@end


@interface GYSingleImageRow : GYEasyRow <GYSingleImageCell *>
@property (nonatomic, assign) UIEdgeInsets iconInsets;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, assign) UIViewContentMode contentMode;
@end

NS_ASSUME_NONNULL_END
