//
//  AutoLayoutHelper.h
//  moonit
//
//  Created by Ali Ersöz on 8/6/15.
//  Copyright (c) 2015 moonit. All rights reserved.
//

#import <Foundation/Foundation.h>
@import PureLayout;

typedef struct HorizontalInsets { CGFloat left, right; } HorizontalInsets;
typedef struct VerticalInsets { CGFloat top, bottom; } VerticalInsets;

UIKIT_STATIC_INLINE HorizontalInsets HorizontalInsetsMake(CGFloat left, CGFloat right) {
	HorizontalInsets insets = {left, right};
	return insets;
}

UIKIT_STATIC_INLINE VerticalInsets VerticalInsetsMake(CGFloat top, CGFloat bottom) {
	VerticalInsets insets = {top, bottom};
	return insets;
}

typedef struct Pinnable {
	CGFloat leading;
	BOOL flexible;
	CGFloat trailing;
} Pinnable;

UIKIT_STATIC_INLINE Pinnable Flex() {
	Pinnable vals = {0, true, 0};
	return vals;
}

UIKIT_STATIC_INLINE Pinnable FlexLeading(CGFloat leading) {
	Pinnable vals = {leading, true, 0};
	return vals;
}

UIKIT_STATIC_INLINE Pinnable FlexTrailing(CGFloat trailing) {
	Pinnable vals = {0, true, trailing};
	return vals;
}

UIKIT_STATIC_INLINE Pinnable Sticky() {
	Pinnable vals = {0, false, 0};
	return vals;
}

UIKIT_STATIC_INLINE Pinnable StickyTrailing(CGFloat trailing) {
	Pinnable vals = {0, false, trailing};
	return vals;
}

UIKIT_STATIC_INLINE Pinnable StickyLeading(CGFloat leading) {
	Pinnable vals = {leading, false, 0};
	return vals;
}

@interface Pin : NSObject

@property(nonatomic, assign) Pinnable values;
@property(nonatomic, strong) UIView *view;
@property(nonatomic, assign) BOOL centered;

+ (Pin *)view:(UIView *)view values:(struct Pinnable)values;
+ (Pin *)view:(UIView *)view values:(struct Pinnable)values centered:(BOOL)centered;

@end

@interface UIView (StackedLayout)

@property(nonatomic, strong) NSLayoutConstraint *rightConstraint;
@property(nonatomic, strong) NSLayoutConstraint *leftConstraint;
@property(nonatomic, strong) NSLayoutConstraint *topConstraint;
@property(nonatomic, strong) NSLayoutConstraint *bottomConstraint;

- (UIView *)horizontallyPin:(NSArray *)views;
- (UIView *)horizontal;
- (UIView *)horizontalInset:(HorizontalInsets)insets;

- (UIView *)verticallyPin:(NSArray *)views;
- (UIView *)vertical;
- (UIView *)verticalInset:(VerticalInsets)insets;

- (UIView *)withSize:(CGSize)size;
- (UIView *)withHeight:(float)height;
- (UIView *)withWidth:(float)width;

- (UIView *)pinEdge:(ALEdge)edge toEdge:(ALEdge)toEdge ofView:(UIView *)view withOffset:(CGFloat)offset;
- (UIView *)pinToSuperviewEdge:(ALEdge)edge withInset:(CGFloat)inset;

- (UIView *)top:(float)top;
- (UIView *)left:(float)left;
- (UIView *)right:(float)right;
- (UIView *)bottom:(float)bottom;

- (UIView *)pinTo:(UIView *)view top:(float)to;
- (UIView *)pinTo:(UIView *)view left:(float)left;
- (UIView *)pinTo:(UIView *)view bottom:(float)bottom;
- (UIView *)pinTo:(UIView *)view right:(float)right;

- (UIView *)alignTo:(UIView *)view top:(float)to;
- (UIView *)alignTo:(UIView *)view left:(float)left;
- (UIView *)alignTo:(UIView *)view bottom:(float)bottom;
- (UIView *)alignTo:(UIView *)view right:(float)right;

- (UIView *)centeredOnX;
- (UIView *)centeredOnY;

@end
