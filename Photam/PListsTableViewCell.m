//
//  PListsTableViewCell.m
//  Photam
//
//  Created by Abbin Varghese on 20/12/15.
//  Copyright © 2015 Abbin Varghese. All rights reserved.
//

#import "PListsTableViewCell.h"

@implementation PListsTableViewCell

- (void)awakeFromNib {
    self.imagePreview.layer.cornerRadius = 5;
    self.imagePreview.layer.masksToBounds = YES;
    [self.distanceLabel sizeToFit];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
