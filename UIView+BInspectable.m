//
//  UIView+BInspectable.m
//  OCIBInspectableDm
//
//  Created by zz on 2021/8/17.
//

#import "UIView+BInspectable.h"
#import <objc/runtime.h>

#pragma mark - 自适应
/**
 *  基准屏幕宽度 375.0
 *  以屏幕宽度为固定比例关系，来计算对应的值。假设：基准屏幕宽度375，floatV=10；当前屏幕宽度为750时，那么返回的值为20
 */
#define kAdaptW(floatValue) ({\
    float tmp = 0.0f;\
    if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {\
        tmp = floatValue * 1.5;\
    } else {\
        tmp = floatValue*[[UIScreen mainScreen] bounds].size.width/375.0;\
    }\
    tmp;\
})

#ifdef DEBUG
#define NSLog(format,...) printf("\n[%s] %s [第%d行] %s\n",__TIME__,__FUNCTION__,__LINE__,[[NSString stringWithFormat:format,## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif

@implementation UIView (BInspectable)

//radius按比例缩放
- (BOOL)adapterRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setAdapterRadius:(BOOL)adapterRadius {
    objc_setAssociatedObject(self, @selector(adapterRadius), @(adapterRadius), OBJC_ASSOCIATION_ASSIGN);
}

//圆角
- (CGFloat)cornerRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    objc_setAssociatedObject(self, @selector(cornerRadius), @(cornerRadius), OBJC_ASSOCIATION_ASSIGN);
        
    if (self.cornerRadiusOn) {
        self.layer.cornerRadius = self.adapterRadius ? kAdaptW(cornerRadius) : cornerRadius;
    }
}

