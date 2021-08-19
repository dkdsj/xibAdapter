//
//  UITextField+BInspectable.h
//  OCIBInspectableDm
//
//  Created by zz on 2021/8/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 按照这个顺序，最后设置的(size > 0)生效，
 UIKIT_EXTERN const UIFontWeight UIFontWeightUltraLight;
 UIKIT_EXTERN const UIFontWeight UIFontWeightThin;
 UIKIT_EXTERN const UIFontWeight UIFontWeightLight;
 UIKIT_EXTERN const UIFontWeight UIFontWeightRegular;
 UIKIT_EXTERN const UIFontWeight UIFontWeightMedium;
 UIKIT_EXTERN const UIFontWeight UIFontWeightSemibold;
 UIKIT_EXTERN const UIFontWeight UIFontWeightBold;
 UIKIT_EXTERN const UIFontWeight UIFontWeightHeavy;
 UIKIT_EXTERN const UIFontWeight UIFontWeightBlack;
 */
@interface UITextField (BInspectable)

@property (nonatomic, assign) IBInspectable CGFloat fixUltraLightFont;
@property (nonatomic, assign) IBInspectable CGFloat fixThinFont;
@property (nonatomic, assign) IBInspectable CGFloat fixLightFont;
@property (nonatomic, assign) IBInspectable CGFloat fixRegularFont;
@property (nonatomic, assign) IBInspectable CGFloat fixMediumFont;
@property (nonatomic, assign) IBInspectable CGFloat fixSemiboldFont;
@property (nonatomic, assign) IBInspectable CGFloat fixBoldFont;
@property (nonatomic, assign) IBInspectable CGFloat fixHeavyFont;
@property (nonatomic, assign) IBInspectable CGFloat fixBlackFont;

@end

NS_ASSUME_NONNULL_END
