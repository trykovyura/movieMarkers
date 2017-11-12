//
//  FilmsMapModuleInput.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol FilmsMapModuleInput <RamblerViperModuleInput>

/**
 @author trykov

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude;

@end
