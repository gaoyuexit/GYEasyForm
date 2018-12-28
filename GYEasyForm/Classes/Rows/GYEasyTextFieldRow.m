//
//  GYEasyTextFieldRow.m
//  ZGSellHouseModule
//
//  Created by apple on 2018/12/24.
//

#import "GYEasyTextFieldRow.h"

@implementation GYEasyTextFieldCell

- (void)prepare {
    [super prepare];
    GYEasyTextFieldRow *row = self.row;
    self.textField.textAlignment = row.contentAlignment;
    self.textField.secureTextEntry = row.secureInput;
    self.textField.keyboardType = row.keyboardType;
    self.textField.font = row.contentFont;
    self.textField.textColor = row.contentColor;
    
    [self.contentView addSubview:self.textField];
    [self.textField addTarget:self action:@selector(textDidChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.textField addTarget:self action:@selector(editingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [self.textField addTarget:self action:@selector(editingDidEnd:) forControlEvents:UIControlEventEditingDidEnd];
}

- (void)update {
    [super update];
    GYEasyTextFieldRow *row = self.row;
    self.textField.text = row.content;
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:row.placeholder attributes:@{
                                                                                                                   NSFontAttributeName: self.textField.font,
                                                                                                                   NSForegroundColorAttributeName: row.placeholderColor
                                                                                                                   }];
}

- (void)textDidChanged:(UITextField *)textField{
    GYEasyTextFieldRow *row = self.row;
    // 判断是否存在高亮字符，如果有，则不进行字数统计和字符串截断
    UITextRange *selectedRange = textField.markedTextRange;
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    if (position || row.limit <= 0) { return; }
    if (textField.text.length > row.limit) {
        textField.text = [textField.text substringToIndex:row.limit];
        if (row.limitAction) { row.limitAction(textField); }
    }
    row.content = textField.text;
    if (row.onTextChange) { row.onTextChange(self.textField); }
}

- (void)editingDidBegin:(UITextField *)textField {
    GYEasyTextFieldRow *row = self.row;
    if (row.onFirstResponserChange) { row.onFirstResponserChange(YES); }
}

- (void)editingDidEnd:(UITextField *)textField {
    GYEasyTextFieldRow *row = self.row;
    if (row.onFirstResponserChange) { row.onFirstResponserChange(NO); }
}

#pragma mark -- Setter && Getter
- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor clearColor];
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _textField;
}


@end

@implementation GYEasyTextFieldRow
@synthesize secureInput = _secureInput;
@synthesize content = _content;
@synthesize placeholder = _placeholder;
@synthesize placeholderColor = _placeholderColor;
@synthesize keyboardType = _keyboardType;
@synthesize onTextChange = _onTextChange;
@synthesize onFirstResponserChange = _onFirstResponserChange;
@synthesize contentAlignment = _contentAlignment;
@synthesize contentFont = _contentFont;
@synthesize contentColor = _contentColor;

- (Class)associatedCellClass {
    return [GYEasyTextFieldCell class];
}

- (void)setLimit:(NSUInteger)limit limitAction:(LimitAction)limitAction {
    _limit = limit;
    _limitAction = limitAction;
}

- (instancetype)init {
    if (self = [super init]) {
    
        _contentAlignment = NSTextAlignmentLeft;
        _secureInput = NO;
        _placeholder = @"";
        _placeholderColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        _keyboardType = UIKeyboardTypeDefault;
        _contentFont = [UIFont systemFontOfSize:14];
        _contentColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        _limit = NSUIntegerMax;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


@end
