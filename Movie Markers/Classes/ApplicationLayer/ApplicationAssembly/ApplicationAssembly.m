//
// Created by Юрий Трыков on 12.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "ApplicationAssembly.h"
#import "AppDelegate.h"
#import "ApplicationConfiguratorImplementation.h"


@implementation ApplicationAssembly

/**
 * Конфигурирование AppDelegate приложения
 * Добавление прокси делегатов
 */
- (RamblerAppDelegateProxy *)applicationDelegateProxy {
    return [TyphoonDefinition withClass:[RamblerAppDelegateProxy class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectMethod:@selector(addAppDelegates:)
                                            parameters:^(TyphoonMethod *method) {
                                                [method injectParameterWith:@[[self appDelegate]]];
                                            }];
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

- (AppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[AppDelegate class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(applicationConfigurator)
                                                    with:[self applicationConfigurator]];
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

- (id <ApplicationConfigurator>)applicationConfigurator {
    return [TyphoonDefinition withClass:[ApplicationConfiguratorImplementation class]];
}

@end