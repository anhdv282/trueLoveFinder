//
//  ProfileDetailViewController.m
//  TrueLoveFinder
//
//  Created by mac on 2/9/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import "ProfileDetailViewController.h"

@interface ProfileDetailViewController ()

@end

@implementation ProfileDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateBlurView:self.imageViewProfile withAlpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Change View To Blur View
- (void) updateBlurView:(UIView*) viewCurrent withAlpha:(CGFloat) alpha {
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [viewCurrent setAlpha:alpha];
    visualEffectView.frame = CGRectMake(0, 0, viewCurrent.frame.size.width, viewCurrent.frame.size.height);
    //    visualEffectView.frame = viewCurrent.bounds;
    [viewCurrent addSubview:visualEffectView];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
