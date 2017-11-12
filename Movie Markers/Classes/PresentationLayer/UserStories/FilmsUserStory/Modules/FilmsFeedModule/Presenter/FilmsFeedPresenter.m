//
//  FilmsFeedPresenter.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsFeedPresenter.h"

#import "FilmsFeedViewInput.h"
#import "FilmsFeedInteractorInput.h"
#import "FilmsFeedRouterInput.h"

@interface FilmsFeedPresenter()

@property (nonatomic, strong) NSArray *films;

@end

@implementation FilmsFeedPresenter

#pragma mark - Методы FilmsFeedModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы FilmsFeedViewOutput

- (void)didTriggerViewReadyEvent {
    self.films = [self.interactor obtainFilms];
    [self.view setupInitialState:self.films];
}

- (void)didSelectFilm:(NSString *)filmID {
    FilmPlainObject *film = [self.interactor obtainFilm:filmID];
    [self.router openFilmDetailsModule:film];
}

- (void)didTriggerSearchEvent:(NSString *)searchString {
    NSArray *films = [self.interactor filterFilms:self.films searchString:searchString];
    [self.view configureWithFilms:films];
}


#pragma mark - Методы FilmsFeedInteractorOutput

@end
