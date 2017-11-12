//
//  FilmDetailsViewController.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FilmDetailsViewInput.h"
#import "FilmDetailsDataDisplayManager.h"

@protocol FilmDetailsViewOutput;

@interface FilmDetailsViewController : UIViewController <FilmDetailsViewInput, FilmDetailsDataDisplayManagerDelegate>

@property (nonatomic, strong) id<FilmDetailsViewOutput> output;

@property (nonatomic, strong) FilmDetailsDataDisplayManager *dataDisplayManager;
@end
