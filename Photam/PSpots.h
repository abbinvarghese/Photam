//
//  PSpots.h
//  Photam
//
//  Created by Abbin on 28/12/15.
//  Copyright © 2015 Abbin Varghese. All rights reserved.
//

#import <Parse/Parse.h>

@interface PSpots : PFObject<PFSubclassing>

+ (NSString *)parseClassName;

@property (nonatomic,strong) NSString *spotTitle;
@property (nonatomic,strong) NSString *spotDescription;
@property (nonatomic,strong) NSMutableArray *imageArray;
@property (nonatomic,strong) PFGeoPoint *latLon;
@property (nonatomic,strong) NSNumber *rating;
@end
