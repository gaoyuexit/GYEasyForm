//
//  GYDynamicFormViewController.m
//  GYEasyForm_Example
//
//  Created by apple on 2018/12/29.
//  Copyright © 2018 gaoyuexit. All rights reserved.
//

#import "GYDynamicFormViewController.h"
#import "TZImagePickerController.h"
#import "GYPhotoWallRow.h"
#import "GYCustomHeader.h"

@interface GYDynamicFormViewController () <TZImagePickerControllerDelegate>

@end

@implementation GYDynamicFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Dynamic Form";
    
    __weak typeof(self)weakSelf = self;
    GYEasyForm *form = [[GYEasyForm alloc] init];
    GYEasySection *firstSection = [[GYEasySection alloc] init];
    firstSection.hideLastRowSeparator = YES;
    
    //图片
    GYPhotoWallRow *photoRow = [GYPhotoWallRow rowInit:nil];
    __weak typeof(photoRow)weakPhotoRow = photoRow;
    photoRow.addImageAction = ^{
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:weakSelf];
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            [weakPhotoRow.images addObjectsFromArray:photos];
            [weakPhotoRow updateCell];
        }];
        [weakSelf presentViewController:imagePickerVc animated:YES completion:nil];
    };
    
    GYNormalTitleRow *addRow = [GYNormalTitleRow rowInit:^(GYNormalTitleRow * _Nonnull row) {
        row.title = @"点击";
        row.placeholder = @"添加一组";
        row.height = 50;
    }];
    addRow.tap = ^(NSIndexPath * _Nonnull indexPath) {
        GYCustomHeader *header = [[GYCustomHeader alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 45)];
        GYEasySection<GYCustomHeader *, UIView *> *section = [[GYEasySection alloc] initWithHeaderHeight:10
                                                                                           headerBgColor:[UIColor groupTableViewBackgroundColor]
                                                                                            footerHeight:0
                                                                                           footerBgColor:nil];
        section.header = header;
        section.header.titleLabel.text = [NSString stringWithFormat:@"组头--%zd", form.sections.count];
        [form appendSection:section withAnimation:UITableViewRowAnimationRight];
        
        __weak typeof(section)weakSection = section;
        section.header.addAction = ^{
            GYNormalTitleRow *row = [GYNormalTitleRow rowInit:^(GYNormalTitleRow * _Nonnull row) {
                row.title = [NSString stringWithFormat:@"行--%zd", weakSection.rows.count];
                row.placeholder = @"";
                row.height = 44;
            }];
            [weakSection appendRow:row withAnimation:UITableViewRowAnimationRight];
        };
    };
    
    
    [firstSection appendRows:@[photoRow, addRow]];
    [form appendSection:firstSection];
    self.formView.form = form;
}


@end
