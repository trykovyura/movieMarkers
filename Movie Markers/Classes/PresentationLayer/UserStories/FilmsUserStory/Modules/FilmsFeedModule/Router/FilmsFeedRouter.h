//
//  FilmsFeedRouter.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsFeedRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface FilmsFeedRouter : NSObject <FilmsFeedRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
