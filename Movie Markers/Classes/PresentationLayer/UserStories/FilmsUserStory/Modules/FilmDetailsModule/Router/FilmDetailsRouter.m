//
//  FilmDetailsRouter.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmDetailsRouter.h"
#import "FilmsMapViewController.h"
#import "FilmsMapModuleInput.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation FilmDetailsRouter

#pragma mark - Методы FilmDetailsRouterInput

- (void)openFilmMapModuleWithMarker:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude {
    RamblerViperModuleFactory *factory = [[RamblerViperModuleFactory alloc] initWithViewHandler:^id <RamblerViperModuleTransitionHandlerProtocol> {
        UITabBarController *tabBarController = [((id) self.transitionHandler) tabBarController];
        tabBarController.selectedIndex = 0;
        return [tabBarController selectedViewController];
    }];

    RamblerViperModuleLinkBlock configurationBlock = [self mapConfigurationBlockWith:latitude longitude:longitude];
    [[self.transitionHandler openModuleUsingFactory:factory
                                withTransitionBlock:nil]
            thenChainUsingBlock:configurationBlock];
}

#pragma mark - Private methods


- (RamblerViperModuleLinkBlock)mapConfigurationBlockWith:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude {
    return ^id <RamblerViperModuleOutput>(id <FilmsMapModuleInput> moduleInput) {
        [moduleInput configureModule:latitude longitude:longitude];
        return nil;
    };
}
@end
