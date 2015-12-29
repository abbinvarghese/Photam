//
//  PSpotsObjectHandler.h
//  Photam
//
//  Created by Abbin on 28/12/15.
//  Copyright © 2015 Abbin Varghese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PSpotsObjectHandler : NSObject

+(void)saveSpotWithTitle:(NSString*)title description:(NSString*)description images:(NSMutableArray*)imageArray latLog:(CLLocationCoordinate2D)latlog failure:(void (^)(NSError *error))failure;

+(void)getSpots:(void (^)(NSArray *objArray))success failure:(void (^)(NSError *error))failure;

@end
