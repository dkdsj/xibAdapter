//
//  UIView+BInspectable.h
//  OCIBInspectableDm
//
//  Created by zz on 2021/8/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 优先级
 1. cornerRadiusOn
 = YES，cornerRadius生效，部分圆角设置无效
 = NO， cornerRadius无效，部分圆角设置生效

 2. 部分圆角
 allCornerRadius
 > 0，单个圆角(上左、上右、下左、下右)设置无效
 <= 0，单个圆角(上左、上右、下左、下右)设置生效
 */
@interface UIView (BInspectable)

///按比例缩放
//@property (nonatomic, assign) IBInspectable BOOL adapterRadius;
@property (nonatomic, assign) IBInspectable BOOL masks2Bounds;
@property (nonatomic, assign) IBInspectable BOOL cornerRadiusOn;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

@property (nonatomic, assign) IBInspectable CGFloat allCornerRadius;
///设置部分圆角
@property (nonatomic, assign) IBInspectable CGFloat topLeftCornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat topRightCornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat bottomLeftCornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat bottomRightCornerRadius;

@end

NS_ASSUME_NONNULL_END
