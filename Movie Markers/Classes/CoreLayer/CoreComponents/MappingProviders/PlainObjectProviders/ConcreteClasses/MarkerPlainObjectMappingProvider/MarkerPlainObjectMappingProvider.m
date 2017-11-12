//
// Created by Юрий Трыков on 05.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <EasyMapping/EKObjectMapping.h>
#import "MarkerPlainObjectMappingProvider.h"
#import "PlainObjectMappingProviderProtocol.h"

@implementation MarkerPlainObjectMappingProvider

- (EKObjectMapping *)mappingForPlainObjectClass:(Class)plainObjectClass {
    NSDictionary *properties = @{
            @"filmID" : NSStringFromSelector(@selector(filmID)),
            @"rus": NSStringFromSelector(@selector(name)),
            @"location": NSStringFromSelector(@selector(location)),
            @"description": NSStringFromSelector(@selector(descriptionPlace)),
            @"coord_y": NSStringFromSelector(@selector(latitude)),
            @"coord_x": NSStringFromSelector(@selector(longitude)),
    };
    return [EKObjectMapping mappingForClass:plainObjectClass withBlock:^(EKObjectMapping *mapping) {
        [mapping mapPropertiesFromDictionary:properties];
    }];
}


@end