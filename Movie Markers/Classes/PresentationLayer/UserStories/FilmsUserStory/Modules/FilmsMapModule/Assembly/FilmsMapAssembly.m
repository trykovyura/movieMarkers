//
//  FilmsMapAssembly.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsMapAssembly.h"

#import "FilmsMapViewController.h"
#import "FilmsMapInteractor.h"
#import "FilmsMapPresenter.h"
#import "FilmsMapRouter.h"
#import "ServiceComponents.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation FilmsMapAssembly

- (FilmsMapViewController *)viewFilmsMap {
    return [TyphoonDefinition withClass:[FilmsMapViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFilmsMap]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterFilmsMap]];
                          }];
}

- (FilmsMapInteractor *)interactorFilmsMap {
    return [TyphoonDefinition withClass:[FilmsMapInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFilmsMap]];
                              [definition injectProperty:@selector(filmService)
                                                    with:[self.serviceComponents filmService]];
                          }];
}

- (FilmsMapPresenter *)presenterFilmsMap{
    return [TyphoonDefinition withClass:[FilmsMapPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewFilmsMap]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorFilmsMap]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerFilmsMap]];
                          }];
}

- (FilmsMapRouter *)routerFilmsMap{
    return [TyphoonDefinition withClass:[FilmsMapRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewFilmsMap]];
                          }];
}

@end
