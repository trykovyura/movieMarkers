//
// Created by Юрий Трыков on 22.10.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "FilmCellObject.h"
#import "FilmCell.h"

@interface FilmCellObject ()

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *details;


@end

@implementation FilmCellObject

- (instancetype)initWithTitle:(NSString *)title details:(NSString *)details {
    self = [super init];
    if (self) {
        self.title = [title copy];
        self.details = [details copy];
    }
    return self;
}

+ (instancetype)objectWithTitle:(NSString *)title details:(NSString *)details {
    return [[self alloc] initWithTitle:title details:details];
}

#pragma mark NINibCellObject

- (UINib *)cellNib {
    return [UINib nibWithNibName:NSStringFromClass([FilmCell class]) bundle:[NSBundle mainBundle]];
}

@end