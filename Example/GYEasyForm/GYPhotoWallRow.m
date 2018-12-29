//
//  GYPhotoWallRow.m
//  GYEasyForm_Example
//
//  Created by apple on 2018/12/29.
//  Copyright © 2018 gaoyuexit. All rights reserved.
//

#import "GYPhotoWallRow.h"
#import "Masonry.h"

@interface GYPhotoCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *iconView;
@end

@implementation GYPhotoCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _iconView = [[UIImageView alloc] init];
        _iconView.contentMode = UIViewContentModeScaleAspectFill;
        _iconView.layer.masksToBounds = YES;
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}

@end




@interface GYPhotoWallRowCell () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation GYPhotoWallRowCell

- (void)prepare {
    [super prepare];
    GYPhotoWallRow *row = self.row;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(row.itemSize, row.itemSize);
    layout.minimumInteritemSpacing = row.interitemSpacing;
    layout.minimumLineSpacing = row.interitemSpacing;
    layout.sectionInset = row.sectionInset;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 0) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.scrollEnabled = NO;
    _collectionView.clipsToBounds = NO;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[GYPhotoCell class] forCellWithReuseIdentifier:[GYPhotoCell description]];
    [self.contentView addSubview:_collectionView];
    
    [_collectionView layoutIfNeeded];
    CGRect frame = _collectionView.frame;
    frame.size.height = _collectionView.contentSize.height;
    _collectionView.frame = frame;
}

- (void)update {
    [super update];
    GYPhotoWallRow *row = self.row;
    [_collectionView reloadData];
    [_collectionView layoutIfNeeded];
    CGRect frame = _collectionView.frame;
    frame.size.height = _collectionView.contentSize.height;
    _collectionView.frame = frame;
    row.height = frame.size.height;
    [self.row.section.form.tableView beginUpdates];
    [self.row.section.form.tableView endUpdates];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    GYPhotoWallRow *row = self.row;
    return row.images.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GYPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[GYPhotoCell description] forIndexPath:indexPath];
    GYPhotoWallRow *row = self.row;
    if (indexPath.row == row.images.count) {
        cell.iconView.image = [UIImage imageNamed:@"addImage"];
    }else{
        cell.iconView.image = row.images[indexPath.row];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    GYPhotoWallRow *row = self.row;
    if (indexPath.row == row.images.count) {
        if (row.addImageAction) { row.addImageAction(); }
    } else {
        if (row.clickImageAction) { row.clickImageAction(indexPath.row); }
    }
}


@end

@implementation GYPhotoWallRow

- (Class)associatedCellClass { return [GYPhotoWallRowCell class]; }

- (instancetype)init {
    if (self = [super init]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.itemSize = 80;
        self.interitemSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(15, 20, 15, 20);
        self.height = UITableViewAutomaticDimension;
        _images = [NSMutableArray array];
    }
    return self;
}

@end
