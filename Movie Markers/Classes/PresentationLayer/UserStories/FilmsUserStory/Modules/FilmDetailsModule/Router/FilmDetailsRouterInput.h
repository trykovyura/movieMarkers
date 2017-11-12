//
//  FilmDetailsRouterInput.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FilmDetailsRouterInput <NSObject>

- (void)openFilmMapModuleWithMarker:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude;
@end
