//
//  SettingViewController.h
//  TrueLoveFinder
//
//  Created by mac on 1/27/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileDetailViewController.h"
@interface SettingViewController : UIViewController {
    ProfileDetailViewController *profileDetailVC;
}
@property (weak, nonatomic) IBOutlet UIImageView *imgProfile;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIView *blurViewProfile;
@property (weak, nonatomic) IBOutlet UIImageView *blurImageViewProfile;

@end
