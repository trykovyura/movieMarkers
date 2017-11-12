//
// Created by Юрий Трыков on 06.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import "ApplicationConfiguratorImplementation.h"
@import GoogleMaps;

#error Register for API Key and insert here. Then delete this line.
#define MP_GOOGLE_KEY @""

@implementation ApplicationConfiguratorImplementation

- (void)configureInitialSettings {
    [GMSServices provideAPIKey:MP_GOOGLE_KEY];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

@end