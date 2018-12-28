//
//  GYEasyForm.m
//  EasyForm
//
//  Created by apple on 2018/11/6.
//  Copyright © 2018 gaoyu. All rights reserved.
//

#import "GYEasyForm.h"
#import "GYEasySection.h"
#import "GYEasyRow.h"

static NSString *const kSectionsKey = @"_sections";

@interface GYEasyForm()
@property (nonatomic, strong) NSMutableArray<__kindof GYEasySection *> *sections;
@end

@implementation GYEasyForm
@synthesize tag = _tag;

- (instancetype)init {
    if (self = [super init]) {
        _sections = [NSMutableArray array];
    }
    return self;
}

- (void)formRowConfig:(void(^)(__kindof GYEasyRow *row))rowConfig {
    [self.allRows enumerateObjectsUsingBlock:^(__kindof GYEasyRow * _Nonnull row, NSUInteger idx, BOOL * _Nonnull stop) {
        rowConfig(row);
    }];
    [self reload];
}

- (NSArray<__kindof GYEasyRow *> *)allRows{
    NSMutableArray *result = [NSMutableArray array];
    for (GYEasySection *section in _sections) {
        for (GYEasyRow *row in section.rows) {
            [result addObject:row];
        }
    }
    return result;
}

- (nullable __kindof GYEasyRow *)rowWithIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section >= _sections.count) { return nil; }
    GYEasySection *section = _sections[indexPath.section];
    if (indexPath.row >= section.rows.count) { return nil; }
    return section.rows[indexPath.row];
}

- (nullable __kindof GYEasyRow *)rowWithTag:(NSString *)tag{
    for (GYEasySection *section in _sections) {
        for (GYEasyRow *row in section.rows) {
            if ([row.tag isEqualToString:tag]) {
                return row;
            }
        }
    }
    return nil;
}

- (nullable __kindof GYEasySection *)sectionWithIndex:(NSUInteger)index {
    if (index >= _sections.count) { return nil; }
    return [_sections objectAtIndex:index];
}

- (nullable __kindof GYEasySection *)sectionWithTag:(NSString *)tag {
    for (GYEasySection *section in _sections) {
        if ([section.tag isEqualToString:tag]) {
            return section;
        }
    }
    return nil;
}

- (void)appendSection:(__kindof GYEasySection *)section {
    section.form = self;
    [[self kvoSections] addObject:section];
}

- (void)appendSections:(NSArray<__kindof GYEasySection *> *)sections {
    [sections enumerateObjectsUsingBlock:^(__kindof GYEasySection * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.form = self;
    }];
    //[[self kvoSections] addObjectsFromArray:rows]; -> KVO trigger multiple times
    //KVO trigger only once
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(self.sections.count, sections.count)];
    [[self kvoSections] insertObjects:sections atIndexes:indexSet];
}


- (void)appendSection:(__kindof GYEasySection *)section withAnimation:(UITableViewRowAnimation)animation {
    [self insertSection:section atIndex:_sections.count Animation:animation];
}

- (void)insertSection:(__kindof GYEasySection *)section atIndex:(NSUInteger)atIndex Animation:(UITableViewRowAnimation)animation {
    section.form = self;
    [[self kvoSections] insertObject:section atIndex:atIndex];
    [_tableView beginUpdates];
    [_tableView insertSections:[NSIndexSet indexSetWithIndex:atIndex] withRowAnimation:animation];
    [_tableView endUpdates];
}

- (void)deleteSection:(__kindof GYEasySection *)section Animation:(UITableViewRowAnimation)animation {
    NSUInteger atIndex = [_sections indexOfObject:section];
    if (atIndex == NSNotFound) { return; }
    section.form = nil;
    [[self kvoSections] removeObject:section];
    [_tableView beginUpdates];
    [_tableView deleteSections:[NSIndexSet indexSetWithIndex:atIndex] withRowAnimation:animation];
    [_tableView endUpdates];
}

- (void)deleteSectionAtIndex:(NSUInteger)atIndex Animation:(UITableViewRowAnimation)animation {
    if (atIndex + 1 > _sections.count) { return; }
    GYEasySection *section = [_sections objectAtIndex:atIndex];
    if (section == nil) { return; }
    [self deleteSection:section Animation:animation];
}

- (void)reload {
    if (_tableView && _tableView.superview != nil && _tableView.window != nil) {
        [_tableView reloadData];
    }
}

#pragma mark --- Setter && Getter
- (NSMutableArray<__kindof GYEasySection *> *)kvoSections {
    return [self mutableArrayValueForKey:kSectionsKey];
}


@end
