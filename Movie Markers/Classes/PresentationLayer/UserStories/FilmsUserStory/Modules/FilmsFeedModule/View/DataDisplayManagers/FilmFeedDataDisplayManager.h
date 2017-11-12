//
// Created by Юрий Трыков on 04.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataDisplayManager.h"

@class FilmFeedCellObjectBuilder;
@class FilmPlainObject;

@protocol FilmFeedDataDisplayManagerDelegate <NSObject>

- (void)didTapFilm:(NSString *)filmID;

@end
@interface FilmFeedDataDisplayManager : NSObject<DataDisplayManager>

@property (nonatomic, strong) FilmFeedCellObjectBuilder *cellObjectBuilder;

@property(nonatomic, weak) id <FilmFeedDataDisplayManagerDelegate> delegate;

- (void)configureDataDisplayManagerWithFilms:(NSArray <FilmPlainObject *> *)films;

@end