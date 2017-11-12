//
//  FilmDetailsViewController.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmDetailsViewController.h"

#import "FilmDetailsViewOutput.h"
#import "MarkerPlainObject.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"
#import "UIView+WebCache.h"
#import "FilmPlainObject.h"
#import "Constants.h"
@import GoogleMobileAds;

@interface FilmDetailsViewController ()

@property(strong, nonatomic) IBOutlet UIImageView *imageView;
@property(strong, nonatomic) IBOutlet GADBannerView *bannerView;
@property(strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FilmDetailsViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы FilmDetailsViewInput

- (void)setupInitialState {
    [self configureTableView];
    [self configureBanner];
}

- (void)configureTableView {
    [self.tableView setSectionIndexColor:[UIColor greenColor]];
    self.tableView.estimatedRowHeight = 44.0;
    self.dataDisplayManager.delegate = self;
    self.tableView.delegate = [self.dataDisplayManager delegateForTableView:self.tableView
                                                           withBaseDelegate:nil];
    self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
}

- (void)configureBanner {
    self.bannerView.adUnitID = kAdUnitId;
    self.bannerView.adSize = kGADAdSizeSmartBannerPortrait;
    self.bannerView.rootViewController = self;
    GADRequest *request = [GADRequest request];
    request.testDevices = @[kGADSimulatorID];
    [self.bannerView loadRequest:request];
}

- (void)configureWithFilm:(FilmPlainObject *)film markers:(NSArray *)markers posterURL:(NSURL *)posterURL {
    [self.imageView sd_setShowActivityIndicatorView:YES];
    [self.imageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.imageView sd_setImageWithURL:posterURL
                      placeholderImage:nil
                               options:SDWebImageRefreshCached];
    self.navigationItem.title = film.nameRU;
    [self.dataDisplayManager configureDataDisplayManagerWithFilm:film markers:markers];
    self.tableView.dataSource = [self.dataDisplayManager dataSourceForTableView:self.tableView];
    [self.tableView reloadData];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.output didTriggerViewWillAppear];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


#pragma mark - FilmDetailsDataDisplayManagerDelegate

- (void)didTapMarker:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude {
    [self.output didTapMarker:latitude longitude:longitude];
}


@end
