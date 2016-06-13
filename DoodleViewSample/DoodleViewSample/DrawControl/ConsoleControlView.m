//
//  ConsoleControlView.m
//  DoodleViewSample
//
//  Created by lizhongren on 15/11/6.
//  Copyright © 2015年 lizhongren. All rights reserved.
//

#import "ConsoleControlView.h"
#import "DoodleView.h"
#import "KZColorPicker.h"


@interface ConsoleControlView ()

@property (nonatomic, strong) UIView *containerView;

@property (weak, nonatomic) IBOutlet UIButton *colorButton;
@property (weak, nonatomic) IBOutlet DoodleView *drawView;

- (IBAction)pickDrawType:(id)sender;

- (IBAction)widthSliderAction:(id)sender;

- (IBAction)pickColor:(id)sender;

@end

@implementation ConsoleControlView
{
    KZColorPicker *picker;
}

+ (instancetype)consoleControlCreate
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ConsoleControlView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib
{
    // 取色盘通过代码创建
    
    [self setupColorPickerView];
}

// 绘制图像类型方法
- (IBAction)pickDrawType:(UIButton *)sender {
    
    self.drawView.type = sender.tag;
    NSLog(@"%ld", self.drawView.type);
}

// 宽度选取slider方法
- (IBAction)widthSliderAction:(UISlider *)sender {
    
    self.drawView.width = sender.value;
}

// 获取颜色按钮点击方法
- (IBAction)pickColor:(id)sender {
    
    [self bringSubviewToFront:self.containerView];
    self.containerView.hidden = NO;
}

// 取色器选取颜色方法
- (void)pickerChanged:(KZColorPicker *)picker1
{
    self.drawView.color = [picker selectedColor];
    self.colorButton.backgroundColor = [picker selectedColor];
}

// 关闭取色器
- (void)closeColorPlate:(UIButton *)btn
{
    self.containerView.hidden = YES;
}

// 创建取色器
- (void)setupColorPickerView
{
    self.containerView = [[UIView alloc] initWithFrame: self.bounds];
    self.containerView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.containerView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.containerView];
    
    picker = [[KZColorPicker alloc] initWithFrame:self.containerView.bounds];
    picker.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    picker.selectedColor = [UIColor whiteColor];
    picker.oldColor = [UIColor whiteColor];
    [picker addTarget:self action:@selector(pickerChanged:) forControlEvents:UIControlEventValueChanged];
    [self.containerView addSubview:picker];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(275, 20, 80, 50);
    [btn addTarget:self action:@selector(closeColorPlate:) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:btn];
    
    NSLog(@"%@", NSStringFromCGRect(self.containerView.bounds));
    self.containerView.hidden = YES;
}

@end
