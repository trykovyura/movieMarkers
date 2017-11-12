//
//  FilmsMapRouter.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsMapRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface FilmsMapRouter : NSObject <FilmsMapRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
