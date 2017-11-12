//
//  FilmsFeedViewController.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FilmsFeedViewInput.h"
#import "FilmFeedDataDisplayManager.h"

@protocol FilmsFeedViewOutput;
@class FilmFeedDataDisplayManager;
@class FilmPlainObject;

@interface FilmsFeedViewController : UIViewController <FilmsFeedViewInput, FilmFeedDataDisplayManagerDelegate>

@property (nonatomic, strong) id<FilmsFeedViewOutput> output;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) FilmFeedDataDisplayManager *dataDisplayManager;

@end
