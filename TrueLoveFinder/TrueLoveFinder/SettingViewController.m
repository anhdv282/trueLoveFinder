//
//  SettingViewController.m
//  TrueLoveFinder
//
//  Created by mac on 1/27/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imgProfile.image = [self roundedRectImageFromImage:self.imgProfile.image size:self.imgProfile.frame.size withCornerRadius:(self.imgProfile.frame.size.width/2)];
//    [self updateBlurView:self.blurViewProfile withAlpha:0.75];
    profileDetailVC = [[ProfileDetailViewController alloc] initWithNibName:@"ProfileDetailViewController" bundle:nil];
    profileDetailVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:profileDetailVC.view];
    [self.view sendSubviewToBack:profileDetailVC.view];
    [self addChildViewController:profileDetailVC];
    [profileDetailVC didMoveToParentViewController:self];
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

//round Image
- (UIImage*)roundedRectImageFromImage:(UIImage *)image
                                 size:(CGSize)imageSize
                     withCornerRadius:(float)cornerRadius {
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    CGRect bounds=(CGRect){CGPointZero,imageSize};
    [[UIBezierPath bezierPathWithRoundedRect:bounds
                                cornerRadius:cornerRadius] addClip];
    [image drawInRect:bounds];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return finalImage;
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
