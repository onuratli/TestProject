//
//  AutoLayoutHelper.m
//  moonit
//
//  Created by Ali Ersöz on 8/6/15.
//  Copyright (c) 2015 moonit. All rights reserved.
//

#import "AutoLayoutHelper.h"
#import <objc/runtime.h>

@implementation Pin

+ (Pin *)view:(UIView *)view values:(struct Pinnable)values {
	Pin *pin = [Pin view:view values:values centered:true];
	return pin;
}

+ (Pin *)view:(UIView *)view values:(struct Pinnable)values centered:(BOOL)centered {
	Pin *pin = [Pin new];
	pin.view = view;
	pin.values = values;
	pin.centered = centered;
	return pin;
}

@end

@interface UIView () {
	// NSLayoutConstraint *_topConstraint;
	// NSLayoutConstraint *_leftConstraint;
	// NSLayoutConstraint *_rightConstraint;
	// NSLayoutConstraint *_bottomConstraint;
}

@end

@implementation UIView (StackedLayout)

@dynamic leftConstraint, rightConstraint, bottomConstraint;

- (NSLayoutConstraint *)topConstraint {
	return objc_getAssociatedObject(self, @selector(topConstraint));
}

- (void)setTopConstraint:(NSLayoutConstraint *)topConstraint {
	objc_setAssociatedObject(self, @selector(topConstraint), topConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setLeftConstraint:(NSLayoutConstraint *)leftConstraint {
	objc_setAssociatedObject(self, @selector(leftConstraint), leftConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)leftConstraint {
	return objc_getAssociatedObject(self, @selector(leftConstraint));
}

- (void)setRightConstraint:(NSLayoutConstraint *)rightConstraint {
	objc_setAssociatedObject(self, @selector(rightConstraint), rightConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)rightConstraint {
	return objc_getAssociatedObject(self, @selector(rightConstraint));
}

- (void)setBottomConstraint:(NSLayoutConstraint *)bottomConstraint {
	objc_setAssociatedObject(self, @selector(bottomConstraint), bottomConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)bottomConstraint {
	return objc_getAssociatedObject(self, @selector(bottomConstraint));
}

- (UIView *)horizontallyPin:(NSArray *)views {
	UIView *lastView = self;
	for (id viewItem in views) {
		if ([viewItem isKindOfClass:[NSArray class]]) {
			NSArray *pinArray = viewItem;
			for (Pin *pin in pinArray) {
				if (pin.centered) {
					[pin.view autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
				}

				if (lastView == self) {
					[pin.view autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:lastView withOffset:pin.values.leading];
				} else {
					[pin.view autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:lastView withOffset:pin.values.leading];
				}
			}

			lastView = ((Pin *)[pinArray lastObject]).view;
		} else {
			Pin *pin = (Pin *)viewItem;
			if (pin.centered) {
				[pin.view autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
			}

			if (lastView == self) {
				[pin.view autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:lastView withOffset:pin.values.leading];
			} else {
				[pin.view autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:lastView withOffset:pin.values.leading];
			}

			lastView = pin.view;
		}
	}

	[lastView autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:self];

	return self;
}

- (UIView *)verticallyPin:(NSArray *)views {
	UIView *lastView = self;
	for (Pin *pin in views) {
		if (pin.centered) {
			[pin.view autoAlignAxis:ALAxisVertical toSameAxisOfView:self];
		}

		if (lastView == self) {
			[pin.view autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:lastView withOffset:pin.values.leading];
		} else {
			[pin.view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:lastView withOffset:pin.values.leading];
		}

		lastView = pin.view;
	}

	[lastView autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self];
	return self;
}

- (UIView *)horizontal {
	[self horizontalInset:HorizontalInsetsMake(0, 0)];
	return self;
}

- (UIView *)horizontalInset:(HorizontalInsets)insets {
	[self autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:insets.left];
	[self autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:insets.right];
	return self;
}

- (UIView *)vertical {
	[self verticalInset:VerticalInsetsMake(0, 0)];
	return self;
}

- (UIView *)verticalInset:(VerticalInsets)insets {
	[self autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:insets.top];
	[self autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:insets.bottom];
	return self;
}

- (UIView *)withSize:(CGSize)size {
	[self autoSetDimensionsToSize:size];
	return self;
}

- (UIView *)withHeight:(float)height {
	[self autoSetDimension:ALDimensionHeight toSize:height];
	return self;
}

- (UIView *)withWidth:(float)width {
	[self autoSetDimension:ALDimensionWidth toSize:width];
	return self;
}

- (UIView *)pinEdge:(ALEdge)edge toEdge:(ALEdge)toEdge ofView:(UIView *)view withOffset:(CGFloat)offset {
	[self autoPinEdge:edge toEdge:toEdge ofView:view withOffset:offset];
	return self;
}

- (UIView *)pinToSuperviewEdge:(ALEdge)edge withInset:(CGFloat)inset {
	[self autoPinEdgeToSuperviewEdge:edge withInset:inset];
	return self;
}

- (UIView *)top:(float)top {
	self.topConstraint = [self autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:top];
	return self;
}

- (UIView *)left:(float)left {
	self.leftConstraint = [self autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:left];
	return self;
}

- (UIView *)right:(float)right {
	self.rightConstraint = [self autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:right];
	return self;
}

- (UIView *)bottom:(float)bottom {
	self.bottomConstraint = [self autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:bottom];
	return self;
}

- (UIView *)pinTo:(UIView *)view top:(float)top {
	self.topConstraint = [self autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:view withOffset:top];
	return self;
}

- (UIView *)pinTo:(UIView *)view left:(float)left {
	self.leftConstraint = [self autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:view withOffset:left];
	return self;
}

- (UIView *)pinTo:(UIView *)view bottom:(float)bottom {
	self.bottomConstraint = [self autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:view withOffset:bottom];
	return self;
}

- (UIView *)pinTo:(UIView *)view right:(float)right {
	self.rightConstraint = [self autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:view withOffset:right];
	return self;
}

- (UIView *)alignTo:(UIView *)view top:(float)top {
	self.topConstraint = [self autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:view withOffset:top];
	return self;
}

- (UIView *)alignTo:(UIView *)view left:(float)left {
	self.leftConstraint = [self autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:view withOffset:left];
	return self;
}

- (UIView *)alignTo:(UIView *)view bottom:(float)bottom {
	self.bottomConstraint = [self autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:view withOffset:bottom];
	return self;
}

- (UIView *)alignTo:(UIView *)view right:(float)right {
	self.rightConstraint = [self autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:view withOffset:right];
	return self;
}

- (UIView *)centeredOnX {
	[self autoAlignAxisToSuperviewAxis:ALAxisVertical];
	return self;
}

- (UIView *)centeredOnY {
	[self autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
	return self;
}

@end
