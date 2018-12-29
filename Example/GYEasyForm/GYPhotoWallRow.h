//
//  GYPhotoWallRow.h
//  GYEasyForm_Example
//
//  Created by apple on 2018/12/29.
//  Copyright © 2018 gaoyuexit. All rights reserved.
//

#import <GYEasyForm/EasyForm.h>

NS_ASSUME_NONNULL_BEGIN

@interface GYPhotoWallRowCell : GYEasyCell

@end

@interface GYPhotoWallRow : GYEasyRow<GYPhotoWallRowCell *>

@property (nonatomic, strong) NSMutableArray *images;

@property (nonatomic, assign) CGFloat itemSize;
@property (nonatomic, assign) CGFloat interitemSpacing;
@property (nonatomic, assign) UIEdgeInsets sectionInset;
@property (nonatomic, strong) UIImage *addImage;

@property (nonatomic, copy) void(^addImageAction)(void);
@property (nonatomic, copy) void(^clickImageAction)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
