//
//  GYEasyGradientButton.m
//  ZGSellHouseModule
//
//  Created by apple on 2018/12/15.
//

#import "GYEasyGradientButton.h"

@interface GYEasyGradientButton ()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end

@implementation GYEasyGradientButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _startPoint = CGPointMake(0, 0);
        _endPoint = CGPointMake(1, 1);
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;

    NSMutableArray *cgColors = [NSMutableArray array];
    for(UIColor *color in self.colors) {
        [cgColors addObject:(id)color.CGColor];
    }
    self.gradientLayer.colors = cgColors;
    self.gradientLayer.startPoint = self.startPoint;
    self.gradientLayer.endPoint = self.endPoint;
    self.gradientLayer.locations = self.locations;
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
}

#pragma mark -- Setter && Getter
- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
    }
    return _gradientLayer;
}



//- (void)drawRect:(CGRect)rect {
//    if (self.colors.count == 0) {  return; }
//    self.backgroundColor = [UIColor blackColor];
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = self.frame;
//
//    NSMutableArray *cgColors = [NSMutableArray array];
//    for(UIColor *color in self.colors) {
//        [cgColors addObject:(id)color.CGColor];
//    }
//    gradientLayer.colors = cgColors;
//    gradientLayer.startPoint = self.startPoint;
//    gradientLayer.endPoint = self.endPoint;
//    [[self imageWithLayer:gradientLayer] drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) blendMode:kCGBlendModeSourceAtop alpha:1];
//}

//- (UIImage *)imageWithLayer:(CALayer *)layer {
//    UIGraphicsBeginImageContextWithOptions(layer.frame.size, NO, 0);
//    [layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
//}



@end
