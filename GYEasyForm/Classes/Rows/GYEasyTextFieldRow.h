//
//  GYEasyTextFieldRow.h
//  ZGSellHouseModule
//
//  Created by apple on 2018/12/24.
//

#import "GYEasyRow.h"
#import "GYEasyCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface GYEasyTextFieldCell : GYEasyCell
@property (nonatomic, strong) UITextField *textField;
@end

typedef void(^LimitAction)(id<UITextInput> input);

@interface GYEasyTextFieldRow<Cell:__kindof GYEasyTextFieldCell *> : GYEasyRow<Cell><GYInputRowConformace>
@property (nonatomic, assign) NSUInteger limit;
@property (nonatomic, copy) LimitAction limitAction;
- (void)setLimit:(NSUInteger)limit limitAction:(LimitAction)limitAction;
@end

NS_ASSUME_NONNULL_END
