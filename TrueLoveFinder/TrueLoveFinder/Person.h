//
//  Person.h
//  TrueLoveFinder
//
//  Created by mac on 1/5/16.
//  Copyright © 2016 vad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (strong,nonatomic) NSString       * name;
@property unsigned int                      * age;
@property (strong,nonatomic) NSString       * gender;//M F
@property (strong,nonatomic) NSMutableArray * images;
@property (strong,nonatomic) NSString       * work;
@property (strong,nonatomic) NSString       * school;
@property (strong,nonatomic) NSString       * descrip;
@property (strong,nonatomic) NSMutableArray * interests;
-(void) setPerson:(NSString*) name
           images:(NSMutableArray*)images;
@end
