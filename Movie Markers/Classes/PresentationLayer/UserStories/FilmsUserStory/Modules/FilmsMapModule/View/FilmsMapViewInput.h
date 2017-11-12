//
//  FilmsMapViewInput.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FilmsMapViewInput <NSObject>

/**
 @author trykov

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;
- (void)configureMarkers:(NSArray *)markers;
- (void)selectPlace:(NSDecimalNumber *)latitude longitude:(NSDecimalNumber *)longitude;

@end
