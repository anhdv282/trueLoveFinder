//
//  ListPersonViewController.h
//  TrueLoveFinder
//
//  Created by mac on 1/27/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListPersonViewController : UIViewController <UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray *listPerson;
}
@property (weak, nonatomic) IBOutlet UITableView *tableListPerson;

@end
