//
// Created by Юрий Трыков on 05.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "FilmServiceImpl.h"
#import "PlainObjectMappingProviderProtocol.h"
#import "EKMapper.h"
#import "FilmPlainObject.h"
#import "MarkerPlainObject.h"
#import "JsonArrayConverter.h"
#import "MarkerJsonConverter.h"
#import "Constants.h"


@implementation FilmServiceImpl

- (NSArray *)obtainFilms {
    EKObjectMapping *mapping = [self.filmPlainObjectMappingProvider mappingForPlainObjectClass:[FilmPlainObject class]];
    NSArray *films = [EKMapper arrayOfObjectsFromExternalRepresentation:[[self.json objectForKey:kJsonFilms] allValues]
                                                            withMapping:mapping];
    NSSortDescriptor *yearSort = [[NSSortDescriptor alloc] initWithKey:@"year"
                                                             ascending:NO];
    NSSortDescriptor *nameSort = [[NSSortDescriptor alloc] initWithKey:@"nameRU"
                                                             ascending:YES];
    films = [films sortedArrayUsingDescriptors:@[yearSort, nameSort]];
    return films;
}

- (NSArray *)obtainMarkers {
    EKObjectMapping *mapping = [self.markerPlainObjectMappingProvider mappingForPlainObjectClass:[MarkerPlainObject class]];
    NSArray *arrayFromJson = [self.markerJsonConverter convertArrayFromJson:[self.json objectForKey:kJsonMarkers]];
    NSArray *markers = [EKMapper arrayOfObjectsFromExternalRepresentation:arrayFromJson
                                                              withMapping:mapping];
    return markers;
}


- (NSArray *)obtainMarkersWithFilm:(FilmPlainObject *)film {
    EKObjectMapping *mapping = [self.markerPlainObjectMappingProvider mappingForPlainObjectClass:[MarkerPlainObject class]];
    NSDictionary *markersDic = [self.json objectForKey:kJsonMarkers];
    NSDictionary *filmMarkers = [markersDic objectForKey:film.filmID];

    NSArray *markers = [EKMapper arrayOfObjectsFromExternalRepresentation:filmMarkers.allValues
                                                              withMapping:mapping];
    return markers;
}

- (FilmPlainObject *)obtainFilm:(NSString *)filmID {
    EKObjectMapping *mapping = [self.filmPlainObjectMappingProvider mappingForPlainObjectClass:[FilmPlainObject class]];
    NSDictionary *films = [self.json objectForKey:kJsonFilms];
    FilmPlainObject *film = [EKMapper objectFromExternalRepresentation:films[filmID]
                                                           withMapping:mapping];
    return film;
}

- (NSURL *)obtainLargePosterUrl:(NSString *)filmID {
    FilmPlainObject *film = [self obtainFilm:filmID];
    NSString *largePoster = [self largePoster:film.posterURL];
    return [self obtainURL:largePoster];
}


- (NSArray *)filterFilms:(NSArray *)films withString:(NSString *)searchText {
    if (searchText && ![searchText isEqualToString:@""]) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nameRU CONTAINS[c] %@", searchText, searchText];
        films = [films filteredArrayUsingPredicate:predicate];
    }
    return films;
}

- (NSURL *)obtainPosterUrl:(NSString *)filmID {
    FilmPlainObject *film = [self obtainFilm:filmID];
    return [self obtainURL:film.posterURL];
}

- (NSURL *)obtainURL:(NSString *)posterURL {
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", kYandexImages, posterURL]];
    return URL;
}

- (NSString *)largePoster:(NSString *)posterURL {
    NSArray *fullURL = [posterURL componentsSeparatedByString:@"/"];
    NSString *postfix = fullURL[1];
    NSArray *postfixURL = [postfix componentsSeparatedByString:@"_"];
    if (fullURL.firstObject) {
        NSMutableString *url = [[NSMutableString alloc] initWithString:fullURL.firstObject];
        [url appendString:@"/iphone360_"];
        [url appendString:postfixURL[1]];
        return [url copy];
    }
    return posterURL;
}


@end