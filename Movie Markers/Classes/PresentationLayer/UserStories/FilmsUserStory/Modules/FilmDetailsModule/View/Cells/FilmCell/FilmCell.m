//
// Created by Юрий Трыков on 22.10.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "FilmCell.h"
#import "FilmCellObject.h"
#import <UIKit/UIKit.h>

@implementation FilmCell

- (BOOL)shouldUpdateCellWithObject:(FilmCellObject *)object {
    self.textLabel.text = object.title;
    self.detailTextLabel.text = object.details;
    return YES;
}

@end
