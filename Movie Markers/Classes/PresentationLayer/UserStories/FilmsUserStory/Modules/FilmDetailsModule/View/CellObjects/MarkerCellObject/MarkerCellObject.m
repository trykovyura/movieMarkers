//
// Created by Юрий Трыков on 22.10.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "MarkerCellObject.h"
#import "MarkerCell.h"


@interface MarkerCellObject ()

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *location;
@property(nonatomic, strong) NSDecimalNumber *latitude;
@property(nonatomic, strong) NSDecimalNumber *longitude;

@end

@implementation MarkerCellObject

- (instancetype)initWithName:(NSString *)name location:(NSString *)location latitude:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude {
    self = [super init];
    if (self) {
        self.name = [name copy];
        self.location = [location copy];
        self.latitude = latitude;
        self.longitude = longitude;
    }
    return self;
}

+ (instancetype)objectWithName:(NSString *)name location:(NSString *)location latitude:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude {
    return [[self alloc] initWithName:name location:location latitude:latitude longitude:longitude];
}

- (NSDecimalNumber *)obtainLatitude {
    return self.latitude;
}

- (NSDecimalNumber *)obtainLongitude {
    return self.longitude;
}


#pragma mark NINibCellObject

- (UINib *)cellNib {
    return [UINib nibWithNibName:NSStringFromClass([MarkerCell class]) bundle:[NSBundle mainBundle]];
}

@end