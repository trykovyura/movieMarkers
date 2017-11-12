//
// Created by Юрий Трыков on 22.10.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Nimbus/NimbusModels.h>

@class Film;

@interface FilmCellObject : NSObject <NINibCellObject>

@property(nonatomic, strong, readonly) NSString *title;
@property(nonatomic, strong, readonly) NSString *details;

- (instancetype)initWithTitle:(NSString *)title details:(NSString *)details;

+ (instancetype)objectWithTitle:(NSString *)title details:(NSString *)details;

@end