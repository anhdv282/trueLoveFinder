//
//  ViewController.h
//  TrueLoveFinder
//
//  Created by mac on 1/5/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLSwipeableView/ZLSwipeableView.h"
#import "CardView.h"
#import "MCPercentageDoughnutView.h"
#import "Macro.h"
@interface ViewController : UIViewController <ZLSwipeableViewDataSource,ZLSwipeableViewDelegate,MCPercentageDoughnutViewDataSource>

//@property (nonatomic, strong) ZLSwipeableView *swipeableView;
@property (weak, nonatomic) IBOutlet ZLSwipeableView *swipeableView;
@property (weak, nonatomic) IBOutlet MCPercentageDoughnutView *circlePercentageView;
@property (weak, nonatomic) IBOutlet UIImageView *imgStartStop;
@property (assign, nonatomic) BOOL isRecording;
- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView;
@end

