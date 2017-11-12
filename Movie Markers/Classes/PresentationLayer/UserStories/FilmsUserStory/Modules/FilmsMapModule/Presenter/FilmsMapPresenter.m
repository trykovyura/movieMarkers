//
//  FilmsMapPresenter.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsMapPresenter.h"

#import "FilmsMapViewInput.h"
#import "FilmsMapInteractorInput.h"
#import "FilmsMapRouterInput.h"
#import "FilmPlainObject.h"

@interface FilmsMapPresenter ()

@property (nonatomic, strong) NSArray *markers;

@end

@implementation FilmsMapPresenter

#pragma mark - Методы FilmsMapModuleInput

- (void)configureModule:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude {
    [self.view selectPlace:latitude longitude:longitude];
}

#pragma mark - Методы FilmsMapViewOutput

- (void)didTriggerViewReadyEvent {
    self.markers = [self.interactor obtainMarkers];
    [self.view setupInitialState];
}

- (void)didTriggerViewWillAppearEvent {
    [self.view configureMarkers:self.markers];
}

- (NSURL *)obtainPosterUrl:(NSString *)filmID {
    return [self.interactor obtainPosterUrl:filmID];
}


- (void)didSelectFilm:(NSString *)filmID {
    FilmPlainObject *film = [self.interactor obtainFilm:filmID];
    [self.router openFilmDetailsModule:film];
}


#pragma mark - Методы FilmsMapInteractorOutput

@end
