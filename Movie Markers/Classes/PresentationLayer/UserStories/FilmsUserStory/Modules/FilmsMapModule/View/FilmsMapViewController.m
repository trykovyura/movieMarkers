//
//  FilmsMapViewController.m
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import "FilmsMapViewController.h"
#import "FilmsMapViewOutput.h"
#import "CustomInfoWindow.h"
#import "MarkerPlainObject.h"
#import "UIView+WebCache.h"
#import "UIImageView+WebCache.h"

@interface FilmsMapViewController () <GMSMapViewDelegate>

@property(nonatomic) NSArray<GMSMarker *> *markers;

@end

@implementation FilmsMapViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output didTriggerViewReadyEvent];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.output didTriggerViewWillAppearEvent];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.mapView clear];
}

#pragma mark - Методы FilmsMapViewInput

- (void)setupInitialState {
    [self configureMapView];
}

// Create a GMSCameraPosition that tells the map to display the
- (void)configureMapView {
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:22.03570
                                                            longitude:-83.83563
                                                                 zoom:0];
    self.mapView.camera = camera;
    self.mapView.myLocationEnabled = YES;
    self.mapView.settings.myLocationButton = YES;
    self.mapView.delegate = self;
}

- (void)configureMarkers:(NSArray *)markers {
    [self.mapView clear];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    UIImage *markerImage = [UIImage imageNamed:@"marker"];
    for (MarkerPlainObject *marker in markers) {
        // Creates a marker in the center of the map.
        GMSMarker *gmsMarker = [[GMSMarker alloc] init];
        gmsMarker.position = CLLocationCoordinate2DMake([marker.latitude doubleValue], [marker.longitude doubleValue]);
        gmsMarker.title = marker.name;
        gmsMarker.snippet = marker.location;
        gmsMarker.map = self.mapView;
        gmsMarker.userData = marker;
        gmsMarker.icon = markerImage;
        gmsMarker.tracksInfoWindowChanges = YES; // update after image download
        [array addObject:gmsMarker];
    }
    self.markers = [array copy];
}

- (void)mapView:(GMSMapView *)mapView didLongPressInfoWindowOfMarker:(GMSMarker *)marker {
    NSString *filmID = ((MarkerPlainObject *) marker.userData).filmID;
    [self.output didSelectFilm:filmID];
}

- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
    CustomInfoWindow *infoWindow = [[NSBundle mainBundle] loadNibNamed:@"CustomInfoWindow" owner:nil options:nil][0];
    MarkerPlainObject *place = (MarkerPlainObject *) marker.userData;
    infoWindow.title.text = place.name;
    infoWindow.adress.text = place.location;
    [infoWindow.image sd_setShowActivityIndicatorView:YES];
    [infoWindow.image sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [infoWindow.image sd_setImageWithURL:[self.output obtainPosterUrl:place.filmID]
                        placeholderImage:nil
                                 options:SDWebImageRefreshCached];
    infoWindow.image.contentMode = UIViewContentModeScaleAspectFit;
    return infoWindow;
}

- (void)selectPlace:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude {
    for (GMSMarker *marker in self.markers) {
        MarkerPlainObject *markerPlace = (MarkerPlainObject *) marker.userData;
        if ([markerPlace.latitude compare:latitude] == NSOrderedSame
                && [markerPlace.longitude compare:longitude] == NSOrderedSame) {
            self.mapView.selectedMarker = marker;
            GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[latitude doubleValue]
                                                                    longitude:[longitude doubleValue]
                                                                         zoom:0];
            self.mapView.camera = camera;
            return;
        }
    }
}


@end
