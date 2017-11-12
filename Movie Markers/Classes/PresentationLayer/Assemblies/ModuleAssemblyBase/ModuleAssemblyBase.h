//
// Created by Юрий Трыков on 05.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@protocol ServiceComponents;

@interface ModuleAssemblyBase : TyphoonAssembly

@property (nonatomic, strong, readonly) TyphoonAssembly <ServiceComponents> *serviceComponents;

@end