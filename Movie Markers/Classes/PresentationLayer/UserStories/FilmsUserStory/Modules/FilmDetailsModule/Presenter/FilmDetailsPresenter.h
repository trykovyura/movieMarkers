//
//  FilmDetailsPresenter.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmDetailsViewOutput.h"
#import "FilmDetailsInteractorOutput.h"
#import "FilmDetailsModuleInput.h"

@protocol FilmDetailsViewInput;
@protocol FilmDetailsInteractorInput;
@protocol FilmDetailsRouterInput;

@interface FilmDetailsPresenter : NSObject <FilmDetailsModuleInput, FilmDetailsViewOutput, FilmDetailsInteractorOutput>

@property (nonatomic, weak) id<FilmDetailsViewInput> view;
@property (nonatomic, strong) id<FilmDetailsInteractorInput> interactor;
@property (nonatomic, strong) id<FilmDetailsRouterInput> router;

@end
