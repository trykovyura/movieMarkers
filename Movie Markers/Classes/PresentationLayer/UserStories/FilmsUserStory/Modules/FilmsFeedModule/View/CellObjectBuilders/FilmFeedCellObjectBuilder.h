//
// Created by Юрий Трыков on 04.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FilmPlainObject;


@interface FilmFeedCellObjectBuilder : NSObject
- (NSArray *)cellObjectsForFilms:(NSArray <FilmPlainObject *> *)films;
@end