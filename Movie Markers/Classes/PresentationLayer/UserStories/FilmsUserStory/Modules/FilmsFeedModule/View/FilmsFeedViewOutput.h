//
//  FilmsFeedViewOutput.h
//  Movie Markers
//
//  Created by trykov on 08/10/2017.
//  Copyright © 2017 trykov.ru. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FilmPlainObject;

@protocol FilmsFeedViewOutput <NSObject>

/**
 @author trykov

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

- (void)didSelectFilm:(NSString *)filmID;

- (void)didTriggerSearchEvent:(NSString *)searchString;
@end