- (BOOL)cornerRadiusOn {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
- (void)setCornerRadiusOn:(BOOL)cornerRadiusOn {
    objc_setAssociatedObject(self, @selector(cornerRadiusOn), @(cornerRadiusOn), OBJC_ASSOCIATION_ASSIGN);
    
    //会出现setCornerRadius时，这里还没有执行
    if (cornerRadiusOn) {
        self.cornerRadius = self.cornerRadius;
    }
}

- (BOOL)masks2Bounds {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
- (void)setMasks2Bounds:(BOOL)masks2Bounds {
    objc_setAssociatedObject(self, @selector(masks2Bounds), @(masks2Bounds), OBJC_ASSOCIATION_ASSIGN);
    
    if (self.cornerRadiusOn) {
        self.layer.masksToBounds = masks2Bounds;
    }
}

//边框
- (CGFloat)borderWidth {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    objc_setAssociatedObject(self, @selector(borderWidth), @(borderWidth), OBJC_ASSOCIATION_ASSIGN);
    
    self.layer.borderWidth = borderWidth;
}

- (UIColor *)borderColor {
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setBorderColor:(UIColor *)borderColor {
    objc_setAssociatedObject(self, @selector(borderColor), borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (self.borderWidth > 0) {
        self.layer.borderColor = borderColor.CGColor;
    }
}


//部分圆角
- (CGFloat)allCornerRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setAllCornerRadius:(CGFloat)allCornerRadius {
    objc_setAssociatedObject(self, @selector(allCornerRadius), @(allCornerRadius), OBJC_ASSOCIATION_ASSIGN);
    
    if (!self.cornerRadiusOn && self.allCornerRadius > 0) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(allCornerRadius, allCornerRadius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = path.CGPath;
        self.layer.mask = maskLayer;
    }
}

- (CGFloat)topLeftCornerRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setTopLeftCornerRadius:(CGFloat)topLeftCornerRadius {
    objc_setAssociatedObject(self, @selector(topLeftCornerRadius), @(topLeftCornerRadius), OBJC_ASSOCIATION_ASSIGN);
    
    [self updateSomeCorner];
}

- (CGFloat)topRightCornerRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setTopRightCornerRadius:(CGFloat)topRightCornerRadius {
    objc_setAssociatedObject(self, @selector(topRightCornerRadius), @(topRightCornerRadius), OBJC_ASSOCIATION_ASSIGN);
    
    [self updateSomeCorner];
}

- (CGFloat)bottomLeftCornerRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setBottomLeftCornerRadius:(CGFloat)bottomLeftCornerRadius {
    objc_setAssociatedObject(self, @selector(bottomLeftCornerRadius), @(bottomLeftCornerRadius), OBJC_ASSOCIATION_ASSIGN);
    
    [self updateSomeCorner];
}

- (CGFloat)bottomRightCornerRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setBottomRightCornerRadius:(CGFloat)bottomRightCornerRadius {
    objc_setAssociatedObject(self, @selector(bottomRightCornerRadius), @(bottomRightCornerRadius), OBJC_ASSOCIATION_ASSIGN);

    [self updateSomeCorner];
}

- (void)updateSomeCorner {
    NSLog(@"%f %f %f %f %f", self.topLeftCornerRadius, self.topRightCornerRadius, self.bottomLeftCornerRadius, self.bottomRightCornerRadius, self.allCornerRadius);
    
    if (self.cornerRadiusOn || (self.allCornerRadius > 0)
        || (self.topLeftCornerRadius == 0
            && self.topRightCornerRadius == 0
            && self.bottomLeftCornerRadius == 0
            && self.bottomRightCornerRadius == 0)) {
        return;
    }
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    CGPathRef path = CYPathCreateWithRoundedRect(self.bounds, self.topLeftCornerRadius, self.topRightCornerRadius, self.bottomLeftCornerRadius, self.bottomRightCornerRadius);
    shapeLayer.path = path;
    CGPathRelease(path);
    self.layer.mask = shapeLayer;
}

/**
 切圆角函数
 出自 https://github.com/MrGCY/AnyCornerRadius
 https://www.jianshu.com/p/164106443353
 */
CGPathRef CYPathCreateWithRoundedRect(CGRect bounds, CGFloat topLeft, CGFloat topRight, CGFloat bottomLeft, CGFloat bottomRight) {
     const CGFloat minX = CGRectGetMinX(bounds);
     const CGFloat minY = CGRectGetMinY(bounds);
     const CGFloat maxX = CGRectGetMaxX(bounds);
     const CGFloat maxY = CGRectGetMaxY(bounds);
     
     const CGFloat topLeftCenterX = minX +  topLeft;
     const CGFloat topLeftCenterY = minY + topLeft;
     
     const CGFloat topRightCenterX = maxX - topRight;
     const CGFloat topRightCenterY = minY + topRight;
     
     const CGFloat bottomLeftCenterX = minX +  bottomLeft;
     const CGFloat bottomLeftCenterY = maxY - bottomLeft;
     
     const CGFloat bottomRightCenterX = maxX -  bottomRight;
     const CGFloat bottomRightCenterY = maxY - bottomRight;
     /*
      path : 路径
      m : 变换
      x  y : 画圆的圆心点
      radius : 圆的半径
      startAngle : 起始角度
      endAngle ： 结束角度
      clockwise : 是否是顺时针
      void CGPathAddArc(CGMutablePathRef cg_nullable path,
      const CGAffineTransform * __nullable m,
      CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle,
      bool clockwise)
      */
     //虽然顺时针参数是YES，在iOS中的UIView中，这里实际是逆时针
     
     CGMutablePathRef path = CGPathCreateMutable();
     //顶 左
     CGPathAddArc(path, NULL, topLeftCenterX, topLeftCenterY,topLeft, M_PI, 3 * M_PI_2, NO);
     //顶 右
     CGPathAddArc(path, NULL, topRightCenterX , topRightCenterY, topRight, 3 * M_PI_2, 0, NO);
     //底 右
     CGPathAddArc(path, NULL, bottomRightCenterX, bottomRightCenterY, bottomRight,0, M_PI_2, NO);
     //底 左
     CGPathAddArc(path, NULL, bottomLeftCenterX, bottomLeftCenterY, bottomLeft, M_PI_2,M_PI, NO);
     CGPathCloseSubpath(path);
     return path;
}

@end
