//
// Created by Юрий Трыков on 22.10.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmPlainObject;

@interface FilmDetailsCellObjectBuilder : NSObject
- (NSArray *)cellObjectsForFilm:(FilmPlainObject *)film markers:(NSArray *)markers;
@end