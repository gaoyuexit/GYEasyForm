# GYEasyForm

[![CI Status](https://img.shields.io/travis/gaoyuexit/GYEasyForm.svg?style=flat)](https://travis-ci.org/gaoyuexit/GYEasyForm)
[![Version](https://img.shields.io/cocoapods/v/GYEasyForm.svg?style=flat)](https://cocoapods.org/pods/GYEasyForm)
[![License](https://img.shields.io/cocoapods/l/GYEasyForm.svg?style=flat)](https://cocoapods.org/pods/GYEasyForm)
[![Platform](https://img.shields.io/cocoapods/p/GYEasyForm.svg?style=flat)](https://cocoapods.org/pods/GYEasyForm)

## Overview

`GYEasyForm` is a library that makes it easy to build forms on the mobile side. 
`GYEasyForm` is a simple version of [Eureka](https://github.com/xmartlabs/Eureka), written in `Objective-C`

## How to use

```objective-c
    GYEasyForm *form = [[GYEasyForm alloc] init];
    GYEasySection *section = [[GYEasySection alloc] initWithHeaderHeight:10
                                                           headerBgColor:[UIColor groupTableViewBackgroundColor]
                                                            footerHeight:0
                                                           footerBgColor:nil];
    GYNormalTitleRow *row1 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"first line";
    }];
    GYNormalTitleRow *row2 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"second line";
    }];
    GYNormalTitleRow *row3 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"third line";
    }];
    GYNormalTitleRow *row4 = [GYNormalTitleRow rowInit:^(__kindof GYNormalTitleRow * _Nonnull row) {
        row.title = @"fourth line";
    }];
    
    [section appendRows:@[row1, row2, row3, row4]];
    [form appendSection:section];
    self.formView.form = form;

```

## How to customize a row

You need to inherit `GYEasyRow` to write your own Row and create a Cell corresponding to this Row.
like this:

```objective-c
//ZGCustomRow.h
#import <GYEasyForm/EasyForm.h>
@interface ZGCustomRowCell : GYEasyCell

@end

@interface ZGCustomRow : GYEasyRow<ZGCustomRowCell *>

@end

```

```objective-c
//ZGCustomRow.m
#import "ZGCustomRow.h"

@implementation ZGCustomRowCell

// You can create controls and layouts here
- (void)prepare { 
    [super prepare];
}

// Changes in variables in row, need to be updated here, 
// Executed after the [row updateCell] method
- (void)update { 
    [super update];
}

@end

@implementation ZGCustomRow

// Specify the cell associated with the row
- (Class)associatedCellClass { return [ZGCustomRowCell class]; }

@end

```

Of course, it can also be created with xcode template files.
There is a `Templates` folder in the project directory. You can go to this folder to execute `sh install.sh`, Then restart xcode. 
You can create a row 👇👇

![template_row](https://raw.githubusercontent.com/zhugezhaofang/GYEasyForm/master/Images/row_template.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8.0+

## Installation

GYEasyForm is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GYEasyForm'
```

## Author

gaoyu, gaoyuexit@gmail.com

## License

GYEasyForm is available under the MIT license. See the LICENSE file for more info.


