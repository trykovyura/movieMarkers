//
// Created by Юрий Трыков on 06.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JsonArrayConverter <NSObject>

/**
 * Преобразует ответ от сервера в NSArray
 * Когда в ответе список объектов
 * @param response ответ от сервера
 * @return список
 */
- (NSArray *)convertArrayFromJson:(id)json;

@end