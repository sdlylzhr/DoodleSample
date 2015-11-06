//
//  DoodleView.m
//  DoodleViewSample
//
//  Created by lizhongren on 15/11/5.
//  Copyright © 2015年 lizhongren. All rights reserved.
//

#import "DoodleView.h"
#import "Shape.h"

@interface DoodleView ()

// 装图像 的数组
@property (nonatomic, strong) NSMutableArray *shapesArr;

@end

@implementation DoodleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultSetup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self defaultSetup];
}

- (void)defaultSetup
{
    self.shapesArr = [NSMutableArray array];
    self.backgroundColor = [UIColor yellowColor];
    //        self.pickedImage = [UIImage imageNamed:@"11.jpg"];
    
    self.color = [UIColor blackColor]; // 线条默认选择黑色
    self.width = 5; // 默认宽度
    self.type = ShapeTypeFreedom; // 图像默认自由样式
    self.cornerRadius = 20; //
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    for (Shape *shape in self.shapesArr) {
        [shape drawWithRect:rect];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 每次手接触到屏幕, 都是一个图像的开始
    Shape *shape = [Shape shape];
    
    shape.width = self.width;
    shape.color = self.color;
    shape.type = self.type;
    // 将一条新的图像放到大数组中
    [self.shapesArr addObject:shape];
    [shape addPointWithTouch:touches inView:self];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    Shape *shape = [self.shapesArr lastObject];
    [shape addPointWithTouch:touches inView:self];
    [self setNeedsDisplay];// 会自己调用drawRect:方法
}

@end
