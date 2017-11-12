//
// Created by Юрий Трыков on 04.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "FilmFeedCell.h"
#import "FilmFeedCellObject.h"


@implementation FilmFeedCell

- (BOOL)shouldUpdateCellWithObject:(FilmFeedCellObject *)object {
    self.textLabel.text = object.title;
    self.detailTextLabel.text = object.details;
    return YES;
}

@end