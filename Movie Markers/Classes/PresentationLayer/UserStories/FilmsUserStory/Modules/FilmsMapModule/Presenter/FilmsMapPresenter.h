//
//  FilmsMapPresenter.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsMapViewOutput.h"
#import "FilmsMapInteractorOutput.h"
#import "FilmsMapModuleInput.h"

@protocol FilmsMapViewInput;
@protocol FilmsMapInteractorInput;
@protocol FilmsMapRouterInput;

@interface FilmsMapPresenter : NSObject <FilmsMapModuleInput, FilmsMapViewOutput, FilmsMapInteractorOutput>

@property (nonatomic, weak) id<FilmsMapViewInput> view;
@property (nonatomic, strong) id<FilmsMapInteractorInput> interactor;
@property (nonatomic, strong) id<FilmsMapRouterInput> router;

@end
