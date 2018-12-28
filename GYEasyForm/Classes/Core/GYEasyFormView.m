//
//  GYEasyFormView.m
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import "GYEasyFormView.h"
#import "GYEasyForm.h"
#import "GYEasySection.h"
#import "GYEasyCell.h"
#import "GYEasyRow.h"

@interface GYEasyFormView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation GYEasyFormView

/**设置表单并刷新*/
- (void)setForm:(GYEasyForm *)form {
    _form = form;
    _form.tableView = _tableView;
    if (self.superview != nil && _tableView.window != nil) {
        [_tableView reloadData];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.tableView];
        [self addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0],
                                [NSLayoutConstraint constraintWithItem:self.tableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]
                                ]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [self.tableView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentSize"]) {
        if (self.form && self.form.contentSizeChang) { self.form.contentSizeChang(change); }
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.tableView removeObserver:self forKeyPath:@"contentSize"];
}

#pragma mark --- TODO:
- (void)keyboardWillShow:(NSNotification *)notification {
    
}

- (void)keyboardWillHide:(NSNotification *)notification {
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.form && self.form.scrollViewDidScroll) { self.form.scrollViewDidScroll(scrollView); }
}

#pragma mark --- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.form.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.form.sections[section].rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    __kindof GYEasyCell *cell = [self.form rowWithIndexPath:indexPath].cell;
    [cell update];
    return cell;
}

#pragma mark --- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self endEditing:YES];
    __kindof GYEasyRow *row = [self.form rowWithIndexPath:indexPath];
    if (row.tap) { row.tap(indexPath); }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.form.sections[section].header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    GYEasySection *easySection = self.form.sections[section];
    return easySection.header ? easySection.header.frame.size.height : tableView.sectionHeaderHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.form.sections[section].footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    GYEasySection *easySection = self.form.sections[section];
    return easySection.footer ? easySection.footer.frame.size.height : tableView.sectionFooterHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.form rowWithIndexPath:indexPath].height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.form rowWithIndexPath:indexPath].estimatedHeight;
}

#pragma mark --- Setter & Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.translatesAutoresizingMaskIntoConstraints = false;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _tableView;
}

@end
