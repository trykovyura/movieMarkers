//
// Created by Юрий Трыков on 16.10.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataDisplayManager.h"

@class FilmPlainObject;
@class FilmDetailsCellObjectBuilder;

@protocol FilmDetailsDataDisplayManagerDelegate <NSObject>

- (void)didTapMarker:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude;

@end

@interface FilmDetailsDataDisplayManager : NSObject <DataDisplayManager>

@property (nonatomic, strong) FilmDetailsCellObjectBuilder *cellObjectBuilder;

@property(nonatomic, weak) id <FilmDetailsDataDisplayManagerDelegate> delegate;

- (void)configureDataDisplayManagerWithFilm:(FilmPlainObject *)film markers:(NSArray *)markers;

@end