//
//  PSpots.m
//  Photam
//
//  Created by Abbin on 28/12/15.
//  Copyright © 2015 Abbin Varghese. All rights reserved.
//

#import "PSpots.h"
#import <PFObject+Subclass.h>

@implementation PSpots

@dynamic spotTitle;
@dynamic spotDescription;
@dynamic imageArray;
@dynamic latLon;
@dynamic rating;

+(void)load{
    [self registerSubclass];
}

+(NSString *)parseClassName{
    return @"Spots";
}

@end
