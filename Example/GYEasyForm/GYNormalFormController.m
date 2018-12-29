//
//  GYNormalFormController.m
//  GYEasyForm_Example
//
//  Created by apple on 2018/12/29.
//  Copyright © 2018 gaoyuexit. All rights reserved.
//

#import "GYNormalFormController.h"
#import "GYPhotoWallRow.h"
#import "TZImagePickerController.h"

@interface GYNormalFormController () <TZImagePickerControllerDelegate>

@end

@implementation GYNormalFormController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Normal Form";

    __weak typeof(self)weakSelf = self;
    GYEasyForm *form = [[GYEasyForm alloc] init];
    GYEasySection *firstSection = [[GYEasySection alloc] initWithHeaderHeight:0 headerBgColor:nil footerHeight:10 footerBgColor:[UIColor groupTableViewBackgroundColor]];
    GYEasySection *secondSection = [[GYEasySection alloc] initWithHeaderHeight:0 headerBgColor:nil footerHeight:10 footerBgColor:[UIColor groupTableViewBackgroundColor]];
    GYEasySection *thirdSection = [[GYEasySection alloc] init];
    firstSection.hideLastRowSeparator = YES;
    secondSection.hideLastRowSeparator = YES;

    GYNormalTitleRow *nameRow = [GYNormalTitleRow rowInit:^(GYNormalTitleRow * _Nonnull row) {
        row.title = @"国家";
        row.placeholder = @"请选择国家";
        row.height = 56;
    }];
    
    GYNormalTitleRow *cityRow = [GYNormalTitleRow rowInit:^(GYNormalTitleRow * _Nonnull row) {
        row.title = @"城市";
        row.placeholder = @"请选择城市";
        row.height = 50;
    }];
    
    GYNormalTitleRow *zoneRow = [GYNormalTitleRow rowInit:^(GYNormalTitleRow * _Nonnull row) {
        row.title = @"地区";
        row.placeholder = @"请选择地区";
        row.height = 50;
    }];
    
    GYTitleTextFieldRow *sizeRow = [GYTitleTextFieldRow rowInit:^(GYTitleTextFieldRow * _Nonnull row) {
        row.title = @"面积";
        row.placeholder = @"请填写面积";
        row.remark = @"平米";
        row.height = 50;
        row.keyboardType = UIKeyboardTypeDecimalPad;
        row.limit = 8;
    }];

    GYNormalTitleRow *friendRow = [GYNormalTitleRow rowInit:^(GYNormalTitleRow * _Nonnull row) {
        row.title = @"好友";
        row.placeholder = @"请选择好友";
        row.height = 50;
    }];
    
    GYNormalTitleRow *genderRow = [GYNormalTitleRow rowInit:^(GYNormalTitleRow * _Nonnull row) {
        row.title = @"性别";
        row.placeholder = @"请选择性别";
        row.height = 50;
    }];
    
    GYTitleTextFieldRow *priceRow = [GYTitleTextFieldRow rowInit:^(GYTitleTextFieldRow * _Nonnull row) {
        row.title = @"价格";
        row.placeholder = @"请填写价格";
        row.remark = @"万元";
        row.height = 50;
        row.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    
    //手机号row
    GYTitleTextFieldRow *phoneRow = [GYTitleTextFieldRow rowInit:^(GYTitleTextFieldRow * _Nonnull row) {
        row.title = @"手机号";
        row.height = 50;
        row.placeholder = @"请填写手机号";
        row.limit = 11;
        row.keyboardType = UIKeyboardTypeNumberPad;
        row.contentInsets = UIEdgeInsetsMake(0, 115, 0, 20);
    }];
    phoneRow.onTextChange = ^(UITextField *input) {
        
    };
    
    GYPhotoWallRow *photoRow = [GYPhotoWallRow rowInit:^(__kindof GYPhotoWallRow * _Nonnull row) {
        row.addImage = [UIImage imageNamed:@"addImage"];
    }];
    __weak typeof(photoRow)weakPhotoRow = photoRow;
    photoRow.addImageAction = ^{
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:weakSelf];
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            [weakPhotoRow.images addObjectsFromArray:photos];
            [weakPhotoRow updateCell];
        }];
        [weakSelf presentViewController:imagePickerVc animated:YES completion:nil];
    };
    
    GYGradientButtonRow *submitRow = [GYGradientButtonRow rowInit:^(GYGradientButtonRow * _Nonnull row) {
        row.height = 85;
        row.buttonInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        row.colors = @[[UIColor orangeColor], [UIColor yellowColor]];
        row.title = @"提交";
    }];
    submitRow.onClick = ^(UIButton * _Nonnull button) {
        NSLog(@"submit click");
    };
    
    [firstSection appendRows:@[nameRow, cityRow, zoneRow]];
    [secondSection appendRows:@[priceRow, sizeRow, friendRow]];
    [thirdSection appendRows:@[genderRow, phoneRow, photoRow, submitRow]];
    
    [form appendSections:@[firstSection, secondSection, thirdSection]];
    self.formView.form = form;
}

@end
