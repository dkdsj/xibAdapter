//
//  NSLayoutConstraint+BInspectable.m
//  OCIBInspectableDm
//
//  Created by zz on 2021/8/18.
//

#import "NSLayoutConstraint+BInspectable.h"
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

@implementation NSLayoutConstraint (BInspectable)

- (BOOL)adapterScreen {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setAdapterScreen:(BOOL)adapterScreen {
    objc_setAssociatedObject(self, @selector(adapterScreen), @(adapterScreen), OBJC_ASSOCIATION_ASSIGN);

    if (adapterScreen) {
        self.constant = kAdaptW(self.constant);
    }
}
@end
