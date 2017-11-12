//
// Created by Юрий Трыков on 05.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <EasyMapping/EKObjectMapping.h>
#import "FilmPlainObjectMappingProvider.h"


@implementation FilmPlainObjectMappingProvider

- (EKObjectMapping *)mappingForPlainObjectClass:(Class)plainObjectClass {
    return [EKObjectMapping mappingForClass:plainObjectClass withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromArray:@[@"filmID", @"nameRU", @"nameEN", @"country", @"filmLength",
                @"genre", @"posterURL", @"rating", @"type", @"year"]];
        [mapping mapKeyPath:@"description" toProperty:@"descriptionFilm"];
    }];
}

@end