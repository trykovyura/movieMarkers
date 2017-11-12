//
//  FilmDetailsAssembly.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmDetailsAssembly.h"

#import "FilmDetailsViewController.h"
#import "FilmDetailsInteractor.h"
#import "FilmDetailsPresenter.h"
#import "FilmDetailsRouter.h"
#import "FilmDetailsCellObjectBuilder.h"

#import <ViperMcFlurry/ViperMcFlurry.h>
#import "ServiceComponents.h"

@implementation FilmDetailsAssembly

- (FilmDetailsViewController *)viewFilmDetails {
    return [TyphoonDefinition withClass:[FilmDetailsViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFilmDetails]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterFilmDetails]];
                              [definition injectProperty:@selector(dataDisplayManager)
                                                    with:[self filmDetailsDataDisplayManager]];
                          }];
}

- (id)filmDetailsDataDisplayManager {
    return [TyphoonDefinition withClass:[FilmDetailsDataDisplayManager class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(cellObjectBuilder)
                                                    with:[self filmDetailsCellObjectBuilder]];
                          }];
}

- (id)filmDetailsCellObjectBuilder {
    return [TyphoonDefinition withClass:[FilmDetailsCellObjectBuilder class]];
}

- (FilmDetailsInteractor *)interactorFilmDetails {
    return [TyphoonDefinition withClass:[FilmDetailsInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFilmDetails]];
                              [definition injectProperty:@selector(filmService)
                                                    with:[self.serviceComponents filmService]];
                          }];
}

- (FilmDetailsPresenter *)presenterFilmDetails{
    return [TyphoonDefinition withClass:[FilmDetailsPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewFilmDetails]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorFilmDetails]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerFilmDetails]];
                          }];
}

- (FilmDetailsRouter *)routerFilmDetails{
    return [TyphoonDefinition withClass:[FilmDetailsRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewFilmDetails]];
                          }];
}

@end
