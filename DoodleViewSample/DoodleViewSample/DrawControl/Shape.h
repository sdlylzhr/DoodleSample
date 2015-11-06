//
//  Shape.h
//  DoodleViewSample
//
//  Created by lizhongren on 15/11/6.
//  Copyright © 2015年 lizhongren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    ShapeTypeFreedom,
    ShapeTypeRound,
    ShapeTypeRect,
    ShapeTypeRoundRect,
    ShapeTypeLine,
    ShapeTypeImage
} ShapeType;

@interface Shape : NSObject

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSMutableArray *points;

@property (nonatomic, assign) CGLineJoin lineJoinStyle;
@property (nonatomic, assign) CGLineCap lineCapStyle;

@property (nonatomic, assign) ShapeType type;
@property (nonatomic, assign) CGFloat cornerRadius;

+ (instancetype)shape;
- (void)addPointWithTouch:(NSSet *)touches inView:(UIView *)view;
- (void)drawWithRect:(CGRect)rect;

@end

@interface Shape (BezierPath)

- (UIBezierPath *)path;

@end

@interface Shape (Deprecated_Nonfunctional)

- (CGPoint)pointWithIndex:(NSInteger)index NS_DEPRECATED_IOS(2.0, 9.0, "不用了");

@end

