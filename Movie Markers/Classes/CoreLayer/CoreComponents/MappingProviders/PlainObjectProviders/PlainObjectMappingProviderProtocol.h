//
// Created by Юрий Трыков on 05.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EKObjectMapping;

@protocol PlainObjectMappingProviderProtocol <NSObject>

- (EKObjectMapping *)mappingForPlainObjectClass:(Class)plainObjectClass;
@end