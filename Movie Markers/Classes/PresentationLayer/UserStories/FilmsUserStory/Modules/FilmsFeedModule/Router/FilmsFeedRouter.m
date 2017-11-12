//
//  FilmsFeedRouter.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsFeedRouter.h"
#import "FilmDetailsModuleInput.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

static NSString *filmDetailsSegueId = @"filmDetailsSegue";

@implementation FilmsFeedRouter

#pragma mark - Методы FilmsFeedRouterInput

- (void)openFilmDetailsModule:(FilmPlainObject *)film {
    [[self.transitionHandler openModuleUsingSegue:filmDetailsSegueId]
            thenChainUsingBlock:^id <RamblerViperModuleOutput>(id <FilmDetailsModuleInput> moduleInput) {
                [moduleInput configureModuleWithFilm:film];
                return nil;
            }];
}

@end
