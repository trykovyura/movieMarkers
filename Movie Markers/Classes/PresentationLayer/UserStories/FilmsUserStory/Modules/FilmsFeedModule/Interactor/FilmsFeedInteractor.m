//
//  FilmsFeedInteractor.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsFeedInteractor.h"

#import "FilmsFeedInteractorOutput.h"
#import "FilmService.h"

@implementation FilmsFeedInteractor

#pragma mark - Методы FilmsFeedInteractorInput

- (NSArray *)obtainFilms {
    return [self.filmService obtainFilms];
}

- (FilmPlainObject *)obtainFilm:(NSString *)filmID {
    return [self.filmService obtainFilm:filmID];
}

- (NSArray *)filterFilms:(NSArray *)films searchString:(NSString *)searchString {
    return [self.filmService filterFilms:films withString:searchString];
}


@end
