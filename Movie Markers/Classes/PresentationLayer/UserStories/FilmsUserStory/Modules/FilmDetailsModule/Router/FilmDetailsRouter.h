//
//  FilmDetailsRouter.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmDetailsRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface FilmDetailsRouter : NSObject <FilmDetailsRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
