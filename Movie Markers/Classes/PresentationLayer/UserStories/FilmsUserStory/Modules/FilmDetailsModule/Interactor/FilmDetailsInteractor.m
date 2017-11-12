//
//  FilmDetailsInteractor.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmDetailsInteractor.h"

#import "FilmDetailsInteractorOutput.h"
#import "FilmPlainObject.h"
#import "FilmService.h"

@implementation FilmDetailsInteractor

#pragma mark - Методы FilmDetailsInteractorInput

- (NSArray *)obtainMarkers:(FilmPlainObject *)film {
    return [self.filmService obtainMarkersWithFilm:film];
}

- (NSURL *)obtainLargePosterURL:(FilmPlainObject *)film {
    return [self.filmService obtainLargePosterUrl:film.filmID];
}


@end
