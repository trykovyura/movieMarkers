//
// Created by Юрий Трыков on 05.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKMappingProtocol.h"


@interface MarkerPlainObject : NSObject<EKMappingProtocol>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *descriptionPlace;
@property (nonatomic, copy) NSDecimalNumber *latitude;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSDecimalNumber *longitude;
@property (nonatomic, copy) NSString *filmID;

@end