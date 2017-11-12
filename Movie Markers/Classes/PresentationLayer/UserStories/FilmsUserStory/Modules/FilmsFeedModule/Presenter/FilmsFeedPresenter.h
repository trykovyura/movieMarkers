//
//  FilmsFeedPresenter.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsFeedViewOutput.h"
#import "FilmsFeedInteractorOutput.h"
#import "FilmsFeedModuleInput.h"

@protocol FilmsFeedViewInput;
@protocol FilmsFeedInteractorInput;
@protocol FilmsFeedRouterInput;

@interface FilmsFeedPresenter : NSObject <FilmsFeedModuleInput, FilmsFeedViewOutput, FilmsFeedInteractorOutput>

@property (nonatomic, weak) id<FilmsFeedViewInput> view;
@property (nonatomic, strong) id<FilmsFeedInteractorInput> interactor;
@property (nonatomic, strong) id<FilmsFeedRouterInput> router;

@end
