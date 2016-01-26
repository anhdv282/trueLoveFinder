//
//  ViewController.m
//  TrueLoveFinder
//
//  Created by mac on 1/5/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#define COLOR_TURQUOISE [UIColor colorWithRed:0.10196078431372549 green:0.7372549019607844 blue:0.611764705882353 alpha:1.0]
#define COLOR_GREEN_SEA [UIColor colorWithRed:0.08627450980392157 green:0.6274509803921569 blue:0.5215686274509804 alpha:1.0]
#define COLOR_NEPHRITIS [UIColor colorWithRed:0.15294117647058825 green:0.6823529411764706 blue:0.3764705882352941 alpha:1.0]
@interface ViewController ()
//@property (nonatomic, strong) NSArray *colors,*names;
@property (nonatomic, strong) NSMutableArray *persons,*photos;
@property (nonatomic) NSUInteger index;

@property (nonatomic) BOOL loadCardFromXib;
@end

@implementation ViewController
// 1. initData
// 2. add ZLSwipe
// 3. add view and button

// Model: Name/ Age/ Gender/ Image/ Work/ School/ Desc/ Interest/ Friends
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initData {
    self.index = 0;
    self.persons = [[NSMutableArray alloc] init];
    self.photos = [[NSMutableArray alloc] initWithArray:@[@"thuthao.jpg",@"huyenmy.jpg",@"midu.jpg"]];
    Person *person1 = [[Person alloc] init];
    Person *person2 = [[Person alloc] init];
    Person *person3 = [[Person alloc] init];
    [person1 setPerson:@"Viet Anh" images:self.photos];
    [person2 setPerson:@"Vit Em" images:self.photos];
    [person3 setPerson:@"Vit Vit" images:self.photos];
    [self.persons addObject:person1];
    [self.persons addObject:person2];
    [self.persons addObject:person3];
//    ZLSwipeableView *swipeableView = [[ZLSwipeableView alloc] initWithFrame:CGRectZero];
//    self.swipeableView = swipeableView;
//    [self.view addSubview:self.swipeableView];
    // Required Data Source
    self.swipeableView.dataSource = self;
    
    // Optional Delegate
    self.swipeableView.delegate = self;
    
    self.swipeableView.translatesAutoresizingMaskIntoConstraints = NO;
//    NSDictionary *metrics = @{};
//    
//    [self.view addConstraints:[NSLayoutConstraint
//                               constraintsWithVisualFormat:@"|-10-[swipeableView]-10-|"
//                               options:0
//                               metrics:metrics
//                               views:NSDictionaryOfVariableBindings(
//                                                                    swipeableView)]];
//    
//    [self.view addConstraints:[NSLayoutConstraint
//                               constraintsWithVisualFormat:@"V:|-80-[swipeableView]-100-|"
//                               options:0
//                               metrics:metrics
//                               views:NSDictionaryOfVariableBindings(
//                                                                    swipeableView)]];
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
@end
