//
//  MainScrollViewController.m
//  TrueLoveFinder
//
//  Created by mac on 1/20/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import "MainScrollViewController.h"

@interface MainScrollViewController ()

@end

@implementation MainScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initView {
    NSLog(@"%f",WIDTH_VIEW);
    SettingViewController *leftVC = [[SettingViewController alloc] init];
    [self addChildViewController:leftVC];
    [self.scrollView addSubview:leftVC.view];
    [self setView:leftVC.view setX:0 setY:0];
    [leftVC didMoveToParentViewController:self];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    [self addChildViewController:mainVC];
    [self.scrollView addSubview:mainVC.view];
    [mainVC didMoveToParentViewController:self];
    [self setView:mainVC.view setX:WIDTH_VIEW setY:0];
    [mainVC didMoveToParentViewController:self];
    
    ListMatchPersonViewController *rightVC = [[ListMatchPersonViewController alloc] init];
    [self addChildViewController:rightVC];
    [self.scrollView addSubview:rightVC.view];
    [self setView:rightVC.view setX:WIDTH_VIEW*2 setY:0];
    [rightVC didMoveToParentViewController:self];
    
    self.scrollView.contentSize = CGSizeMake(WIDTH_VIEW*NUMBER_PAGE_SCROLL, HEIGHT_VIEW);
    self.scrollView.pagingEnabled = YES;
}

- (void)setView:(UIView *)currentView setX:(CGFloat) newX setY:(CGFloat) newY {
    CGRect frame = currentView.frame;
    frame.origin.x = newX;
    frame.origin.y = newY;
    currentView.frame = frame;
}
@end
