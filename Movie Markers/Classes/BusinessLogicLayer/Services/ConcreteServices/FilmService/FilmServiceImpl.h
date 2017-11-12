//
// Created by Юрий Трыков on 05.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FilmService.h"

@protocol PlainObjectMappingProviderProtocol;
@protocol JsonArrayConverter;


@interface FilmServiceImpl : NSObject<FilmService>

@property id json;

@property id<PlainObjectMappingProviderProtocol> filmPlainObjectMappingProvider;

@property id<PlainObjectMappingProviderProtocol> markerPlainObjectMappingProvider;

@property id <JsonArrayConverter> markerJsonConverter;

@end