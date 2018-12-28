//
//  GYEasySection.m
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import "GYEasySection.h"
#import "GYEasyRow.h"
#import "GYEasyForm.h"
#import "GYEasyFormView.h"
#import "GYEasyCell.h"

static NSString *const kRowsKey = @"_rows";

@interface GYEasySection ()
@property (nonatomic, strong) NSMutableArray<__kindof GYEasyRow *> *rows;
@end

@implementation GYEasySection
@synthesize tag = _tag;

- (instancetype)init {
    return [self initWithHeaderHeight:CGFLOAT_MIN footerHeight:CGFLOAT_MIN];
}

- (instancetype)initWithHeaderHeight:(CGFloat)headerHeight footerHeight:(CGFloat)footerHeight {
    return [self initWithHeaderHeight:headerHeight headerBgColor:nil footerHeight:footerHeight footerBgColor:nil];
}

- (instancetype)initWithHeaderHeight:(CGFloat)headerHeight
                       headerBgColor:(nullable UIColor *)headerBgColor
                        footerHeight:(CGFloat)footerHeight
                       footerBgColor:(nullable UIColor *)footerBgColor
{
    if (self = [super init]) {
        _rows = [NSMutableArray array];
        _header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, MAX(headerHeight, CGFLOAT_MIN))];
        _footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, MAX(footerHeight, CGFLOAT_MIN))];
        _header.backgroundColor = headerBgColor ?: [UIColor clearColor];
        _footer.backgroundColor = footerBgColor ?: [UIColor clearColor];
        _hideLastRowSeparator = NO;
        [self addObserver:self forKeyPath:kRowsKey options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:kRowsKey]) {
        if (!_hideLastRowSeparator) { return; }
        [self.rows enumerateObjectsUsingBlock:^(__kindof GYEasyRow * _Nonnull row, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx == self.rows.count - 1) {
                row.cell.separatorLine.hidden = YES;
            }else{
                row.cell.separatorLine.hidden = row.hiddenSeparatorLine;
            }
        }];
    }
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:kRowsKey];
}

- (void)appendRow:(__kindof GYEasyRow *)row {
    row.section = self;
    [[self kvoRows] addObject:row];
}

- (void)appendRows:(NSArray<__kindof GYEasyRow *> *)rows {
    [rows enumerateObjectsUsingBlock:^(__kindof GYEasyRow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.section = self;
    }];
    //[[self kvoRows] addObjectsFromArray:rows]; -> KVO trigger multiple times
    //KVO trigger only once
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(self.rows.count, rows.count)];
    [[self kvoRows] insertObjects:rows atIndexes:indexSet];
}

- (void)appendRow:(__kindof GYEasyRow *)row withAnimation:(UITableViewRowAnimation)animation {
    [self insertRow:row atIndex:_rows.count Animation:animation];
}

- (void)insertRow:(__kindof GYEasyRow *)row atIndex:(NSUInteger)atIndex Animation:(UITableViewRowAnimation)animation {
    [[self kvoRows] insertObject:row atIndex:atIndex];
    row.section = self;
    [_form.tableView beginUpdates];
    [_form.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:atIndex inSection:self.index]] withRowAnimation:animation];
    [_form.tableView endUpdates];
}

- (void)deleteRow:(__kindof GYEasyRow *)row Animation:(UITableViewRowAnimation)animation {
    NSUInteger atIndex = [_rows indexOfObject:row];
    if (atIndex == NSNotFound) { return; }
    row.section = nil;
    [[self kvoRows] removeObject:row];
    [_form.tableView beginUpdates];
    [_form.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:atIndex inSection:self.index]] withRowAnimation:animation];
    [_form.tableView endUpdates];
}

- (void)deleteRowAtIndex:(NSUInteger)atIndex Animation:(UITableViewRowAnimation)animation {
    if (atIndex + 1 > _rows.count) { return; }
    GYEasyRow *row = [_rows objectAtIndex:atIndex];
    if (row == nil) { return; }
    [self deleteRow:row Animation:animation];
}

/**动态删除row*/
- (void)deleteAllRowWithAnimation:(UITableViewRowAnimation)animation {
    if (_rows.count <= 0) { return; }
    NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:self.rows.count];
    for (GYEasyRow *row in _rows) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:row.index inSection:self.index]];
    }
    [[self kvoRows] removeAllObjects];
    [_form.tableView beginUpdates];
    [_form.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
    [_form.tableView endUpdates];
}

- (void)reload {
    [self reloadWithAnimation:UITableViewRowAnimationNone];
}

- (void)reloadWithAnimation:(UITableViewRowAnimation)animation {
    [_form.tableView reloadSections:[NSIndexSet indexSetWithIndex:self.index] withRowAnimation:animation];
}

#pragma mark -- Setter & Getter
- (NSUInteger)index {
    return [_form.sections indexOfObject:self];
}

- (NSMutableArray<__kindof GYEasyRow *> *)kvoRows {
    return [self mutableArrayValueForKey:kRowsKey];
}

@end
