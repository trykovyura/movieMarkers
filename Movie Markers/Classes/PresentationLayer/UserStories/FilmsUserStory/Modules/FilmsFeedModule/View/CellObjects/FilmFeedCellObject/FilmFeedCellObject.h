//
// Created by Юрий Трыков on 04.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NimbusModels.h"


@interface FilmFeedCellObject : NSObject<NINibCellObject>

@property(nonatomic, strong, readonly) NSString *title;
@property(nonatomic, strong, readonly) NSString *details;
@property(nonatomic, strong, readonly) NSString *filmID;


- (instancetype)initWithTitle:(NSString *)title details:(NSString *)details filmID:(NSString *)filmID;

+ (instancetype)objectWithTitle:(NSString *)title details:(NSString *)details filmID:(NSString *)filmID;
@end