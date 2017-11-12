//
// Created by Юрий Трыков on 22.10.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Nimbus/NimbusModels.h>

@class Film;

@interface MarkerCellObject : NSObject <NINibCellObject>

@property(nonatomic, strong, readonly) NSString *name;
@property(nonatomic, strong, readonly) NSString *location;

- (instancetype)initWithName:(NSString *)name location:(NSString *)location latitude:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude;

+ (instancetype)objectWithName:(NSString *)name location:(NSString *)location latitude:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude;

- (NSDecimalNumber *)obtainLatitude;

- (NSDecimalNumber *)obtainLongitude;


@end