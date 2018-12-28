//
//  GYGradientButtonRow.h
//  ZGSellHouseModule
//
//  Created by apple on 2018/12/15.
//

#import "GYEasyRow.h"
#import "GYEasyCell.h"
#import "GYEasyGradientButton.h"
#import "GYEasyFormProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface GYGradientButtonCell : GYEasyCell
@property (nonatomic, strong) GYEasyGradientButton *gradientButton;
@end


@interface GYGradientButtonRow : GYEasyRow<GYGradientButtonCell *> <GYButtonRowConformace>
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, copy) NSArray<NSNumber *> *locations;
@property (nonatomic, copy) NSArray<UIColor *> *colors;
@end

NS_ASSUME_NONNULL_END
