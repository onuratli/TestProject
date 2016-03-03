//
//  ControlsHelper.m
//  moonit
//
//  Created by Ali Ersöz on 8/6/15.
//  Copyright (c) 2015 moonit. All rights reserved.
//

#import "ControlsHelper.h"
#import "PureLayout.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@implementation UIControl (Helpers)

- (UIControl *)round {
	return self;
}

@end

@implementation UIView (Helpers)

- (UIView *)backgroundColor:(UIColor *)color {
	[self setBackgroundColor:color];
	return self;
}

@end

@implementation UIButton (Helpers)

+ (UIButton *)withText:(NSString *)title {
	UIButton *button = [UIButton newAutoLayoutView];
	[button setTitle:title forState:UIControlStateNormal];
	[button.titleLabel setFont:[UIFont systemFontOfSize:12]];
	return button;
}

+ (UIButton *)withImage:(UIImage *)image {
	UIButton *button = [UIButton newAutoLayoutView];
	[button setImage:image forState:UIControlStateNormal];
	return button;
}

+ (UIButton *)withURLString:(NSString *)urlString {
	UIButton *button = [UIButton newAutoLayoutView];
	[button setContentMode:UIViewContentModeCenter];
	[button load:urlString];
	return button;
}

+ (UIButton *)withImageName:(NSString *)imageName {
	return [UIButton withImage:[UIImage imageNamed:imageName]];
}

+ (UIButton *)withTemplateImageName:(NSString *)imageName {
	return [UIButton withImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
}

- (UIButton *)imageColor:(UIColor *)color {
	[self setTintColor:color];
	return self;
}

- (UIButton *)color:(UIColor *)color {
	[self setTitleColor:color forState:UIControlStateNormal];
	return self;
}

- (UIButton *)backgroundColor:(UIColor *)color {
	[self setBackgroundColor:color];
	return self;
}

- (UIButton *)font:(UIFont *)font {
	[self.titleLabel setFont:font];
	return self;
}

- (UIButton *)onTap:(SEL)selector withTarget:(id)target {
	[self addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	return self;
}

- (UIButton *)load:(NSString *)urlString {
	[self sd_setImageWithURL:[NSURL URLWithString:urlString] forState:UIControlStateNormal];
	return self;
}

@end

@implementation UILabel (Helpers)

+ (UILabel *)withText:(NSString *)text {
	UILabel *label = [UILabel newAutoLayoutView];
	[label setText:text];
	return label;
}

- (UILabel *)centered {
	[self setTextAlignment:NSTextAlignmentCenter];
	return self;
}

- (UILabel *)multiline {
	[self multilineWithCount:0];
	return self;
}

- (UILabel *)multilineWithCount:(int)count {
	[self setNumberOfLines:count];
	[self setLineBreakMode:NSLineBreakByWordWrapping];
	return self;
}

- (UILabel *)color:(UIColor *)color {
	[self setTextColor:color];
	return self;
}

- (UILabel *)backgroundColor:(UIColor *)color {
	[self setBackgroundColor:color];
	return self;
}

- (UILabel *)font:(UIFont *)font {
	[self setFont:font];
	return self;
}

@end

@implementation UITableView (Helpers)

+ (UITableView *)plain {
	UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
	[tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
	return tableView;
}

+ (UITableView *)grouped {
	UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
	[tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
	return tableView;
}

- (UITableView *)delegate:(id)delegate {
	self.delegate = delegate;
	self.dataSource = delegate;

	return self;
}

- (UITableView *)registerCells:(NSArray *)cells {
	for (id cell in cells) {
		[self registerClass:cell forCellReuseIdentifier:NSStringFromClass(cell)];
	}

	return self;
}

- (UITableView *)registerCellsNamed:(NSDictionary *)cells {
	for (id key in [cells keyEnumerator]) {
		[self registerClass:[cells objectForKey:key] forCellReuseIdentifier:key];
	}

	return self;
}

@end

@implementation UIImageView (Helpers)

+ (UIImageView *)withImage:(UIImage *)image {
	UIImageView *imageView = [UIImageView newAutoLayoutView];
	[imageView setImage:image];
	[imageView setClipsToBounds:true];
	[imageView setContentMode:UIViewContentModeScaleAspectFit];
	return imageView;
}

+ (UIImageView *)withImageName:(NSString *)imageName {
	UIImageView *imageView = [UIImageView newAutoLayoutView];
	[imageView setImage:[UIImage imageNamed:imageName]];
	[imageView setContentMode:UIViewContentModeCenter];
	return imageView;
}

+ (UIImageView *)withTemplateImageName:(NSString *)imageName {
	return [UIImageView withImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
}

+ (UIImageView *)withURLString:(NSString *)urlString {
	UIImageView *imageView = [UIImageView newAutoLayoutView];
	[imageView setContentMode:UIViewContentModeScaleAspectFill];
	[imageView setClipsToBounds:true];
	[imageView load:urlString];
	return imageView;
}

- (UIImageView *)centered {
	[self setContentMode:UIViewContentModeCenter];
	return self;
}

- (UIImageView *)color:(UIColor *)color {
	[self setTintColor:color];
	return self;
}

- (UIImageView *)backgroundColor:(UIColor *)color {
	[self setBackgroundColor:color];
	return self;
}

- (UIImageView *)load:(NSString *)urlString {
	[self sd_setImageWithURL:[NSURL URLWithString:urlString]];
	return self;
}

@end

@implementation UITextView (Helpers)

+ (UITextView *)withDelegate:(id)delegate {
	UITextView *textView = [UITextView newAutoLayoutView];
	textView.delegate = delegate;
	return textView;
}

- (UITextView *)color:(UIColor *)color {
	[self setTextColor:color];
	return self;
}

- (UITextView *)backgroundColor:(UIColor *)color {
	[self setBackgroundColor:color];
	return self;
}

- (UITextView *)font:(UIFont *)font {
	[self setFont:font];
	return self;
}

@end

@implementation NSObject (Helpers)

- (NSString *)className {
	return NSStringFromClass([self class]);
}

@end
