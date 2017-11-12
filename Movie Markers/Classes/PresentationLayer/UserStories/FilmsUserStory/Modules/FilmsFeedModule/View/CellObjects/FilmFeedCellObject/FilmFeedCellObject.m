//
// Created by Юрий Трыков on 04.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "FilmFeedCellObject.h"
#import "FilmFeedCell.h"

@interface FilmFeedCellObject ()

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *details;
@property(nonatomic, strong) NSString *filmID;

@end

@implementation FilmFeedCellObject

- (instancetype)initWithTitle:(NSString *)title details:(NSString *)details filmID:(NSString *)filmID {
    self = [super init];
    if (self) {
        self.title = [title copy];
        self.details = [details copy];
        self.filmID = [filmID copy];
    }
    return self;
}

+ (instancetype)objectWithTitle:(NSString *)title details:(NSString *)details filmID:(NSString *)filmID {
    return [[self alloc] initWithTitle:title details:details filmID:filmID];
}

#pragma mark NINibCellObject

- (UINib *)cellNib {
    return [UINib nibWithNibName:NSStringFromClass([FilmFeedCell class]) bundle:[NSBundle mainBundle]];
}

@end