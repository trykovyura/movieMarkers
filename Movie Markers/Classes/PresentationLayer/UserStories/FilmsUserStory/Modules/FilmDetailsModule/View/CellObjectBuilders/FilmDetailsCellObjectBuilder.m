//
// Created by Юрий Трыков on 22.10.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "FilmDetailsCellObjectBuilder.h"
#import "FilmCellObject.h"
#import "MarkerCellObject.h"
#import "FilmPlainObject.h"
#import "MarkerPlainObject.h"

@implementation FilmDetailsCellObjectBuilder

- (NSArray *)cellObjectsForFilm:(FilmPlainObject *)film markers:(NSArray *)markers {
    NSMutableArray *cellObjects = [NSMutableArray new];
    [cellObjects addObject:NSLocalizedString(@"section_film", nil)];
    [cellObjects addObject:[FilmCellObject objectWithTitle:NSLocalizedString(@"year", nil) details:film.year]];
    [cellObjects addObject:[FilmCellObject objectWithTitle:NSLocalizedString(@"country", nil) details:film.country]];
    [cellObjects addObject:[FilmCellObject objectWithTitle:NSLocalizedString(@"director", nil) details:film.descriptionFilm]];
    [cellObjects addObject:[FilmCellObject objectWithTitle:NSLocalizedString(@"genre", nil) details:film.genre]];
    if (markers.count > 0) {
        [cellObjects addObject:NSLocalizedString(@"section_place", nil)];
        for (MarkerPlainObject *marker in markers) {
            [cellObjects addObject:[MarkerCellObject objectWithName:marker.location location:@"" latitude:marker.latitude longitude:marker.longitude]];
        }
    }
    return [cellObjects copy];
}
@end