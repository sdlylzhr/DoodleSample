//
//  Shape.m
//  DoodleViewSample
//
//  Created by lizhongren on 15/11/6.
//  Copyright © 2015年 lizhongren. All rights reserved.
//

#import "Shape.h"

@implementation Shape

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.points = [NSMutableArray array];
        self.lineCapStyle = kCGLineCapRound;
        self.lineJoinStyle = kCGLineJoinRound;
        self.cornerRadius = 20;
    }
    return self;
}

+ (instancetype)shape
{
    id line = [[[self class] alloc] init];
    return line;
}

- (void)addPointWithTouch:(NSSet *)touches inView:(UIView *)view
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:view];
    
    NSString *point = NSStringFromCGPoint(p);
    
    [self.points addObject:point];
}

- (void)drawWithRect:(CGRect)rect
{
    if (self.type == ShapeTypeImage) {
//        int width = self.pickedImage.size.width;
//        int height = self.pickedImage.size.height;
//        CGRect rectForImage = CGRectMake(0,0, width, height);
//        [self.pickedImage drawInRect:rectForImage];

    } else {
        UIBezierPath *pathLines = [self path];
        
        if (pathLines) {
            [self.color set];
            pathLines.lineWidth = self.width;
            pathLines.lineJoinStyle = self.lineJoinStyle; //拐角的处理
            pathLines.lineCapStyle = self.lineCapStyle; //最后点的处理
            [pathLines stroke];
        }
    }
}

@end

@implementation Shape (BezierPath)

- (UIBezierPath *)path
{
    UIBezierPath *path = nil;
    
    switch (self.type) {
        case ShapeTypeFreedom:
        {
            path = [self freedomPath];
        }
            break;
        case ShapeTypeLine:
        {
            path = [self linePath];
        }
            break;
        case ShapeTypeRound:
        {
            path = [self roundPath];
        }
            break;
        case ShapeTypeRect:
        {
            path = [self rectPath];
        }
            break;
        case ShapeTypeRoundRect:
        {
            path = [self roundRectPath];
        }
            break;
        default:
            
            path = nil;
            
            break;
    }
    return path;
}

- (UIBezierPath *)freedomPath
{
    UIBezierPath* pathLines = UIBezierPath.bezierPath;
    NSString *p1 = [self.points firstObject];
    CGPoint point1 = CGPointFromString(p1);
    [pathLines moveToPoint: point1];
    [pathLines addLineToPoint:point1];
    for (NSInteger i = 1; i < self.points.count; i++) {
        NSString *p1 = [self.points objectAtIndex:i];
        CGPoint point1 = CGPointFromString(p1);
        [pathLines addLineToPoint:point1];
    }
    return pathLines;
}

- (UIBezierPath *)roundPath
{
    CGRect rect = [self rectWithPoints];
    UIBezierPath* pathLines = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    return pathLines;
}

- (UIBezierPath *)rectPath
{
    CGRect rect = [self rectWithPoints];

    UIBezierPath* pathLines = [UIBezierPath bezierPathWithRect:rect];
    
    return pathLines;
}

- (UIBezierPath *)roundRectPath
{
    CGRect rect = [self rectWithPoints];
    UIBezierPath* pathLines = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:self.cornerRadius];
    
    return pathLines;
}

- (UIBezierPath *)linePath
{
    NSString *p1 = [self.points firstObject];
    CGPoint point1 = CGPointFromString(p1);
    
    NSString *p2 = [self.points lastObject];
    CGPoint point2 = CGPointFromString(p2);
    
    
    UIBezierPath* pathLines = UIBezierPath.bezierPath;
    
    [pathLines moveToPoint: point1];
    [pathLines addLineToPoint:point2];
    
    return pathLines;
}

- (CGRect)rectWithPoints
{
    NSString *p1 = [self.points firstObject];
    CGPoint point1 = CGPointFromString(p1);
    
    NSString *p2 = [self.points lastObject];
    CGPoint point2 = CGPointFromString(p2);
    
    CGRect rect = CGRectMake(point1.x, point1.y, point2.x - point1.x, point2.y - point1.y);
    return rect;
}


@end

@implementation Shape (Deprecated_Nonfunctional)

- (CGPoint)pointWithIndex:(NSInteger)index
{
    NSString *str = [self.points objectAtIndex:index];
    
    if (0 == str.length) {
        return CGPointZero;
    } else {
        return CGPointFromString(str);
    }
}

@end
