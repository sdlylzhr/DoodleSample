//
//  DoodleView.h
//  DoodleViewSample
//
//  Created by lizhongren on 15/11/5.
//  Copyright © 2015年 lizhongren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shape.h"


@interface DoodleView : UIView

@property (nonatomic, assign) CGFloat width; // 当前选取的线条宽度
@property (nonatomic, strong) UIColor *color; // 当前选取的线条颜色

@property (nonatomic, assign) ShapeType type; // 当前选取的图像类型
@property (nonatomic, assign) CGFloat cornerRadius; // 当前选取的角度弧度(仅限圆角矩形)


// TODO:
@property (nonatomic, strong) UIImage *pickedImage; // 当前选取的图片

@end
