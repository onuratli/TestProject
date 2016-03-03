//
//  ControlsHelper.h
//  moonit
//
//  Created by Ali Ersöz on 8/6/15.
//  Copyright (c) 2015 moonit. All rights reserved.
//

#import <Foundation/Foundation.h>
@import PureLayout;

@interface UIControl (Helpers)

- (UIControl *)round;

@end

@interface UIView (Helpers)

- (UIButton *)backgroundColor:(UIColor *)color;

@end

@interface UIButton (Helpers)

+ (UIButton *)withText:(NSString *)title;
+ (UIButton *)withURLString:(NSString *)urlString;
+ (UIButton *)withImage:(UIImage *)image;
+ (UIButton *)withImageName:(NSString *)imageName;
+ (UIButton *)withTemplateImageName:(NSString *)imageName;

- (UIButton *)imageColor:(UIColor *)color;
- (UIButton *)color:(UIColor *)color;
- (UIButton *)backgroundColor:(UIColor *)color;
- (UIButton *)font:(UIFont *)font;
- (UIButton *)onTap:(SEL)selector withTarget:(id)target;
- (UIButton *)load:(NSString *)urlString;

@end

@interface UILabel (Helpers)

+ (UILabel *)withText:(NSString *)text;

- (UILabel *)centered;
- (UILabel *)multiline;
- (UILabel *)multilineWithCount:(int)count;
- (UILabel *)color:(UIColor *)color;
- (UILabel *)backgroundColor:(UIColor *)color;
- (UILabel *)font:(UIFont *)font;

@end

@interface UITableView (Helpers)

+ (UITableView *)plain;
+ (UITableView *)grouped;
- (UITableView *)delegate:(id)delegate;
- (UITableView *)registerCells:(NSArray *)cells;
- (UITableView *)registerCellsNamed:(NSDictionary *)cells;
@end

@interface NSObject (Helpers)

- (NSString *)className;

@end

@interface UIImageView (Helpers)

+ (UIImageView *)withImageName:(NSString *)imageName;
+ (UIImageView *)withImage:(UIImage *)image;
+ (UIImageView *)withTemplateImageName:(NSString *)imageName;
+ (UIImageView *)withURLString:(NSString *)urlString;
- (UIImageView *)backgroundColor:(UIColor *)color;
- (UIImageView *)centered;
- (UIImageView *)color:(UIColor *)color;
- (UIImageView *)load:(NSString *)urlString;

@end

@interface UITextView (Helpers)

+ (UITextView *)withDelegate:(id)delegate;
- (UITextView *)color:(UIColor *)color;
- (UITextView *)backgroundColor:(UIColor *)color;
- (UITextView *)font:(UIFont *)font;

@end
