//
// Created by Юрий Трыков on 22.10.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "MarkerCell.h"
#import "MarkerCellObject.h"


@implementation MarkerCell


- (BOOL)shouldUpdateCellWithObject:(MarkerCellObject *)object {
    self.textLabel.text = object.name;
    self.detailTextLabel.text = object.location;
    return YES;
}

@end