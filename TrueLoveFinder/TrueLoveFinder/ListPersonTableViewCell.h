//
//  ListPersonTableViewCell.h
//  TrueLoveFinder
//
//  Created by mac on 1/29/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListPersonTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageProfile;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *chatTextLbl;
@property (weak, nonatomic) IBOutlet UIImageView *imageSmall;

@end
