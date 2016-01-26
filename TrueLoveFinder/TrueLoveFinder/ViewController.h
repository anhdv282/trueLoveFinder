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
@interface ViewController : UIViewController <ZLSwipeableViewDataSource,ZLSwipeableViewDelegate>

//@property (nonatomic, strong) ZLSwipeableView *swipeableView;
@property (weak, nonatomic) IBOutlet ZLSwipeableView *swipeableView;

- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView;
@end

