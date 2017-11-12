//
// Created by Юрий Трыков on 05.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmPlainObject;

@protocol FilmService <NSObject>

- (NSArray *)obtainFilms;

- (NSArray *)obtainMarkers;

- (NSArray *)obtainMarkersWithFilm:(FilmPlainObject *)film;

- (FilmPlainObject *)obtainFilm:(NSString *)filmID;

- (NSArray *)filterFilms:(NSArray *)films withString:(NSString *)searchText;

- (NSURL *)obtainPosterUrl:(NSString *)filmID;

- (NSURL *)obtainLargePosterUrl:(NSString *)filmID;
@end