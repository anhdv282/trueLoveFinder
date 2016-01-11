//
//  CardView.h
//  TrueLoveFinder
//
//  Created by mac on 1/5/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView
- (void) updateInfo:(NSString*) name
          imageName:(NSString*) imageName;
@property (strong,nonatomic) UIView * viewDidChoose;
@property (strong,nonatomic) UIImageView * viewImgLike;
@property (strong,nonatomic) UIImageView * viewImgUnlike;
@end
