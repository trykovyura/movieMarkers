//
//  FilmsFeedViewInput.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FilmsFeedViewInput <NSObject>

/**
 @author trykov

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState:(NSArray *)films;

- (void)configureWithFilms:(NSArray *)films;

@end
