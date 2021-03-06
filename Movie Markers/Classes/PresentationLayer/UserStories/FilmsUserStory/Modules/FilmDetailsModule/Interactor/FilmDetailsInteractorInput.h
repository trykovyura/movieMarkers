//
//  FilmDetailsInteractorInput.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FilmPlainObject;

@protocol FilmDetailsInteractorInput <NSObject>

- (NSArray *)obtainMarkers:(FilmPlainObject *)film;

- (NSURL *)obtainLargePosterURL:(FilmPlainObject *)film;

@end
