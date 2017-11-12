//
//  FilmsFeedAssembly.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsFeedAssembly.h"

#import "FilmsFeedViewController.h"
#import "FilmsFeedInteractor.h"
#import "FilmsFeedPresenter.h"
#import "FilmsFeedRouter.h"
#import "FilmFeedCellObjectBuilder.h"
#import "ServiceComponents.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation FilmsFeedAssembly

- (FilmsFeedViewController *)viewFilmsFeed {
    return [TyphoonDefinition withClass:[FilmsFeedViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFilmsFeed]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterFilmsFeed]];
                              [definition injectProperty:@selector(dataDisplayManager)
                                                    with:[self filmFeedDataDisplayManager]];
                          }];
}

- (id)filmFeedDataDisplayManager {
    return [TyphoonDefinition withClass:[FilmFeedDataDisplayManager class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(cellObjectBuilder)
                                                    with:[self filmFeedCellObjectBuilder]];
                          }];
}

- (id)filmFeedCellObjectBuilder {
    return [TyphoonDefinition withClass:[FilmFeedCellObjectBuilder class]];
}

- (FilmsFeedInteractor *)interactorFilmsFeed {
    return [TyphoonDefinition withClass:[FilmsFeedInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFilmsFeed]];
                              [definition injectProperty:@selector(filmService)
                                                    with:[self.serviceComponents filmService]];
                          }];
}

- (FilmsFeedPresenter *)presenterFilmsFeed{
    return [TyphoonDefinition withClass:[FilmsFeedPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewFilmsFeed]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorFilmsFeed]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerFilmsFeed]];
                          }];
}

- (FilmsFeedRouter *)routerFilmsFeed{
    return [TyphoonDefinition withClass:[FilmsFeedRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewFilmsFeed]];
                          }];
}

@end
