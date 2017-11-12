//
//  FilmDetailsInteractor.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmDetailsInteractorInput.h"

@protocol FilmDetailsInteractorOutput;
@protocol FilmService;

@interface FilmDetailsInteractor : NSObject <FilmDetailsInteractorInput>

@property (nonatomic, weak) id<FilmDetailsInteractorOutput> output;

@property (nonatomic, strong) id<FilmService> filmService;

@end
