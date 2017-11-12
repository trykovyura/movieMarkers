//
//  FilmDetailsPresenter.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmDetailsPresenter.h"

#import "FilmDetailsViewInput.h"
#import "FilmDetailsInteractorInput.h"
#import "FilmDetailsRouterInput.h"
#import "FilmPlainObject.h"

@interface FilmDetailsPresenter ()

@property(nonatomic) FilmPlainObject *film;

@property(nonatomic) NSArray *markers;

@end

@implementation FilmDetailsPresenter

#pragma mark - Методы FilmDetailsModuleInput


- (void)configureModuleWithFilm:(FilmPlainObject *)film {
    self.film = film;
}

#pragma mark - Методы FilmDetailsViewOutput

- (void)didTriggerViewReadyEvent {
    [self.view setupInitialState];
    self.markers = [self.interactor obtainMarkers:self.film];
}

- (void)didTriggerViewWillAppear {
    NSURL *posterURL = [self.interactor obtainLargePosterURL:self.film];
    [self.view configureWithFilm:self.film markers:self.markers posterURL:posterURL];
}

- (void)didTapMarker:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude {
    [self.router openFilmMapModuleWithMarker:latitude longitude:longitude];
}


#pragma mark - Методы FilmDetailsInteractorOutput

@end
