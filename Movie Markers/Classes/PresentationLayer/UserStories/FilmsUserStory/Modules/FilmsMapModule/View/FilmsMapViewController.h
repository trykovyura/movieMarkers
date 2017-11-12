//
//  FilmsMapViewController.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FilmsMapViewInput.h"
@import GoogleMaps;

@protocol FilmsMapViewOutput;

@interface FilmsMapViewController : UIViewController <FilmsMapViewInput>

@property (nonatomic, strong) id<FilmsMapViewOutput> output;

@property (strong, nonatomic) IBOutlet GMSMapView *mapView;

@end
