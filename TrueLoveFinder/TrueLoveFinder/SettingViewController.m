//
//  SettingViewController.m
//  TrueLoveFinder
//
//  Created by mac on 3/30/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingSpotyViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SettingSpotyViewController *spotyViewController = [[SettingSpotyViewController alloc] initWithMainImage:[UIImage imageNamed:@"midu.jpg"]];
    [self.view addSubview:spotyViewController.view];
    [self.view bringSubviewToFront:spotyViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
