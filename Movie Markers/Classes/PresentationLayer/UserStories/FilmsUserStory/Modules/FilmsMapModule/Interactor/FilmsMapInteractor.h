//
//  FilmsMapInteractor.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsMapInteractorInput.h"

@protocol FilmsMapInteractorOutput;
@protocol FilmService;

@interface FilmsMapInteractor : NSObject <FilmsMapInteractorInput>

@property (nonatomic, weak) id<FilmsMapInteractorOutput> output;

@property (nonatomic, strong) id<FilmService> filmService;

@end
