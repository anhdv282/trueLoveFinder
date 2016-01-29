//
//  ViewController.m
//  TrueLoveFinder
//
//  Created by mac on 1/5/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
//@property (nonatomic, strong) NSArray *colors,*names;
@property (nonatomic, strong) NSMutableArray *persons,*photos;
@property (nonatomic) NSUInteger index;

@property (nonatomic) BOOL loadCardFromXib;
@end

@implementation ViewController

// Model: Name/ Age/ Gender/ Image/ Work/ School/ Desc/ Interest/ Friends
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    [self initCirclePercentageView];
    [self initSwipeableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initSwipeableView {
    //    ZLSwipeableView *swipeableView = [[ZLSwipeableView alloc] initWithFrame:CGRectZero];
    //    self.swipeableView = swipeableView;
    //    [self.view addSubview:self.swipeableView];
    // Required Data Source
    self.swipeableView.dataSource = self;
    // Optional Delegate
    self.swipeableView.delegate = self;
    self.swipeableView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void) initCirclePercentageView {
    self.circlePercentageView.dataSource = self;
    self.circlePercentageView.percentage              = 0.0;
    self.circlePercentageView.linePercentage          = 0.15;
    self.circlePercentageView.animationDuration       = DELAY_RECORDING;
    self.circlePercentageView.decimalPlaces           = 1;
    self.circlePercentageView.showTextLabel           = NO;
//    self.circlePercentageView.animatesBegining        = NO;
    self.circlePercentageView.fillColor               = [UIColor greenColor];
    self.circlePercentageView.unfillColor             = [MCUtil iOS7DefaultGrayColorForBackground];
    self.circlePercentageView.textLabel.textColor     = [UIColor blackColor];
    self.circlePercentageView.textLabel.font          = [UIFont systemFontOfSize:50];
    self.circlePercentageView.gradientColor1          = COLOR_YELLOW_MAIN;
    self.circlePercentageView.gradientColor2          = [MCUtil iOS7DefaultGrayColorForBackground];
    self.circlePercentageView.enableGradient          = YES;
}

- (void) initData {
    self.index = 0;
    self.persons = [[NSMutableArray alloc] init];
    self.photos = [[NSMutableArray alloc] initWithArray:@[@"hami.jpg",@"huyenmy.jpg",@"midu.jpg"]];
    Person *person1 = [[Person alloc] init];
    Person *person2 = [[Person alloc] init];
    Person *person3 = [[Person alloc] init];
    [person1 setPerson:@"Hà Mi" images:self.photos];
    [person2 setPerson:@"Huyền My" images:self.photos];
    [person3 setPerson:@"Mỹ Dung" images:self.photos];
    [self.persons addObject:person1];
    [self.persons addObject:person2];
    [self.persons addObject:person3];
    self.isRecording = false;
}

- (void)viewDidLayoutSubviews {
    [self.swipeableView loadViewsIfNeeded];
}

#pragma mark - Action
- (IBAction)btnUnLikeTapped:(UIButton *)sender {
    [self.swipeableView swipeTopViewToLeft];
}

- (IBAction)btnLikeTapped:(UIButton *)sender {
    [self.swipeableView swipeTopViewToRight];
}

- (IBAction)tapStartStopRecording:(id)sender {
    if (self.isRecording == false) {
        [self.imgStartStop setImage:[UIImage imageNamed:@"stop-icon"]];
        self.isRecording = true;
        [self runCirclePercentage];
    } else {
        [self.imgStartStop setImage:[UIImage imageNamed:@"start-icon"]];
        self.isRecording = false;
        self.circlePercentageView.percentage = 0.0;
        self.circlePercentageView.animationEnabled = NO;
    }
}

#pragma mark - ZLSwipeableViewDelegate

- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction {
    NSLog(@"did swipe in direction: %zd", direction);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView didCancelSwipe:(UIView *)view {
    NSLog(@"did cancel swipe");
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
  didStartSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
          swipingView:(UIView *)view
           atLocation:(CGPoint)location
          translation:(CGPoint)translation {
    NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f", location.x, location.y,
          translation.x, translation.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didEndSwipingView:(UIView *)view
           atLocation:(CGPoint)location {
    NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
}

#pragma mark - ZLSwipeableViewDataSource

- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
    if (self.index >= self.persons.count) {
        self.index = 0;
    }
    
    CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
//    if (self.index == 1) {
//        view.backgroundColor = COLOR_GREEN_SEA;
//    } else if (self.index == 0){
//        view.backgroundColor = COLOR_NEPHRITIS;
//    }else {
//        view.backgroundColor = COLOR_TURQUOISE;
    view.backgroundColor = [UIColor whiteColor];
//    }
    
    Person *person = [[Person alloc] init];
    person = self.persons[self.index];
    [view updateInfo:person.name imageName:person.images[self.index]];
    self.index++;
    
    return view;
}
#pragma mark - MCPercentageDoughnut
- (UIView*)viewForCenterOfPercentageDoughnutView:(MCPercentageDoughnutView *)pecentageDoughnutView
                                  withCenterView:(UIView *)centerView {
//    centerView.bounds = CGRectMake(6, 5, 30, 30);
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"play_icon"]];
//    imageView.frame = centerView.bounds;
    return nil;
}
- (void)setView:(UIView *)currentView setX:(CGFloat) newX setY:(CGFloat) newY {
    CGRect frame = currentView.frame;
    frame.origin.x = newX;
    frame.origin.y = newY;
    currentView.frame = frame;
}
- (void) runCirclePercentage {
    self.circlePercentageView.animatesBegining = YES;
    self.circlePercentageView.percentage = 1.0;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((DELAY_RECORDING-1) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.circlePercentageView.percentage == 1.0) {
            self.circlePercentageView.percentage = 0.0;
            self.circlePercentageView.animationEnabled = NO;
            [self.imgStartStop setImage:[UIImage imageNamed:@"start-icon"]];
        }
    });
}
#pragma mark - Random Function
-(int) generateRandomNumberWithlowerBound:(int)lowerBound
                               upperBound:(int)upperBound
{
    int rndValue = lowerBound + arc4random() % (upperBound - lowerBound);
    return rndValue;
}
@end
