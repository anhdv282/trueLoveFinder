//
//  ListMatchPersonViewController.h
//  TrueLoveFinder
//
//  Created by mac on 1/13/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListMatchPersonViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableList;

@end
