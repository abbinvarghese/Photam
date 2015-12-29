//
//  NSMutableArray+PMutableArray.m
//  Photam
//
//  Created by Abbin on 28/12/15.
//  Copyright © 2015 Abbin Varghese. All rights reserved.
//

#import "NSMutableArray+PMutableArray.h"
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@implementation NSMutableArray (PMutableArray)

-(void)addImage:(id)anObject{
    UIImage *image = anObject;
    PFFile *imagePFFile = [PFFile fileWithData:UIImageJPEGRepresentation(image, 0.8)];
    [self addObject:imagePFFile];
}

@end
