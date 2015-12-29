//
//  PSpotsObjectHandler.m
//  Photam
//
//  Created by Abbin on 28/12/15.
//  Copyright © 2015 Abbin Varghese. All rights reserved.
//

#import "PSpotsObjectHandler.h"
#import <Parse/Parse.h>
#import "PSpots.h"

@implementation PSpotsObjectHandler

+(void)saveSpotWithTitle:(NSString*)title description:(NSString*)description images:(NSMutableArray*)imageArray latLog:(CLLocationCoordinate2D)latlog failure:(void (^)(NSError *error))failure{
    PSpots *obj = [PSpots object];
    obj.spotDescription = description;
    obj.spotTitle = title;
    PFGeoPoint *point = [PFGeoPoint geoPointWithLatitude:latlog.latitude longitude:latlog.longitude];
    obj.latLon = point;
    
    NSMutableArray *imArray = [[NSMutableArray alloc]init];
    
    for (UIImage *img in imageArray) {
        PFFile *imgFile = [PFFile fileWithData:UIImageJPEGRepresentation(img, 1)];
        [imArray addObject:imgFile];
    }
    obj.imageArray = imArray;
    
    [obj saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (error) {
            failure(error);
        }
    }];
}

+(void)getSpots:(void (^)(NSArray *objArray))success failure:(void (^)(NSError *error))failure{
    PFQuery *query = [PFQuery queryWithClassName:[PSpots parseClassName]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            success(objects);
        } else {
            failure(error);
        }
    }];
}


@end
