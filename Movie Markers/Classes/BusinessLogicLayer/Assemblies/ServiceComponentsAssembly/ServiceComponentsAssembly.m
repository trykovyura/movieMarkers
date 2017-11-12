//
// Created by Юрий Трыков on 05.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "ServiceComponentsAssembly.h"
#import "FilmServiceImpl.h"
#import "FilmPlainObjectMappingProvider.h"
#import "MarkerPlainObjectMappingProvider.h"
#import "MarkerJsonConverter.h"


@implementation ServiceComponentsAssembly

- (id <FilmService>)filmService {
    return [TyphoonDefinition withClass:[FilmServiceImpl class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(json)
                                                    with:[self loadJson]];
                              [definition injectProperty:@selector(filmPlainObjectMappingProvider)
                                                    with:[self filmPlainObjectMappingProvider]];
                              [definition injectProperty:@selector(markerPlainObjectMappingProvider)
                                                    with:[self markerPlainObjectMappingProvider]];
                              [definition injectProperty:@selector(markerJsonConverter)
                                                    with:[self markerJsonConverter]];
                          }];
}

- (id <JsonArrayConverter>)markerJsonConverter {
    return [TyphoonDefinition withClass:[MarkerJsonConverter class]];
}

- (id <PlainObjectMappingProviderProtocol>)markerPlainObjectMappingProvider {
    return [TyphoonDefinition withClass:[MarkerPlainObjectMappingProvider class]];
}

- (id <PlainObjectMappingProviderProtocol>)filmPlainObjectMappingProvider {
    return [TyphoonDefinition withClass:[FilmPlainObjectMappingProvider class]];
}

- (id)loadJson {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"films" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    return [TyphoonDefinition with:json];
}


@end