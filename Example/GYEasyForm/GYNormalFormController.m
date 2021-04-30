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
#import "UIView+Toast.h"

@interface GYNormalFormController () <TZImagePickerControllerDelegate>
@property (nonatomic, strong) UILabel *infoLabel;
@end

@implementation GYNormalFormController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Normal Form";

    __weak typeof(self)weakSelf = self;
    GYEasyForm *form = [[GYEasyForm alloc] init];
    GYEasySection *firstSection = [[GYEasySection alloc] initWithHeaderHeight:0 headerBgColor:nil footerHeight:10 footerBgColor:[UIColor groupTableViewBackgroundColor]];
    GYEasySection *secondSection = [[GYEasySection alloc] init];
    GYEasySection *thirdSection = [[GYEasySection alloc] init];
    thirdSection.header = self.infoLabel;
    
    firstSection.hideLastRowSeparator = YES;
    secondSection.hideLastRowSeparator = YES;

    //group1
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
    //group2
    GYTitleTextFieldRow *priceRow = [GYTitleTextFieldRow rowInit:^(GYTitleTextFieldRow * _Nonnull row) {
        row.title = @"价格";
        row.placeholder = @"请填写价格";
        row.remark = @"万元";
        row.height = 50;
        row.keyboardType = UIKeyboardTypeDecimalPad;
    }];
    
    priceRow.onTextChange = ^(id<UITextInput>  _Nonnull input) {
        [weakSelf checkoutInputPriceAndAreaFormat:(UITextField *)input];
    };
    
    GYTitleTextFieldRow *sizeRow = [GYTitleTextFieldRow rowInit:^(GYTitleTextFieldRow * _Nonnull row) {
        row.title = @"面积";
        row.placeholder = @"请填写面积";
        row.remark = @"平米";
        row.height = 50;
        row.keyboardType = UIKeyboardTypeDecimalPad;
        row.limit = 8;
    }];
    sizeRow.onTextChange = ^(id<UITextInput>  _Nonnull input) {
        [weakSelf checkoutInputPriceAndAreaFormat:(UITextField *)input];
    };

    GYTitleTextFieldRow *passwordRow = [GYTitleTextFieldRow rowInit:^(GYTitleTextFieldRow * _Nonnull row) {
        row.title = @"密码";
        row.placeholder = @"请输入密码";
        row.height = 50;
        row.keyboardType = UIKeyboardTypeDefault;
    }];
    passwordRow.onTextChange = ^(id<UITextInput>  _Nonnull input) {
        [weakSelf checkoutInputPasswordFormat:(UITextField *)input];
    };
    
    //group3
    GYNormalTitleRow *genderRow = [GYNormalTitleRow rowInit:^(GYNormalTitleRow * _Nonnull row) {
        row.title = @"性别";
        row.placeholder = @"请选择性别";
        row.height = 50;
    }];
    GYTitleTextFieldRow *phoneRow = [GYTitleTextFieldRow rowInit:^(GYTitleTextFieldRow * _Nonnull row) {
        row.title = @"手机号";
        row.height = 50;
        row.placeholder = @"请填写手机号";
        row.limit = 11;
        row.keyboardType = UIKeyboardTypeNumberPad;
        row.contentInsets = UIEdgeInsetsMake(0, 115, 0, 20);
    }];
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
        [weakSelf.view makeToast:@"提交成功"];
    };
    
    [firstSection appendRows:@[nameRow, cityRow, zoneRow]];
    [secondSection appendRows:@[priceRow, sizeRow, passwordRow]];
    [thirdSection appendRows:@[genderRow, phoneRow, photoRow, submitRow]];
    
    [form appendSections:@[firstSection, secondSection, thirdSection]];
    self.formView.form = form;
}

- (void)checkoutInputPriceAndAreaFormat:(UITextField *)input{
    NSString *regex = [NSString stringWithFormat:@"^(([1-9]\\d{0,4})|0)(\\.\\d{0,2})?$"];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if(![pred evaluateWithObject: input.text]) {
        [input deleteBackward];
        [self.view makeToast:@"最多5位数且仅支持小数点后两位" duration:0.25 position:CSToastPositionCenter];
    }
}

- (void)checkoutInputPasswordFormat:(UITextField *)input{
    NSString * regex = @"^[a-zA-Z0-9_\u4e00-\u9fa5]{0,16}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if(![pred evaluateWithObject: input.text]) {
        [input deleteBackward];
        [self.view makeToast:@"仅支持数字，汉字，字母及其组合" duration:0.25 position:CSToastPositionCenter];
    }
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        _infoLabel.text = @"     个人信息";
        _infoLabel.textColor = [UIColor blackColor];
        _infoLabel.font = [UIFont systemFontOfSize:14];
        _infoLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _infoLabel;
}


@end
