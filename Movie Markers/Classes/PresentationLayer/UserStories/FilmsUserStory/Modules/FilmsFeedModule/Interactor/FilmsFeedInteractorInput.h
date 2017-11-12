//
//  FilmsFeedInteractorInput.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FilmPlainObject;

@protocol FilmsFeedInteractorInput <NSObject>

- (NSArray *)obtainFilms;

- (FilmPlainObject *)obtainFilm:(NSString *)filmID;

- (NSArray *)filterFilms:(NSArray *)films searchString:(NSString *)searchString;
@end
