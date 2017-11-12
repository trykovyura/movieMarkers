//
//  FilmDetailsViewInput.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmPlainObject;

@protocol FilmDetailsViewInput <NSObject>

/**
 @author trykov

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;

- (void)configureWithFilm:(FilmPlainObject *)film markers:(NSArray *)markers posterURL:(NSURL *)posterURL;
@end
