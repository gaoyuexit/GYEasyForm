//
//  GYEasyGradientButton.h
//  ZGSellHouseModule
//
//  Created by apple on 2018/12/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYEasyGradientButton : UIButton
@property (nonatomic, copy) NSArray<UIColor *> *colors;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, copy) NSArray<NSNumber *> *locations;
@end

NS_ASSUME_NONNULL_END
