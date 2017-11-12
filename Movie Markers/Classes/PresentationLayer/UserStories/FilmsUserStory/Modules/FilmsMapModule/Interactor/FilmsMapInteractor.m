//
//  FilmsMapInteractor.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsMapInteractor.h"

#import "FilmsMapInteractorOutput.h"
#import "FilmService.h"

@implementation FilmsMapInteractor

#pragma mark - Методы FilmsMapInteractorInput

- (NSArray *)obtainMarkers {
    return [self.filmService obtainMarkers];
}

- (NSURL *)obtainPosterUrl:(NSString *)filmID {
    return [self.filmService obtainPosterUrl:filmID];
}

- (FilmPlainObject *)obtainFilm:(NSString *)filmID {
    return [self.filmService obtainFilm:filmID];
}


@end
