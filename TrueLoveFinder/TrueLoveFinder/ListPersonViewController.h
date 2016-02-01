//
//  ListPersonViewController.h
//  TrueLoveFinder
//
//  Created by mac on 1/27/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
@interface ListPersonViewController : UIViewController <UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray *listPerson,*photos;
}
@property (weak, nonatomic) IBOutlet UITableView *tableListPerson;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewList;

@end
