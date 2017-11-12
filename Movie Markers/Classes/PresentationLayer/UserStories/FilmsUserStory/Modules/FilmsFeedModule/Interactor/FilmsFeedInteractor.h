//
//  FilmsFeedInteractor.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsFeedInteractorInput.h"

@protocol FilmsFeedInteractorOutput;
@protocol FilmService;

@interface FilmsFeedInteractor : NSObject <FilmsFeedInteractorInput>

@property (nonatomic, weak) id<FilmsFeedInteractorOutput> output;

@property (nonatomic, strong) id<FilmService> filmService;

@end
