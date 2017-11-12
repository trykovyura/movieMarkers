//
//  FilmsFeedViewController.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsFeedViewController.h"
#import "FilmsFeedViewOutput.h"
#import "FilmPlainObject.h"

@interface FilmsFeedViewController () <UISearchResultsUpdating>

@property UISearchController *searchController;

@end

@implementation FilmsFeedViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы FilmsFeedViewInput

- (void)setupInitialState:(NSArray *)films {
    [self setupSearchController];
    self.tableView.estimatedRowHeight = 44.0;
    [self.dataDisplayManager configureDataDisplayManagerWithFilms:films];
    self.dataDisplayManager.delegate = self;
    self.tableView.delegate = [self.dataDisplayManager delegateForTableView:self.tableView
                                                           withBaseDelegate:nil];
    self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
}

- (void)configureWithFilms:(NSArray *)films {
    [self.dataDisplayManager configureDataDisplayManagerWithFilms:films];
    self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
    [self.tableView reloadData];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

/**
 * Настройка поиска
 */
- (void)setupSearchController {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.definesPresentationContext = YES;
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar setValue:NSLocalizedString(@"cancel", nil) forKey:@"_cancelButtonText"];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = searchController.searchBar.text;
    [self.output didTriggerSearchEvent:searchString];
}

- (void)didTapFilm:(NSString *)filmID {
    [self.output didSelectFilm:filmID];
}


@end
