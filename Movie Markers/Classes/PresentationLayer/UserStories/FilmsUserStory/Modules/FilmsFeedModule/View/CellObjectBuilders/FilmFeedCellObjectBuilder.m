//
// Created by Юрий Трыков on 04.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "FilmFeedCellObjectBuilder.h"
#import "FilmFeedCellObject.h"
#import "FilmPlainObject.h"

@implementation FilmFeedCellObjectBuilder

- (NSArray *)cellObjectsForFilms:(NSArray <FilmPlainObject *> *)films {
    NSMutableArray *cellObjects = [NSMutableArray new];
    for(FilmPlainObject *film in films) {
        NSString *details = [NSString stringWithFormat:@"%@, %@", film.year, film.descriptionFilm];
        [cellObjects addObject:[FilmFeedCellObject objectWithTitle:film.nameRU details:details filmID:film.filmID]];
    }
    return [cellObjects copy];
}

@end