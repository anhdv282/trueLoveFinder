//
//  Person.m
//  TrueLoveFinder
//
//  Created by mac on 1/5/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import "Person.h"

@implementation Person
-(id) init
{
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
        self.descrip = @"";
        self.gender = @"";
        self.work = @"";
        self.school = @"";
        self.images = [[NSMutableArray alloc] init];
        self.interests = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) setPerson:(NSString*) name
           images:(NSMutableArray*)images {
    self.name = name;
    self.images = images;
}
@end
