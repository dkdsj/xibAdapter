//
//  UITextView+BInspectable.m
//  OCIBInspectableDm
//
//  Created by zz on 2021/8/18.
//

#import "UITextView+BInspectable.h"
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

@implementation UITextView (BInspectable)

- (CGFloat)fixUltraLightFont {
    //NSLog(@"%@", self);
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setFixUltraLightFont:(CGFloat)fixUltraLightFont {
    //NSLog(@"%@", self);
    objc_setAssociatedObject(self, @selector(fixUltraLightFont), @(fixUltraLightFont), OBJC_ASSOCIATION_ASSIGN);
    
    if (0 >= fixUltraLightFont) {
        return;
    }

    self.font = [UIFont systemFontOfSize:kAdaptW(fixUltraLightFont) weight:UIFontWeightUltraLight];
}

- (CGFloat)fixThinFont {
    //NSLog(@"%@", self);
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setFixThinFont:(CGFloat)fixThinFont {
    //NSLog(@"%@", self);
    objc_setAssociatedObject(self, @selector(fixThinFont), @(fixThinFont), OBJC_ASSOCIATION_ASSIGN);
    
    if (0 >= fixThinFont) {
        return;
    }

    self.font = [UIFont systemFontOfSize:kAdaptW(fixThinFont) weight:UIFontWeightThin];
}

- (CGFloat)fixLightFont {
    //NSLog(@"%@", self);
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setFixLightFont:(CGFloat)fixLightFont {
    //NSLog(@"%@", self);
    objc_setAssociatedObject(self, @selector(fixLightFont), @(fixLightFont), OBJC_ASSOCIATION_ASSIGN);
    
    if (0 >= fixLightFont) {
        return;
    }

    self.font = [UIFont systemFontOfSize:kAdaptW(fixLightFont) weight:UIFontWeightLight];
}

- (CGFloat)fixRegularFont {
    //NSLog(@"%@", self);
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setFixRegularFont:(CGFloat)fixRegularFont {
    //NSLog(@"%@", self);
    objc_setAssociatedObject(self, @selector(fixRegularFont), @(fixRegularFont), OBJC_ASSOCIATION_ASSIGN);
    
    if (0 >= fixRegularFont) {
        return;
    }

    self.font = [UIFont systemFontOfSize:kAdaptW(fixRegularFont) weight:UIFontWeightRegular];
}

- (CGFloat)fixMediumFont {
    //NSLog(@"%@", self);
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setFixMediumFont:(CGFloat)fixMediumFont {
    //NSLog(@"%@", self);
    objc_setAssociatedObject(self, @selector(fixMediumFont), @(fixMediumFont), OBJC_ASSOCIATION_ASSIGN);
    
    if (0 >= fixMediumFont) {
        return;
    }

    self.font = [UIFont systemFontOfSize:kAdaptW(fixMediumFont) weight:UIFontWeightMedium];
}

- (CGFloat)fixSemiboldFont {
    //NSLog(@"%@", self);
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setFixSemiboldFont:(CGFloat)fixSemiboldFont {
    //NSLog(@"%@", self);
    objc_setAssociatedObject(self, @selector(fixSemiboldFont), @(fixSemiboldFont), OBJC_ASSOCIATION_ASSIGN);
    
    if (0 >= fixSemiboldFont) {
        return;
    }
    
    self.font = [UIFont systemFontOfSize:kAdaptW(fixSemiboldFont) weight:UIFontWeightSemibold];
}

- (CGFloat)fixBoldFont {
    //NSLog(@"%@", self);
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setFixBoldFont:(CGFloat)fixBoldFont {
    //NSLog(@"%@", self);
    objc_setAssociatedObject(self, @selector(fixBoldFont), @(fixBoldFont), OBJC_ASSOCIATION_ASSIGN);
    
    if (0 >= fixBoldFont) {
        return;
    }

    self.font = [UIFont systemFontOfSize:kAdaptW(fixBoldFont) weight:UIFontWeightBold];
}

- (CGFloat)fixHeavyFont {
    //NSLog(@"%@", self);
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setFixHeavyFont:(CGFloat)fixHeavyFont {
    //NSLog(@"%@", self);
    objc_setAssociatedObject(self, @selector(fixHeavyFont), @(fixHeavyFont), OBJC_ASSOCIATION_ASSIGN);
    
    if (0 >= fixHeavyFont) {
        return;
    }

    self.font = [UIFont systemFontOfSize:kAdaptW(fixHeavyFont) weight:UIFontWeightHeavy];
}

- (CGFloat)fixBlackFont {
    //NSLog(@"%@", self);
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
- (void)setFixBlackFont:(CGFloat)fixBlackFont {
    //NSLog(@"%@", self);
    objc_setAssociatedObject(self, @selector(fixBlackFont), @(fixBlackFont), OBJC_ASSOCIATION_ASSIGN);
    
    if (0 >= fixBlackFont) {
        return;
    }

    self.font = [UIFont systemFontOfSize:kAdaptW(fixBlackFont) weight:UIFontWeightBlack];
}

@end
