//
//  FilmsFeedRouterInput.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FilmPlainObject;

@protocol FilmsFeedRouterInput <NSObject>

- (void)openFilmDetailsModule:(FilmPlainObject *)film;
@end
