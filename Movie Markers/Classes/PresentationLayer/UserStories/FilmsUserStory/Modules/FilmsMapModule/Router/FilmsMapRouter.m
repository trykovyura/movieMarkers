//
//  FilmsMapRouter.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsMapRouter.h"
#import "FilmDetailsModuleInput.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation FilmsMapRouter

#pragma mark - Методы FilmsMapRouterInput

- (void)openFilmDetailsModule:(FilmPlainObject *)film {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RamblerViperModuleFactory *factory = [[RamblerViperModuleFactory alloc] initWithStoryboard:storyboard
                                                                              andRestorationId:@"filmDetailsId"];
    ModuleTransitionBlock transitionBlock = [self filmTransitionBlock];
    RamblerViperModuleLinkBlock configurationBlock = [self filmDetailsConfigurationBlockWith:film];
    [[self.transitionHandler openModuleUsingFactory:factory
                                withTransitionBlock:transitionBlock]
            thenChainUsingBlock:configurationBlock];
}

- (ModuleTransitionBlock)filmTransitionBlock {
    return ^(id <RamblerViperModuleTransitionHandlerProtocol> sourceModuleTransitionHandler,
            id <RamblerViperModuleTransitionHandlerProtocol> destinationModuleTransitionHandler) {
        UIViewController *destinationViewController = (id) destinationModuleTransitionHandler;
        UITabBarController *tabBarController = [((id) sourceModuleTransitionHandler) tabBarController];
        tabBarController.selectedIndex = 1;
        UINavigationController *navigationController = [tabBarController selectedViewController];
        [navigationController pushViewController:destinationViewController animated:NO];
    };
}

- (RamblerViperModuleLinkBlock)filmDetailsConfigurationBlockWith:(FilmPlainObject *)film {
    return ^id <RamblerViperModuleOutput>(id <FilmDetailsModuleInput> moduleInput) {
        [moduleInput configureModuleWithFilm:film];
        return nil;
    };
}

@end
