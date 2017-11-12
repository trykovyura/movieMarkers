//
// Created by Юрий Трыков on 06.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "MarkerJsonConverter.h"


@implementation MarkerJsonConverter

- (NSArray *)convertArrayFromJson:(NSDictionary *)json {
    NSMutableArray *array = [NSMutableArray new];
    for (NSString *jsonKey in json) {
        NSDictionary *markers = json[jsonKey];
        for(NSDictionary *marker in markers.allValues) {
            NSMutableDictionary *markerValues = [NSMutableDictionary dictionaryWithDictionary:marker];
            markerValues[@"filmID"] = jsonKey;
            [array addObject:[markerValues copy]];
        }
    }
    return [array copy];
}

@end