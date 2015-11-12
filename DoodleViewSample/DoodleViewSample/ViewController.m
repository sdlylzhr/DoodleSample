//
//  ViewController.m
//  DoodleViewSample
//
//  Created by lizhongren on 15/11/5.
//  Copyright © 2015年 lizhongren. All rights reserved.
//

#import "ViewController.h"
#import "DoodleView.h"
#import "ConsoleControlView.h"
#import "UIView+fulu.h"

@interface ViewController () <UICollectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        
    ConsoleControlView *doodleView = [ConsoleControlView consoleControlCreate];
    doodleView.frame = self.view.bounds;
    [self.view addSubview:doodleView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
