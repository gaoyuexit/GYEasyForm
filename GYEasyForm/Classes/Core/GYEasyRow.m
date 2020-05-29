//
//  GYEasyRow.m
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import "GYEasyRow.h"
#import "GYEasyCell.h"
#import "GYEasySection.h"
#import "GYEasyForm.h"

@interface GYEasyRow ()
{
    GYEasyCell *_cell;
}
@end

@implementation GYEasyRow
@dynamic cell;

@synthesize tag = _tag;
@synthesize value = _value;

@synthesize separatorLineInset = _separatorLineInset;
@synthesize separatorLineColor = _separatorLineColor;
@synthesize hiddenSeparatorLine = _hiddenSeparatorLine;
@synthesize selectionColor = _selectionColor;
@synthesize selectionStyle = _selectionStyle;

- (Class)associatedCellClass {
    @throw [NSException exceptionWithName:@"EasyForm row associatedCellClass error"
                                   reason:[NSString stringWithFormat:@"%@ need overrides - associatedCellClass function", self]
                                 userInfo:nil];
}

- (void)setCell:(__kindof GYEasyCell *)cell {
    _cell = cell;
}

- (GYEasyCell *)cell{
    NSAssert(_cell, @"please set the cell of the row first");
    if (_cell.row == nil) {
        _cell.row = self;
        [_cell prepare];
    }
    return _cell;
}

+ (instancetype)rowInit:(nullable void(^)(__kindof GYEasyRow *row))init {
    __kindof GYEasyRow *row = [[self alloc] init];
    
    RowConfigBlock defaultConfig = [[[self class] rowDefaultConfigs] objectForKey: NSStringFromClass([self class])];
    if (defaultConfig) { defaultConfig(row); }
    
    if (init) { init(row); }
    return row;
}

- (instancetype)init {
    if (self = [super init]) {
        NSAssert([[self associatedCellClass] isSubclassOfClass:[GYEasyCell class]], @"associatedCellClass must be a subclass of GYEasyCell");
        //- setCell:(__kindof GYEasyCell *)cell
        self.cell = [[[self associatedCellClass] alloc] init];
        _height = 44.0f;
        _estimatedHeight = 44.0f;
        _separatorLineInset = UIEdgeInsetsMake(0, 20, 0, 0);
        _separatorLineColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0];
        _selectionColor = nil;
        _selectionStyle = UITableViewCellSelectionStyleDefault;
        _hiddenSeparatorLine = NO;
    }
    return self;
}

+ (NSMutableDictionary<NSString *, RowConfigBlock> *)rowDefaultConfigs {
    static NSMutableDictionary *_rowConfigs;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _rowConfigs = [NSMutableDictionary dictionary];
    });
    return _rowConfigs;
}

- (void)reload {
    [self reloadWithAnimation:UITableViewRowAnimationNone];
}

- (void)reloadWithAnimation:(UITableViewRowAnimation)animation {
     [_section.form.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.index inSection:_section.index]] withRowAnimation:animation];
}

- (void)updateCell {
    [self.cell update];
}

- (void)customUpdateCell {
    [self.cell customUpdate];
}

+ (void)rowDefaultConfig:(nullable RowConfigBlock)defautlConfig{
    if (defautlConfig) {
        [self rowDefaultConfigs][NSStringFromClass(self)] = defautlConfig;
    }else{
        [[self rowDefaultConfigs] removeObjectForKey:NSStringFromClass(self)];
    }
}

#pragma mark --- Setter && Getter

- (void)setHeight:(CGFloat)height {
    _height = height;
    _estimatedHeight = height;
}

- (NSUInteger)index {
    return [_section.rows indexOfObject:self];
}

- (NSIndexPath *)indexPath {
    return [NSIndexPath indexPathForRow:self.index inSection:self.section.index];
}


@end
