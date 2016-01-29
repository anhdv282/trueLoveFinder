//
//  CardView.m
//  TrueLoveFinder
//
//  Created by mac on 1/5/16.
//  Copyright © 2016 vad. All rights reserved.
//
#define WIDTH_VIEW self.frame.size.width
#define HEIGHT_VIEW self.frame.size.height
#import "CardView.h"

@implementation CardView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}
UILabel *lblName;
UIImageView *imageView;
UIView *viewWorkAge;
UILabel *lblWork;
UILabel *lblAge;
UILabel *lblSchool;

- (void)setup {
    // Shadow
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.33;
    self.layer.shadowOffset = CGSizeMake(0, 1.5);
    self.layer.shadowRadius = 4.0;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    // Corner Radius
    self.layer.cornerRadius = 10.0;//
    lblName = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, WIDTH_VIEW - 20, 30)];//44
    lblName.textColor = [UIColor blackColor];
    lblName.text = @"name";
    lblName.textAlignment = NSTextAlignmentCenter;
    lblName.textColor = COLOR_TEXT_BLUE;
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, WIDTH_VIEW, WIDTH_VIEW)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    viewWorkAge = [[UIView alloc] initWithFrame:CGRectMake(10, 50 + WIDTH_VIEW + 8, WIDTH_VIEW - 20, 30)];
    lblWork = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, viewWorkAge.frame.size.width/2, 30)];
    lblAge = [[UILabel alloc] initWithFrame:CGRectMake(viewWorkAge.frame.size.width/2, 0, viewWorkAge.frame.size.width/2, 30)];
    lblAge.textAlignment = NSTextAlignmentRight;
    lblWork.text = @"Emotiv";//
    lblAge.text = @"23";//
    lblWork.textColor = COLOR_TEXT_BLUE;
    lblAge.textColor = COLOR_TEXT_BLUE;
    [viewWorkAge addSubview:lblWork];
    [viewWorkAge addSubview:lblAge];
    
    self.viewDidChoose = [[UIView alloc] initWithFrame:CGRectMake(WIDTH_VIEW/2 - 50, HEIGHT_VIEW/2 - 50, 50, 50)];
    [self.viewDidChoose setHidden:YES];
    
    [self addSubview:lblName];
    [self addSubview:imageView];
    [self addSubview:viewWorkAge];
    [self addSubview:self.viewDidChoose];
}

- (void) updateInfo:(NSString*) name
          imageName:(NSString*) imageName {
    lblName.text = name;
    [imageView setImage:[UIImage imageNamed:imageName]];
}

@end
