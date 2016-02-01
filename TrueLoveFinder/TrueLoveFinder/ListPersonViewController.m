//
//  ListPersonViewController.m
//  TrueLoveFinder
//
//  Created by mac on 1/27/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import "ListPersonViewController.h"
#import "ListPersonTableViewCell.h"
#define BUTTON_WIDTH 50
#define BUTTON_HEIGHT 50
@interface ListPersonViewController ()

@end

@implementation ListPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableListPerson.dataSource = self;
    self.tableListPerson.delegate = self;
    [self initData];
    [self setScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - initData
- (void) initData {
    listPerson = [[NSMutableArray alloc] init];
    photos = [[NSMutableArray alloc] initWithArray:@[@"hami.jpg",@"huyenmy.jpg",@"midu.jpg"]];
    Person *person1 = [[Person alloc] init];
    Person *person2 = [[Person alloc] init];
    Person *person3 = [[Person alloc] init];
    Person *person4 = [[Person alloc] init];
    [person1 setPerson:@"Hạ Vi" images:photos];
    [person2 setPerson:@"Huyền My" images:photos];
    [person3 setPerson:@"Mỹ Dung" images:photos];
    [person4 setPerson:@"Ngọc Trinh" images:photos];
    [listPerson addObject:person1];
    [listPerson addObject:person2];
    [listPerson addObject:person3];
    [listPerson addObject:person4];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return listPerson.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *person = [listPerson objectAtIndex:indexPath.row];
    NSString *cellString = @"Cell";
    ListPersonTableViewCell *listCell = (ListPersonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellString];
    if (listCell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ListPersonTableViewCell" owner:self options:nil];
        listCell = [nib objectAtIndex:0];
    }
    listCell.imageProfile.image = [self roundedRectImageFromImage:[UIImage imageNamed:person.images[0]] size:CGSizeMake(listCell.imageProfile.frame.size.width, listCell.imageProfile.frame.size.height) withCornerRadius:listCell.imageProfile.frame.size.width/2];//set rounded image
    listCell.nameLbl.text = person.name;
    listCell.chatTextLbl.text = @"";
    listCell.imageSmall.image = [UIImage imageNamed:@""];
    return listCell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UIScrollView
- (void) setScrollView {
    int x = 0;
    CGRect frame;
    for (int i=0; i<listPerson.count; i++) {
        if (i == 0) {
            frame = CGRectMake(10, 0, BUTTON_WIDTH, BUTTON_HEIGHT);
        } else {
            frame = CGRectMake((i * BUTTON_WIDTH) + (i*10) + 10, 0, BUTTON_WIDTH, BUTTON_HEIGHT);
        }
        
        Person *person = [listPerson objectAtIndex:i];
        UIView *customView = [[UIView alloc] init];
        customView.frame = frame;
        UIButton *btnCustom = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, BUTTON_WIDTH, BUTTON_HEIGHT)];
        UIImageView *imageViewButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, BUTTON_WIDTH, BUTTON_HEIGHT)];
        UILabel *lblPercentage = [[UILabel alloc] initWithFrame:CGRectMake(0, BUTTON_HEIGHT-21, BUTTON_WIDTH, 21)];
        UIImage *image = [UIImage imageNamed:person.images[0]];
        image = [self roundedRectImageFromImage:image size:CGSizeMake(BUTTON_WIDTH, BUTTON_HEIGHT) withCornerRadius:BUTTON_WIDTH/2];
        [btnCustom addTarget:self action:@selector(selectAction) forControlEvents:UIControlEventTouchDragInside];
        imageViewButton.image = image;
        [customView addSubview:btnCustom];
        [customView addSubview:imageViewButton];
        [customView addSubview:lblPercentage];
        
        [self.scrollViewList addSubview:customView];
        if (i == listPerson.count-1) {
            x = CGRectGetMaxX(customView.frame);
        }
    }
//    self.scrollViewList.frame = CGRectMake(0, 0, x, 100);
    self.scrollViewList.contentSize = CGSizeMake(x, self.scrollViewList.frame.size.height);
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

#pragma mark - Action
- (void) selectAction {
    NSLog(@"Select");
}


@end
